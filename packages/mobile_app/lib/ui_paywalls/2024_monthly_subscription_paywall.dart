// ignore_for_file: file_names, lines_longer_than_80_chars

import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/ui_paywalls.dart';

/// A widget that displays a paywall for monthly subscription plans.
///
/// This paywall showcases three subscription options: yearly, quarterly,
/// and monthly. It uses a clean, appealing design that matches the app's style
/// and includes bullet points highlighting the benefits of each plan.
class Ui2024MonthlySubscriptionPaywall extends HookWidget {
  const Ui2024MonthlySubscriptionPaywall({super.key});

  @override
  Widget build(final BuildContext context) {
    final subscriptions = [
      MonetizationProducts.s2024month1,
      MonetizationProducts.s2024month3,
      MonetizationProducts.s2024year,
      if (kDebugMode) MonetizationProducts.s2024day1Test,
    ];
    final planIndex = useState<int>(2);
    final locale = useLocale(context);
    final double imageHeight =
        math.min(MediaQuery.sizeOf(context).width * 0.5, 100);
    final textHeight = imageHeight * 0.5;
    final monetizationStatusNotifier =
        context.watch<MonetizationStatusNotifier>();
    final subscriptionManager = context.watch<SubscriptionManager>();

    Future<void> onBuyPressed() async {
      final subscribed = await subscriptionManager.subscribe(
        subscriptionManager.getSubscription(
          subscriptions[planIndex.value].productId,
        )!,
      );
      if (subscribed) {
        AppPathsController.of(context).toThanksForSubscribing();
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: CupertinoNavigationBarBackButton(
                  color: context.colorScheme.onSurface,
                ),
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    LocalizedMap(
                      value: {
                        languages.en: 'Unlock all features',
                        languages.it: 'Sblocca tutte le funzionalità',
                        languages.ru: 'Разблокируйте все функции',
                      },
                    ).getValue(locale),
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Gap(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      LocalizedMap(
                        value: {
                          languages.en: 'More ways to plan finances for you',
                          languages.it:
                              'Più modi per pianificare le tue finanze',
                          languages.ru:
                              'Больше способов планировать свои финансы',
                        },
                      ).getValue(locale),
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(8),
              UiDivider.size1(),
              const Gap(8),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _Block(
                              title: LocalizedMap(
                                value: {
                                  languages.en: 'early\nfeatures',
                                  languages.it: 'funzionalità\nanticipate',
                                  languages.ru: 'ранние\nфункции',
                                },
                              ).getValue(locale),
                              dimension: textHeight,
                            ),
                            _Block(
                              image: Assets.images.paywalls.earlyFeaturesCheck,
                              dimension: imageHeight,
                            ),
                            _Block(
                              title: LocalizedMap(
                                value: {
                                  languages.en: 'full access',
                                  languages.it: 'accesso completo',
                                  languages.ru: 'полный доступ',
                                },
                              ).getValue(locale),
                              dimension: textHeight,
                            ),
                            _Block(
                              image: Assets.images.paywalls.openSourceHands,
                              dimension: imageHeight,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _Block(
                              image: Assets.images.paywalls.ideas,
                              dimension: imageHeight,
                            ),
                            _Block(
                              title: LocalizedMap(
                                value: {
                                  languages.en: 'advanced customization',
                                  languages.it: 'personalizzazione avanzata',
                                  languages.ru: 'персональные настройки',
                                },
                              ).getValue(locale),
                              dimension: textHeight,
                            ),
                            _Block(
                              image: Assets.images.paywalls.fullAccessHands,
                              dimension: imageHeight,
                            ),
                            _Block(
                              title: LocalizedMap(
                                value: {
                                  languages.en: 'open source\nsupport',
                                  languages.it: 'supporto\nopen source',
                                  languages.ru:
                                      'поддержка\nоткрытого исходного кода',
                                },
                              ).getValue(locale),
                              dimension: textHeight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              UiDivider.size1(),
              const Gap(16),
              if (monetizationStatusNotifier.status
                  case MonetizationStatus.loading)
                UiCircularProgress()
              else if (monetizationStatusNotifier.isInitialized) ...[
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      const Gap(8),
                      ...List.generate(
                        subscriptions.length,
                        (final index) {
                          final productId = subscriptions[index].productId;
                          final subscription =
                              subscriptionManager.getSubscription(productId);
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index < subscriptions.length - 1 ? 16 : 8,
                            ),
                            child: _SubscriptionCard(
                              title: getSubscriptionPaywallTitle(
                                subscription?.duration ?? Duration.zero,
                                locale,
                              ),
                              subscription: subscription,
                              highlight: planIndex.value == index,
                              onPressed: () => planIndex.value = index,
                              locale: locale,
                            ),
                          );
                        },
                      ),
                      const Gap(8),
                    ],
                  ),
                ).animate(delay: 250.milliseconds).fadeIn(),
                const Gap(4),
                UiTextButton(
                  isLoading: subscriptionManager.isLoading,
                  onPressed: onBuyPressed,
                  title: Row(
                    children: [
                      Spacer(),
                      Text(
                        LocalizedMap(
                          value: {
                            languages.en: 'SUBSCRIBE',
                            languages.it: 'ISCRIVITI',
                            languages.ru: 'ПОДПИСАТЬСЯ',
                          },
                        ).getValue(locale),
                        style: context.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(8),
                      Assets.images.paywalls.goldSnowflake.image(
                        height: 40,
                        width: 40,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ] else if (monetizationStatusNotifier.status
                  case MonetizationStatus.storeNotAuthorized) ...[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    LocalizedMap(
                      value: {
                        languages.en:
                            'Please log in to the ${Envs.storeName} to continue',
                        languages.it:
                            'Si prega di accedere al ${Envs.storeName} per continuare',
                        languages.ru:
                            'Пожалуйста, войдите в ${Envs.storeName}, чтобы продолжить',
                      },
                    ).getValue(locale),
                    textAlign: TextAlign.center,
                    style: context.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (monetizationStatusNotifier.isInitialized)
                    Flexible(
                      child: UiTextButton(
                        textTitle: LocalizedMap(
                          value: {
                            languages.en: 'Restore',
                            languages.it: 'Ripristina',
                            languages.ru: 'Восстановить',
                          },
                        ).getValue(locale),
                        // TODO(arenukvern): add loader
                        onPressed: () async =>
                            context.read<PurchaseInitializer>().restore(),
                      ),
                    ),
                  Flexible(
                    child: UiTextButton(
                      textTitle: LocalizedMap(
                        value: {
                          languages.en: 'Terms',
                          languages.it: 'Termini',
                          languages.ru: 'Условия',
                        },
                      ).getValue(locale),
                      onPressed: () async =>
                          AppPathsController.of(context).toTerms(),
                    ),
                  ),
                  Flexible(
                    child: UiTextButton(
                      textTitle: LocalizedMap(
                        value: {
                          languages.en: 'Privacy',
                          languages.it: 'Privacy',
                          languages.ru: 'Конфиденциальность',
                        },
                      ).getValue(locale),
                      onPressed: () async =>
                          AppPathsController.of(context).toPrivacy(),
                    ),
                  ),
                ],
              ),
              const Gap(12),
            ],
          ),
        ),
      ),
    );
  }
}

String getSubscriptionPaywallTitle(
  final Duration duration,
  final Locale locale,
) {
  final days = duration.inDays;
  if (days >= 365) {
    final years = days ~/ 365;
    return LocalizedMap(
      value: {
        languages.en: '$years ${years == 1 ? 'year' : 'years'}',
        languages.it: '$years ${years == 1 ? 'anno' : 'anni'}',
        languages.ru: '$years ${years == 1 ? 'год' : 'лет'}',
      },
    ).getValue(locale);
  } else if (days >= 30) {
    final months = days ~/ 30;
    return LocalizedMap(
      value: {
        languages.en: '$months ${months == 1 ? 'month' : 'months'}',
        languages.it: '$months ${months == 1 ? 'mese' : 'mesi'}',
        languages.ru: '$months ${months == 1 ? 'месяц' : 'месяцев'}',
      },
    ).getValue(locale);
  } else {
    return LocalizedMap(
      value: {
        languages.en: '$days ${days == 1 ? 'day' : 'days'}',
        languages.it: '$days ${days == 1 ? 'giorno' : 'giorni'}',
        languages.ru: '$days ${days == 1 ? 'день' : 'дней'}',
      },
    ).getValue(locale);
  }
}

class UiTextButton extends StatelessWidget {
  const UiTextButton({
    required this.onPressed,
    this.textTitle = '',
    this.isLoading = false,
    this.title,
    super.key,
  });
  final String textTitle;
  final bool isLoading;
  final Widget? title;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => UiBaseButton(
        onPressed: isLoading ? () {} : onPressed,
        builder: (final context, final focused, final onlyFocused) => Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          color: Colors.transparent,
          child: isLoading ? UiCircularProgress() : (title ?? Text(textTitle)),
        ),
      );
}

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard({
    required this.subscription,
    required this.highlight,
    required this.onPressed,
    required this.title,
    required this.locale,
  });

  final PurchaseProductDetails? subscription;
  final bool highlight;
  final VoidCallback onPressed;
  final String title;
  final Locale locale;

  @override
  Widget build(final BuildContext context) {
    final subscription = this.subscription;
    if (subscription == null) return const SizedBox();
    return UiBaseButton(
      onPressed: onPressed,
      builder: (final context, final focused, final onlyFocused) =>
          AnimatedContainer(
        duration: 350.milliseconds,
        padding: EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: highlight
              ? context.colorScheme.primary
              : context.colorScheme.surface,
          borderRadius: BorderRadius.all(
            Radius.elliptical(
              UiDecorators.radiusMedium,
              UiDecorators.radiusMedium,
            ),
          ),
        ),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: highlight || focused
                ? context.colorScheme.onPrimary
                : context.colorScheme.onSurface,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(8),
              Text(
                title.toUpperCase(),
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: highlight || focused
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onSurface,
                ),
              ),
              Gap(32),
              Text(subscription.formattedPrice),
              Gap(2),
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'cancel anytime',
                    languages.it: 'annulla in qualsiasi momento',
                    languages.ru: 'отмена в любое время',
                  },
                ).getValue(locale),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Block extends StatelessWidget {
  const _Block({
    required this.dimension,
    this.title = '',
    this.image,
    super.key,
  });

  final String title;
  final AssetGenImage? image;
  final double dimension;

  @override
  Widget build(final BuildContext context) {
    if (title.isNotEmpty) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: dimension,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
    if (image == null) return SizedBox();

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: dimension,
      ),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: image?.image(
          width: dimension,
          height: dimension,
        ),
      ),
    );
  }
}
