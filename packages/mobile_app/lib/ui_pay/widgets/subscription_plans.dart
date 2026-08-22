import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/envs.dart';
import 'package:mobile_app/ui_pay/has_monetization.dart';
import 'package:mobile_app/ui_pay/monetization_products.dart';
import 'package:xsoulspace_installation_store/xsoulspace_installation_store.dart';
import 'package:xsoulspace_monetization_interface/xsoulspace_monetization_interface.dart';

/// {@template subscription_plans}
/// Widget that displays subscription plans with proper state handling.
/// Shows loading, error, and authorization states based on monetization
/// status.
/// {@endtemplate}
class SubscriptionPlans extends StatefulWidget {
  /// {@macro subscription_plans}
  const SubscriptionPlans({super.key});

  @override
  State<SubscriptionPlans> createState() => _SubscriptionPlansState();
}

class _SubscriptionPlansState extends State<SubscriptionPlans>
    with HasMonetization {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      final status = monetizationStoreStatusResource.status;
      if (status == MonetizationStoreStatus.loaded) {
        unawaited(
          monetizationFoundation.loadSubscriptions(
            productIds: MonetizationProducts.subscriptionsForBuild,
          ),
        );
      }
    });
  }

  void _selectPlan(final PurchaseProductId id) {
    final details = availableSubscriptionsResource.getSubscription(id);
    if (details == null) return;
    paywallSelectedSubscriptionResource.setSelectedProductId(
      selectedProductId: id,
      selectedProductDetails: details,
    );
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final monetizationStatus = context
        .watch<MonetizationStoreStatusResource>()
        .status;
    final paywallSelectedSubscriptionResource = context
        .watch<PaywallSelectedSubscriptionResource>();
    final subscriptionsResource = context
        .watch<AvailableSubscriptionsResource>();

    final selectedProductDetails =
        paywallSelectedSubscriptionResource.selectedProductDetails;

    // Handle RuStore authorization required.
    if (Envs.storeTarget == InstallationTargetStore.rustore &&
        monetizationStatus == MonetizationStoreStatus.userNotAuthorized) {
      return _buildRuStoreAuthRequiredState(locale);
    }

    if (monetizationStatus case MonetizationStoreStatus.notAvailable) {
      return _buildNotAvailableState(locale);
    }

    if (monetizationStatus == MonetizationStoreStatus.loading ||
        subscriptionsResource.subscriptions.isLoading ||
        selectedProductDetails == null) {
      return _buildLoadingState(locale);
    }

    if (subscriptionsResource.subscriptions.value.isEmpty) {
      return _buildPlansErrorState(locale);
    }

    return _buildPlansList(
      context: context,
      locale: locale,
      selectedProductId: paywallSelectedSubscriptionResource.selectedProductId,
      onSelect: _selectPlan,
    );
  }

  Widget _buildLoadingState(final Locale locale) => Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const Gap(12),
          Text(
            LocalizedMap({
              languages.en: 'Loading subscription plans…',
              languages.it: 'Caricamento dei piani…',
              languages.ru: 'Загрузка планов подписки…',
            }).getValue(locale),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );

  Widget _buildNotAvailableState(final Locale locale) => Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 48, color: context.colorScheme.error),
          const Gap(12),
          Text(
            LocalizedMap({
              languages.en: 'Subscriptions are not available on this device.',
              languages.it:
                  'Abbonamenti non disponibili su questo dispositivo.',
              languages.ru: 'Подписки недоступны на этом устройстве.',
            }).getValue(locale),
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    ),
  );

  Widget _buildRuStoreAuthRequiredState(final Locale locale) => Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 48,
            color: context.colorScheme.secondary,
          ),
          const Gap(12),
          Text(
            LocalizedMap({
              languages.en:
                  'Please log in to the ${Envs.storeName} to continue',
              languages.it:
                  'Si prega di accedere al ${Envs.storeName} per continuare',
              languages.ru:
                  'Пожалуйста, войдите в ${Envs.storeName}, чтобы продолжить',
            }).getValue(locale),
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(16),
          UiTextButton(
            textTitle: LocalizedMap({
              languages.en: 'Retry',
              languages.it: 'Riprova',
              languages.ru: 'Повторить',
            }).getValue(locale),
            onPressed: () => unawaited(
              monetizationFoundation.loadSubscriptions(
                productIds: MonetizationProducts.subscriptionsForBuild,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildPlansErrorState(final Locale locale) => Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 48, color: context.colorScheme.error),
          const Gap(12),
          Text(
            LocalizedMap({
              languages.en: 'No subscriptions found',
              languages.it: 'Nessun abbonamento trovato',
              languages.ru: 'Подписки не найдены',
            }).getValue(locale),
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium,
          ),
          const Gap(16),
          UiTextButton(
            textTitle: LocalizedMap({
              languages.en: 'Retry',
              languages.it: 'Riprova',
              languages.ru: 'Повторить',
            }).getValue(locale),
            onPressed: () => unawaited(
              monetizationFoundation.loadSubscriptions(
                productIds: MonetizationProducts.subscriptionsForBuild,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildPlansList({
    required final BuildContext context,
    required final Locale locale,
    required final PurchaseProductId selectedProductId,
    required final void Function(PurchaseProductId) onSelect,
  }) {
    final subscriptions = availableSubscriptionsResource.subscriptions.value;
    PurchaseProductDetailsModel productOf(final MonetizationProducts p) =>
        subscriptions.firstWhere(
          (final e) => e.productId == p.productId,
          orElse: () => PurchaseProductDetailsModel.empty,
        );

    final monthly = productOf(MonetizationProducts.s2024month1);
    final monthly3 = productOf(MonetizationProducts.s2024month3);
    final yearly = productOf(MonetizationProducts.s2024year);

    Widget card({
      required final MonetizationProducts preset,
      required final PurchaseProductDetailsModel product,
      required final String label,
      required final bool isBestValue,
    }) => PaywallPlanCard(
      product: product,
      label: label,
      selectedProductId: selectedProductId,
      productId: preset.productId,
      isBestValue: isBestValue,
      onSelect: onSelect,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (Envs.isTestPayments)
          card(
            preset: MonetizationProducts.s2024day1Test,
            product: productOf(MonetizationProducts.s2024day1Test),
            label: LocalizedMap({
              languages.en: '1 Day Test',
              languages.it: '1 Giorno Test',
              languages.ru: '1 День Тест',
            }).getValue(locale),
            isBestValue: false,
          ),
        card(
          preset: MonetizationProducts.s2024month1,
          product: monthly,
          label: LocalizedMap({
            languages.en: '1 Month',
            languages.it: '1 Mese',
            languages.ru: '1 Месяц',
          }).getValue(locale),
          isBestValue: false,
        ),
        const Gap(8),
        card(
          preset: MonetizationProducts.s2024month3,
          product: monthly3,
          label: LocalizedMap({
            languages.en: '3 Months',
            languages.it: '3 Mesi',
            languages.ru: '3 Месяца',
          }).getValue(locale),
          isBestValue: false,
        ),
        const Gap(8),
        card(
          preset: MonetizationProducts.s2024year,
          product: yearly,
          label: LocalizedMap({
            languages.en: '1 Year',
            languages.it: '1 Anno',
            languages.ru: '1 Год',
          }).getValue(locale),
          isBestValue: true,
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.autorenew,
              size: 18,
              color: context.colorScheme.onSurface,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                LocalizedMap({
                  languages.en: 'Recurring billing, cancel anytime.',
                  languages.it:
                      'Fatturazione ricorrente, annulla in qualsiasi momento.',
                  languages.ru:
                      'Регулярный платёж, можно отменить в любое время.',
                }).getValue(locale),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// {@template paywall_plan_card}
/// Selectable plan card showing duration label and formatted price.
/// {@endtemplate}
class PaywallPlanCard extends StatelessWidget {
  /// {@macro paywall_plan_card}
  const PaywallPlanCard({
    required this.product,
    required this.selectedProductId,
    required this.productId,
    required this.isBestValue,
    required this.onSelect,
    required this.label,
    super.key,
  });
  final PurchaseProductDetailsModel product;
  final PurchaseProductId selectedProductId;
  final PurchaseProductId productId;
  final bool isBestValue;
  final void Function(PurchaseProductId) onSelect;
  final String label;

  @override
  Widget build(final BuildContext context) {
    final isSelected = selectedProductId == productId;
    final price = product.formattedPrice;

    return GestureDetector(
      onTap: () => onSelect(productId),
      child: AnimatedContainer(
        duration: 300.milliseconds,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? context.colorScheme.primaryContainer.withValues(alpha: 0.1)
              : null,
        ),
        child: Row(
          children: [
            Radio<PurchaseProductId>(
              value: productId,
              groupValue: selectedProductId,
              onChanged: (final value) {
                if (value != null) onSelect(value);
              },
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (isBestValue) ...[
                        const Gap(8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            LocalizedMap({
                              languages.en: 'BEST VALUE',
                              languages.it: 'MIGLIORE OFFERTA',
                              languages.ru: 'ВЫГОДНО',
                            }).getValue(useLocale(context)),
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (product.freeTrialDuration.days > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Text(
                        '${product.freeTrialDuration.days} '
                        '${LocalizedMap({languages.en: 'days free trial', languages.it: 'giorni di prova gratuita', languages.ru: 'дней пробный период'}).getValue(useLocale(context))}',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  if (price.isNotEmpty)
                    Text(
                      price,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
