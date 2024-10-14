// ignore_for_file: file_names

import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
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
      MonetizationProducts.s2024day1Test,
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
        child: ListView(
          shrinkWrap: true,
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
                        languages.it: 'Più modi per pianificare le tue finanze',
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
            if (monetizationStatusNotifier.isInitialized) ...[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    const Gap(8),
                    _SubscriptionCard(
                      title: LocalizedMap(
                        value: {
                          languages.en: '1 month',
                          languages.it: '1 mese',
                          languages.ru: '1 месяц',
                        },
                      ),
                      subscription: subscriptionManager.getSubscription(
                        MonetizationProducts.s2024month1.productId,
                      ),
                      highlight: planIndex.value == 0,
                      onPressed: () => planIndex.value = 0,
                      locale: locale,
                    ),
                    const Gap(16),
                    _SubscriptionCard(
                      title: LocalizedMap(
                        value: {
                          languages.en: '3 months',
                          languages.it: '3 mesi',
                          languages.ru: '3 месяца',
                        },
                      ),
                      subscription: subscriptionManager.getSubscription(
                        MonetizationProducts.s2024month3.productId,
                      ),
                      highlight: planIndex.value == 1,
                      onPressed: () => planIndex.value = 1,
                      locale: locale,
                    ),
                    const Gap(16),
                    _SubscriptionCard(
                      title: LocalizedMap(
                        value: {
                          languages.en: '1 year',
                          languages.it: '1 anno',
                          languages.ru: '1 год',
                        },
                      ),
                      subscription: subscriptionManager.getSubscription(
                        MonetizationProducts.s2024year.productId,
                      ),
                      highlight: planIndex.value == 2,
                      onPressed: () => planIndex.value = 2,
                      locale: locale,
                    ),
                    const Gap(16),
                    _SubscriptionCard(
                      title: LocalizedMap(
                        value: {
                          languages.en: '1 day',
                          languages.it: '1 giorno',
                          languages.ru: '1 день',
                        },
                      ),
                      subscription: subscriptionManager.getSubscription(
                        MonetizationProducts.s2024day1Test.productId,
                      ),
                      highlight: planIndex.value == 3,
                      onPressed: () => planIndex.value = 3,
                      locale: locale,
                    ),
                    const Gap(8),
                  ],
                ),
              ),
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
                      onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Gap(12),
          ],
        ),
      ),
    );
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
  final LocalizedMap title;
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
                title.getValue(locale).toUpperCase(),
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
