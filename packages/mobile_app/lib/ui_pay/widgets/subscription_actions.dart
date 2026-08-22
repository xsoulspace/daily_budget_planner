import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_pay/has_monetization.dart';
import 'package:mobile_app/ui_pay/monetization_products.dart';
import 'package:mobile_app/ui_pay/paywall_flow.dart';

class SubscriptionActions extends StatelessWidget with HasMonetization {
  const SubscriptionActions({super.key});

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final locale = useLocale(context);
    final paywallSelected = context
        .watch<PaywallSelectedSubscriptionResource>();
    final selectedProductDetails = paywallSelected.selectedProductDetails;
    final paywallError = context.watch<PurchasePaywallErrorResource>();

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (paywallError.hasError)
            _SubscriptionError(paywallError: paywallError),

          if (paywallSelected.isLoaded && selectedProductDetails != null)
            _SubscribeButton(selectedProductDetails: selectedProductDetails),

          const Gap(16),
          UiTextButton(
            textTitle: LocalizedMap(
              value: {
                languages.en: 'Continue Free',
                languages.it: 'Continua gratis',
                languages.ru: 'Продолжить бесплатно',
              },
            ).getValue(locale),
            onPressed: () => PaywallFlow.passPaywall(context),
          ),

          if (paywallSelected.isLoaded && selectedProductDetails != null) ...[
            const Gap(8),
            const _RestorePurchases(),
          ],
          const Gap(8),
        ],
      ),
    );
  }
}

class _SubscribeButton extends StatefulWidget {
  const _SubscribeButton({required this.selectedProductDetails});

  final PurchaseProductDetailsModel selectedProductDetails;

  @override
  State<_SubscribeButton> createState() => _SubscribeButtonState();
}

class _SubscribeButtonState extends State<_SubscribeButton>
    with HasMonetization {
  VoidCallback? _disposeListener;

  @override
  void initState() {
    super.initState();
    _disposeListener = PaywallFlow.listenResolvePendingThenRecheck(
      context: context,
    );
  }

  @override
  void dispose() {
    _disposeListener?.call();
    super.dispose();
  }

  Future<void> _subscribe({
    required final BuildContext context,
    required final PurchaseProductDetailsModel selectedProductDetails,
  }) async {
    await monetizationFoundation.subscribe(selectedProductDetails);
    // The pending-confirmation listener handles most paths, but on stores that
    // resolve straight to `subscribed` without ever flipping the pending flag,
    // explicitly re-run the navigation check so the user is never left on the
    // paywall after a successful purchase.
    if (!context.mounted) return;
    unawaited(
      PaywallFlow.checkSubscriptionStatus(
        context,
        shouldRedirectHomeWithoutSubscription: false,
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final subscriptionStatus = context.watch<SubscriptionStatusResource>();
    final isSubscribing = subscriptionStatus.isPurchasing;
    final isRestoring = subscriptionStatus.isRestoring;
    final hasFreeTrial = widget.selectedProductDetails.hasFreeTrial;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SubscriptionDisclosure(productDetails: widget.selectedProductDetails),
        const Gap(16),
        UiLoader(
          builder: (final context, final setLoading, final isLoading) =>
              UiTextButton(
                isLoading: isLoading || isSubscribing || isRestoring,
                textTitle: LocalizedMap(
                  value: {
                    languages.en: hasFreeTrial
                        ? 'START FREE TRIAL'
                        : 'SUBSCRIBE',
                    languages.it: hasFreeTrial
                        ? 'INIZIA PROVA GRATUITA'
                        : 'ISCRIVITI',
                    languages.ru: hasFreeTrial
                        ? 'НАЧАТЬ ПРОБНЫЙ ПЕРИОД'
                        : 'ПОДПИСАТЬСЯ',
                  },
                ).getValue(locale),
                onPressed: isRestoring
                    ? null
                    : () async {
                        setLoading(true);
                        try {
                          await _subscribe(
                            context: context,
                            selectedProductDetails:
                                widget.selectedProductDetails,
                          );
                        } finally {
                          setLoading(false);
                        }
                      },
              ),
        ),
      ],
    );
  }
}

class _RestorePurchases extends StatelessWidget with HasMonetization {
  const _RestorePurchases();

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final isRestoring = context.watch<SubscriptionStatusResource>().isRestoring;
    return UiLoader(
      builder: (final context, final setLoading, final isLoading) =>
          UiTextButton(
            isLoading: isLoading || isRestoring,
            textTitle: LocalizedMap(
              value: {
                languages.en: 'Restore',
                languages.it: 'Ripristina',
                languages.ru: 'Восстановить',
              },
            ).getValue(locale),
            onPressed: () async {
              setLoading(true);
              try {
                await monetizationFoundation.restore();
              } finally {
                setLoading(false);
              }
            },
          ),
    );
  }
}

class _SubscriptionDisclosure extends StatelessWidget {
  const _SubscriptionDisclosure({required this.productDetails});

  final PurchaseProductDetailsModel productDetails;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final theme = Theme.of(context);
    final priceText = productDetails.formattedPrice;

    final preset = MonetizationProducts.fromProductId(productDetails.productId);
    final title = preset?.title() ?? 'Budget Planner Premium';
    final length = preset?.lengthLabel() ?? '';
    final perPeriod = preset?.perPeriodLabel() ?? '';

    final lengthSentence = length.isEmpty
        ? LocalizedMap(
            value: {
              languages.en: 'Auto-renewing subscription.',
              languages.ru: 'Автоматически продлеваемая подписка.',
              languages.it: 'Abbonamento a rinnovo automatico.',
            },
          ).getValue(locale)
        : LocalizedMap(
            value: {
              languages.en: '$length auto-renewing subscription.',
              languages.ru: '$length, автоматически продлеваемая подписка.',
              languages.it: 'Abbonamento $length a rinnovo automatico.',
            },
          ).getValue(locale);

    final priceSentence = priceText.isEmpty
        ? ''
        : (perPeriod.isEmpty ? priceText : '$priceText $perPeriod.');

    final servicesSentence = LocalizedMap(
      value: {
        languages.en:
            'Full access to all premium planning features and updates.',
        languages.ru:
            'Полный доступ ко всем премиум-функциям планирования и обновлениям.',
        languages.it:
            'Accesso completo a tutte le funzionalità premium di pianificazione.',
      },
    ).getValue(locale);

    final renewalSentence = LocalizedMap(
      value: {
        languages.en:
            'Renews automatically until canceled in store settings at least 24 hours before the end of the current period.',
        languages.ru:
            'Продлевается автоматически, пока подписка не отменена в настройках магазина не позднее, чем за 24 часа до окончания текущего периода.',
        languages.it:
            "Si rinnova automaticamente finché non viene annullato nelle impostazioni dello store almeno 24 ore prima della fine del periodo corrente.",
      },
    ).getValue(locale);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(8),
          Text(lengthSentence, style: theme.textTheme.bodySmall),
          if (priceSentence.isNotEmpty) ...[
            const Gap(2),
            Text(priceSentence, style: theme.textTheme.bodySmall),
          ],
          const Gap(2),
          Text(servicesSentence, style: theme.textTheme.bodySmall),
          const Gap(8),
          Text(
            renewalSentence,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubscriptionError extends StatelessWidget {
  const _SubscriptionError({required this.paywallError});

  final PurchasePaywallErrorResource paywallError;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final errorMessage = paywallError.error;
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 23, color: theme.colorScheme.error),
            const Gap(12),
            Expanded(
              child: Text(
                LocalizedMap(
                  value: {
                    languages.en:
                        'Something went wrong. Please try again or restart the app.',
                    languages.ru:
                        'Что-то пошло не так. Пожалуйста, попробуйте снова или перезапустите приложение.',
                    languages.it:
                        'Qualcosa è andato storto. Riprova o riavvia l\'app.',
                  },
                ).getValue(locale),
                style: theme.textTheme.titleSmall,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const Gap(8),
        Text(
          errorMessage,
          style: theme.textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
