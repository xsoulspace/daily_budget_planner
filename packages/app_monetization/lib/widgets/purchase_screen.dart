import 'package:flutter/material.dart';

import '../src/purchases/abstract_purchase_manager.dart';

/// {@template purchase_screen}
/// A widget that displays available one-time purchases and allows users
/// to buy them.
/// {@endtemplate}
class PurchaseScreen extends StatelessWidget {
  /// {@macro purchase_screen}
  const PurchaseScreen({required this.purchaseManager, super.key});

  /// The purchase manager to handle purchase operations.
  final AbstractPurchaseManager purchaseManager;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Purchase Options')),
        body: FutureBuilder<List<AvailableNonConsumable>>(
          // ignore: discarded_futures
          future: purchaseManager.getNonConsumables(),
          builder: (final context, final snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final purchases = snapshot.data ?? [];
            return ListView.builder(
              itemCount: purchases.length,
              itemBuilder: (final context, final index) {
                final purchase = purchases[index];
                return ListTile(
                  title: Text(purchase.name),
                  subtitle: Text('${purchase.price} ${purchase.currency}'),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final result = await purchaseManager.buyNonConsumable(
                        NonConsumableDetails(
                          productId: purchase.productId,
                          name: purchase.name,
                          price: purchase.price,
                          currency: purchase.currency,
                        ),
                      );
                      result.when(
                        success: (final _) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Purchase successful!')),
                        ),
                        failure: (final error) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Purchase failed: $error')),
                        ),
                      );
                    },
                    child: const Text('Buy'),
                  ),
                );
              },
            );
          },
        ),
      );
}
