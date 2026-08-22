import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_pay/has_monetization.dart';
import 'package:mobile_app/ui_pay/monetization_products.dart';
import 'package:provider/provider.dart';

class ManageSubscriptionScreen extends StatelessWidget with HasMonetization {
  const ManageSubscriptionScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final subscription = context
        .watch<ActiveSubscriptionResource>()
        .subscription;
    final isActive = subscription.isPurchased;

    return Scaffold(
      appBar: UiAppBar(
        titleText: LocalizedMap(
          value: {
            languages.en: 'Manage Subscription',
            languages.it: 'Gestisci Abbonamento',
            languages.ru: 'Управление подпиской',
          },
        ).getValue(locale),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isActive) ...[
                _SubscriptionInfoCard(
                  subscription: subscription,
                  locale: locale,
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () => unawaited(
                      monetizationFoundation.openSubscriptionManagement(),
                    ),
                    child: Text(
                      LocalizedMap(
                        value: {
                          languages.en: 'Manage in Store',
                          languages.it: 'Gestisci nello Store',
                          languages.ru: 'Управлять в магазине',
                        },
                      ).getValue(locale),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: UiTextButton(
                    textTitle: LocalizedMap(
                      value: {
                        languages.en: 'Restore Purchases',
                        languages.it: 'Ripristina Acquisti',
                        languages.ru: 'Восстановить покупки',
                      },
                    ).getValue(locale),
                    onPressed: () =>
                        unawaited(monetizationFoundation.restore()),
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
}

class _SubscriptionInfoCard extends StatelessWidget {
  const _SubscriptionInfoCard({
    required this.subscription,
    required this.locale,
  });

  final PurchaseDetailsModel subscription;
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
            ).getValue(useLocale(context)),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _DetailItem(
            title: LocalizedMap(
              value: {
                languages.en: 'Plan:',
                languages.it: 'Piano:',
                languages.ru: 'План:',
              },
            ).getValue(useLocale(context)),
            value: subscription.name.whenEmptyUse(
              MonetizationProducts.fromProductId(
                    subscription.productId,
                  )?.title() ??
                  subscription.productId.value,
            ),
          ),
          _DetailItem(
            title: LocalizedMap(
              value: {
                languages.en: 'Price:',
                languages.it: 'Prezzo:',
                languages.ru: 'Цена:',
              },
            ).getValue(useLocale(context)),
            value: subscription.formattedPrice,
          ),
          _DetailItem(
            title: LocalizedMap(
              value: {
                languages.en: 'Next Renewal:',
                languages.it: 'Prossimo Rinnovo:',
                languages.ru: 'Следующее продление:',
              },
            ).getValue(useLocale(context)),
            value: subscription.expiryDate == null
                ? 'N/A'
                : DateFormat.yMMMd(
                    locale.toString(),
                  ).format(subscription.expiryDate!),
          ),
        ],
      ),
    ),
  );
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
