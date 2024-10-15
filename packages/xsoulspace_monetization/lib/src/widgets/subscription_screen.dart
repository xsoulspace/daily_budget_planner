import 'package:flutter/material.dart';

import '../purchases/purchase_manager.dart';

/// {@template subscription_screen}
/// A widget that displays available subscriptions and allows
/// users to subscribe.
/// {@endtemplate}
class SubscriptionScreen extends StatelessWidget {
  /// {@macro subscription_screen}
  const SubscriptionScreen({
    required this.purchaseManager,
    required this.productIds,
    super.key,
  });

  /// The purchase manager to handle subscription operations.
  final PurchaseManager purchaseManager;
  final List<PurchaseProductId> productIds;
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Subscription Options')),
        body: FutureBuilder<List<PurchaseProductDetails>>(
          // ignore: discarded_futures
          future: purchaseManager.getSubscriptions(productIds),
          builder: (final context, final snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final subscriptions = snapshot.data ?? [];
            return ListView.builder(
              itemCount: subscriptions.length,
              itemBuilder: (final context, final index) {
                final subscription = subscriptions[index];
                return ListTile(
                  title: Text(subscription.name),
                  subtitle: Text(
                    '${subscription.price} ${subscription.currency} / ${subscription.duration.inDays} days',
                  ),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final result = await purchaseManager.subscribe(
                        subscription,
                      );
                      result.when(
                        success: (final _) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Subscription successful!'),
                          ),
                        ),
                        failure: (final error) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Subscription failed: $error'),
                          ),
                        ),
                      );
                    },
                    child: const Text('Subscribe'),
                  ),
                );
              },
            );
          },
        ),
      );
}
