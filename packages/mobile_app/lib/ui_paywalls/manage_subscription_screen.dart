import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/use_monetization_type.dart';
import 'package:mobile_app/ui_paywalls/2024_monthly_subscription_paywall.dart';

class ManageSubscriptionScreen extends HookWidget {
  const ManageSubscriptionScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final (:activeSubscription) = useActiveSubscription(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalizedMap(
            value: {
              languages.en: 'Manage Subscription',
              languages.it: 'Gestisci Abbonamento',
              languages.ru: 'Управление подпиской',
            },
          ).getValue(locale),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (activeSubscription != null) ...[
                _SubscriptionInfoCard(
                  subscription: activeSubscription,
                  locale: locale,
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        _manageSubscription(context, activeSubscription),
                    child: Text(
                      LocalizedMap(
                        value: {
                          languages.en: 'Manage Subscription',
                          languages.it: 'Gestisci Abbonamento',
                          languages.ru: 'Управлять подпиской',
                        },
                      ).getValue(locale),
                    ),
                  ),
                ),
              ] else
                Center(
                  child: Text(
                    LocalizedMap(
                      value: {
                        languages.en: 'No active subscription',
                        languages.it: 'Nessun abbonamento attivo',
                        languages.ru: 'Нет активной подписки',
                      },
                    ).getValue(locale),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _manageSubscription(
    final BuildContext context,
    final PurchaseDetails subscription,
  ) {
    // Implement the logic to manage the subscription
    // This could open a web page or navigate to a store-specific
    //management screen
    unawaited(
      context
          .read<SubscriptionManager>()
          .purchaseManager
          .openSubscriptionManagement(),
    );
  }
}

class _SubscriptionInfoCard extends StatelessWidget {
  const _SubscriptionInfoCard({
    required this.subscription,
    required this.locale,
  });

  final PurchaseDetails subscription;
  final Locale locale;

  @override
  Widget build(final BuildContext context) => Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Current Subscription',
                    languages.it: 'Abbonamento Attuale',
                    languages.ru: 'Текущая подписка',
                  },
                ).getValue(locale),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              _SubscriptionDetailItem(
                title: LocalizedMap(
                  value: {
                    languages.en: 'Plan:',
                    languages.it: 'Piano:',
                    languages.ru: 'План:',
                  },
                ).getValue(locale),
                value: subscription.name.whenEmptyUse(
                  getSubscriptionPaywallTitle(
                    subscription.duration,
                    locale,
                  ),
                ),
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
                    languages.en: 'Next Renewal:',
                    languages.it: 'Prossimo Rinnovo:',
                    languages.ru: 'Следующее продление:',
                  },
                ).getValue(locale),
                value: _formatDate(subscription.expiryDate, locale),
              ),
            ],
          ),
        ),
      );

  String _formatDate(final DateTime? date, final Locale locale) {
    if (date == null) return 'N/A';
    final formatter = DateFormat.yMMMd(locale.toString());
    return formatter.format(date);
  }
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
