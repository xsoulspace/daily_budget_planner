import 'package:mobile_app/common_imports.dart';

class ThanksForSubscribingScreen extends StatelessWidget {
  const ThanksForSubscribingScreen({
    required this.subscription,
    super.key,
  });

  final PurchaseProductDetails subscription;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Gap(32),
              Assets.images.paywalls.goldSnowflake.image(
                height: 80,
                width: 80,
              ),
              const Gap(24),
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Thank You for Subscribing!',
                    languages.it: 'Grazie per esserti abbonato!',
                    languages.ru: 'Спасибо за подписку!',
                  },
                ).getValue(locale),
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(16),
              Text(
                LocalizedMap(
                  value: {
                    languages.en:
                        'Your contribution helps us improve this product and deliver more value to you.',
                    languages.it:
                        'Il tuo contributo ci aiuta a migliorare questo prodotto e offrirti più valore.',
                    languages.ru:
                        'Ваш вклад помогает нам улучшать этот продукт и предоставлять вам больше ценности.',
                  },
                ).getValue(locale),
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              _FeatureCard(
                icon: Icons.star,
                title: LocalizedMap(
                  value: {
                    languages.en: 'All PRO Content Unlocked',
                    languages.it: 'Tutti i contenuti PRO sbloccati',
                    languages.ru: 'Весь PRO контент разблокирован',
                  },
                ).getValue(locale),
                description: LocalizedMap(
                  value: {
                    languages.en:
                        'Enjoy full access to all premium features and content.',
                    languages.it:
                        "Goditi l'accesso completo a tutte le funzionalità e i contenuti premium.",
                    languages.ru:
                        'Наслаждайтесь полным доступом ко всем премиум-функциям и контенту.',
                  },
                ).getValue(locale),
              ),
              const Gap(24),
              _SubscriptionInfoCard(
                subscription: subscription,
                locale: locale,
              ),
              const Gap(32),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the main app
                  Navigator.of(context)
                      .popUntil((final route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text(
                  LocalizedMap(
                    value: {
                      languages.en: 'Start Using PRO Features',
                      languages.it: 'Inizia a usare le funzionalità PRO',
                      languages.ru: 'Начать использовать PRO функции',
                    },
                  ).getValue(locale),
                  style: context.textTheme.titleLarge?.copyWith(
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
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(final BuildContext context) => Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 48, color: context.colorScheme.primary),
              const Gap(16),
              Text(
                title,
                style: context.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              Text(
                description,
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}

class _SubscriptionInfoCard extends StatelessWidget {
  const _SubscriptionInfoCard({
    required this.subscription,
    required this.locale,
  });

  final PurchaseProductDetails subscription;
  final Locale locale;

  @override
  Widget build(final BuildContext context) => Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Your Subscription Plan',
                    languages.it: 'Il tuo piano di abbonamento',
                    languages.ru: 'Ваш план подписки',
                  },
                ).getValue(locale),
                style: context.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(16),
              _SubscriptionDetailItem(
                title: LocalizedMap(
                  value: {
                    languages.en: 'Plan:',
                    languages.it: 'Piano:',
                    languages.ru: 'План:',
                  },
                ).getValue(locale),
                value: subscription.name,
              ),
              _SubscriptionDetailItem(
                title: LocalizedMap(
                  value: {
                    languages.en: 'Price:',
                    languages.it: 'Prezzo:',
                    languages.ru: 'Цена:',
                  },
                ).getValue(locale),
                value: subscription.formattedPrice,
              ),
              _SubscriptionDetailItem(
                title: LocalizedMap(
                  value: {
                    languages.en: 'Duration:',
                    languages.it: 'Durata:',
                    languages.ru: 'Продолжительность:',
                  },
                ).getValue(locale),
                value: _formatDuration(subscription.duration, locale),
              ),
            ],
          ),
        ),
      );
}

class _SubscriptionDetailItem extends StatelessWidget {
  const _SubscriptionDetailItem({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium,
            ),
            Text(
              value,
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}

String _formatDuration(final Duration duration, final Locale locale) {
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
