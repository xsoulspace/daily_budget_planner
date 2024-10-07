import 'package:flutter/material.dart';

import '../src/purchases/abstract_purchase_manager.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({required this.purchaseManager, super.key});
  final AbstractPurchaseManager purchaseManager;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Subscription Options')),
        body: FutureBuilder<List<AvailableSubscription>>(
          // ignore: discarded_futures
          future: purchaseManager.getAvailableSubscriptions(),
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
                    '\$${subscription.price.toStringAsFixed(2)} / ${subscription.duration.inDays} days',
                  ),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final result = await purchaseManager.purchaseSubscription(
                        SubscriptionDetails(
                          id: subscription.id,
                          name: subscription.name,
                          price: subscription.price,
                          duration: subscription.duration,
                        ),
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
