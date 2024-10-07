import 'package:flutter_rustore_billing/flutter_rustore_billing.dart';

import 'abstract_purchase_manager.dart';

/// {@template flutter_rustore_billing_manager}
/// Implementation of [AbstractPurchaseManager] using RuStore Billing.
/// {@endtemplate}
class FlutterRustoreBillingManager implements AbstractPurchaseManager {
  @override
  Future<PurchaseResult> purchaseSubscription(
    final SubscriptionDetails details,
  ) async {
    try {
      final purchase = await RustoreBillingClient.purchase(details.id, null);
      if (purchase.successPurchase == null) {
        return PurchaseResult.failure(
          'Purchase failed. ${purchase.invalidPurchase} '
          '${purchase.invalidInvoice}',
        );
      }
      return PurchaseResult.success(
        PurchaseDetails(
          id: purchase.successPurchase!.purchaseId,
          name: details.name,
          price: details.price,
          purchaseDate: DateTime.now(),
          subscriptionId: details.id,
          expiryDate: DateTime.now().add(details.duration),
        ),
      );
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseResult> purchaseOneTimePurchase(
    final OneTimePurchaseDetails details,
  ) async {
    try {
      final purchase = await RustoreBillingClient.purchase(details.id, null);
      if (purchase.successPurchase == null) {
        return PurchaseResult.failure(
          'Purchase failed. ${purchase.invalidPurchase} '
          '${purchase.invalidInvoice}',
        );
      }
      return PurchaseResult.success(
        PurchaseDetails(
          id: purchase.successPurchase!.purchaseId,
          name: details.name,
          price: details.price,
          purchaseDate: DateTime.now(),
        ),
      );
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<List<AvailableSubscription>> getAvailableSubscriptions() async {
    final productsResponse = await RustoreBillingClient.products([]);
    return productsResponse.products
        .where((final product) => product?.productType == 'subscription')
        .map(
          (final product) => AvailableSubscription(
            id: product!.productId,
            name: product.title ?? '',
            price: double.tryParse(product.priceLabel ?? '0') ?? 0,
            duration: _getDurationFromId(product.productId),
          ),
        )
        .toList();
  }

  @override
  Future<List<AvailableOneTimePurchase>> getAvailableOneTimePurchases() async {
    final productsResponse = await RustoreBillingClient.products([]);
    return productsResponse.products
        .where((final product) => product?.productType != 'subscription')
        .map(
          (final product) => AvailableOneTimePurchase(
            id: product!.productId,
            name: product.title ?? '',
            price: double.tryParse(product.priceLabel ?? '0') ?? 0,
          ),
        )
        .toList();
  }

  @override
  Future<PurchaseDetails> getPurchaseDetails(final String purchaseId) async {
    final purchaseInfo = await RustoreBillingClient.purchaseInfo(purchaseId);
    return PurchaseDetails(
      id: purchaseInfo.purchaseId ?? '',
      name: purchaseInfo.productId ?? '',
      price: double.tryParse(purchaseInfo.amountLabel ?? '0') ?? 0,
      purchaseDate:
          DateTime.tryParse(purchaseInfo.purchaseTime ?? '') ?? DateTime.now(),
    );
  }

  @override
  Future<bool> restorePurchases() async {
    try {
      final purchasesResponse = await RustoreBillingClient.purchases();
      return purchasesResponse.purchases.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Duration _getDurationFromId(final String id) {
    if (id.contains('weekly')) return const Duration(days: 7);
    if (id.contains('monthly')) return const Duration(days: 30);
    if (id.contains('yearly')) return const Duration(days: 365);
    return const Duration(days: 30); // Default to monthly
  }
}
