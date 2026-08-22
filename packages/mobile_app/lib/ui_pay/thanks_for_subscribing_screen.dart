import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_pay/paywall_flow.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace_monetization_foundation/xsoulspace_monetization_foundation.dart';

/// {@template purchase_congrats_screen}
/// Congratulatory screen shown to users after successful purchase.
/// {@endtemplate}
class ThanksForSubscribingScreen extends StatelessWidget {
  /// {@macro purchase_congrats_screen}
  const ThanksForSubscribingScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final theme = Theme.of(context);
    final subscription = context
        .watch<ActiveSubscriptionResource>()
        .subscription;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Gap(32),
              Assets.images.paywalls.goldSnowflake.image(height: 80, width: 80),
              const Gap(24),
              Text(
                LocalizedMap({
                  languages.en: 'Thank You for Subscribing!',
                  languages.it: 'Grazie per esserti abbonato!',
                  languages.ru: 'Спасибо за подписку!',
                }).getValue(locale),
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(16),
              Text(
                LocalizedMap({
                  languages.en:
                      'Your contribution helps to make this app better.',
                  languages.it:
                      'Il tuo contributo ci aiuta a migliorare questo prodotto.',
                  languages.ru:
                      'Ваш вклад помогает делать это приложение лучше',
                }).getValue(locale),
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              if (subscription.purchaseId.isNotEmpty) ...[
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          LocalizedMap({
                            languages.en: 'Your Subscription Plan',
                            languages.it: 'Il tuo piano di abbonamento',
                            languages.ru: 'Ваш план подписки',
                          }).getValue(locale),
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(16),
                        _DetailItem(
                          title: LocalizedMap({
                            languages.en: 'Plan:',
                            languages.it: 'Piano:',
                            languages.ru: 'План:',
                          }).getValue(locale),
                          value: subscription.name.whenEmptyUse(
                            subscription.productId.value,
                          ),
                        ),
                        _DetailItem(
                          title: LocalizedMap({
                            languages.en: 'Price:',
                            languages.it: 'Prezzo:',
                            languages.ru: 'Цена:',
                          }).getValue(locale),
                          value: subscription.formattedPrice,
                        ),
                        if (subscription.expiryDate != null)
                          _DetailItem(
                            title: LocalizedMap({
                              languages.en: 'Next Renewal:',
                              languages.it: 'Prossimo Rinnovo:',
                              languages.ru: 'Следующее продление:',
                            }).getValue(locale),
                            value: _formatDate(
                              subscription.expiryDate!,
                              locale,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const Gap(32),
              ],
              ElevatedButton(
                onPressed: () async {
                  await PaywallFlow.handleSubscriptionSuccess(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: Text(
                  LocalizedMap({
                    languages.en: 'Start Using PRO Features!',
                    languages.it: 'Inizia a usare le funzionalità PRO!',
                    languages.ru: 'Начать использовать PRO функции!',
                  }).getValue(locale),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(final DateTime date, final Locale locale) {
    final formatter = DateFormat.yMMMd(locale.toString());
    return formatter.format(date);
  }
}

class _DetailItem extends StatelessWidget {
  const _DetailItem({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(final BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.titleMedium),
        Flexible(
          child: Text(
            value,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
