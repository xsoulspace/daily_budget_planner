import 'package:flutter/material.dart';

import '../src/purchases/abstract_purchase_manager.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({required this.purchaseManager, super.key});
  final AbstractPurchaseManager purchaseManager;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Purchase Options')),
        body: FutureBuilder<List<AvailableOneTimePurchase>>(
          // ignore: discarded_futures
          future: purchaseManager.getAvailableOneTimePurchases(),
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
                  subtitle: Text('\$${purchase.price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final result =
                          await purchaseManager.purchaseOneTimePurchase(
                        OneTimePurchaseDetails(
                          id: purchase.id,
                          name: purchase.name,
                          price: purchase.price,
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
