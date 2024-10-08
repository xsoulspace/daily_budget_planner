import 'package:flutter/material.dart';

import '../purchases/abstract_purchase_manager.dart';

/// {@template purchase_screen}
/// A widget that displays available one-time purchases and allows users
/// to buy them.
/// {@endtemplate}
class PurchaseScreen extends StatelessWidget {
  /// {@macro purchase_screen}
  const PurchaseScreen({
    required this.purchaseManager,
    required this.productIds,
    super.key,
  });

  /// The purchase manager to handle purchase operations.
  final AbstractPurchaseManager purchaseManager;
  final List<ProductId> productIds;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Purchase Options')),
        body: FutureBuilder<List<PurchaseProductDetails>>(
          // ignore: discarded_futures
          future: purchaseManager.getNonConsumables(productIds),
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
                        purchase,
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
