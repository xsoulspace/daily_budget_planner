import 'package:in_app_purchase/in_app_purchase.dart' as iap;

import 'abstract_purchase_manager.dart';

/// {@template in_app_purchase_manager}
/// Implementation of [AbstractPurchaseManager] using In-App Purchase.
/// {@endtemplate}
class InAppPurchaseManager implements AbstractPurchaseManager {
  final iap.InAppPurchase _inAppPurchase = iap.InAppPurchase.instance;

  @override
  Future<PurchaseResult> purchaseSubscription(
    final SubscriptionDetails details,
  ) async {
    try {
      final productDetails = await _getProductDetails(details.id);
      final purchaseParam = iap.PurchaseParam(productDetails: productDetails);
      final success =
          await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      if (success) {
        return PurchaseResult.success(
          PurchaseDetails(
            id: details.id,
            name: details.name,
            price: details.price,
            purchaseDate: DateTime.now(),
            subscriptionId: details.id,
            expiryDate: DateTime.now().add(details.duration),
          ),
        );
      } else {
        return const PurchaseResult.failure('Purchase failed');
      }
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseResult> purchaseOneTimePurchase(
    final OneTimePurchaseDetails details,
  ) async {
    try {
      final productDetails = await _getProductDetails(details.id);
      final purchaseParam = iap.PurchaseParam(productDetails: productDetails);
      final success =
          await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
      if (success) {
        return PurchaseResult.success(
          PurchaseDetails(
            id: details.id,
            name: details.name,
            price: details.price,
            purchaseDate: DateTime.now(),
          ),
        );
      } else {
        return const PurchaseResult.failure('Purchase failed');
      }
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<List<AvailableSubscription>> getAvailableSubscriptions() async {
    final productDetails = await _getProductDetails(null);
    return productDetails
        .where((final product) => product.id.startsWith('subscription_'))
        .map(
          (final product) => AvailableSubscription(
            id: product.id,
            name: product.title,
            price: product.price,
            duration: _getDurationFromId(product.id),
          ),
        )
        .toList();
  }

  @override
  Future<List<AvailableOneTimePurchase>> getAvailableOneTimePurchases() async {
    final productDetails = await _getProductDetails(null);
    return productDetails
        .where((final product) => !product.id.startsWith('subscription_'))
        .map(
          (final product) => AvailableOneTimePurchase(
            id: product.id,
            name: product.title,
            price: product.price,
          ),
        )
        .toList();
  }

  @override
  Future<PurchaseDetails> getPurchaseDetails(final String purchaseId) async {
    final purchases = await _inAppPurchase.queryPastPurchases();
    final purchase =
        purchases.firstWhere((final p) => p.productID == purchaseId);
    return PurchaseDetails(
      id: purchase.purchaseID!,
      name: purchase.productID,
      price: 0, // Price not available in past purchases
      purchaseDate: purchase.transactionDate != null
          ? DateTime.fromMillisecondsSinceEpoch(purchase.transactionDate!)
          : DateTime.now(),
    );
  }

  @override
  Future<bool> restorePurchases() async {
    final result = await _inAppPurchase.restorePurchases();
    return result.notFoundIds.isEmpty;
  }

  Future<iap.ProductDetails> _getProductDetails(final String? productId) async {
    final productDetailResponse =
        await _inAppPurchase.queryProductDetails({productId ?? ''});
    if (productDetailResponse.error != null) {
      throw productDetailResponse.error!;
    }
    return productDetailResponse.productDetails.first;
  }

  Duration _getDurationFromId(final String id) {
    if (id.contains('weekly')) return const Duration(days: 7);
    if (id.contains('monthly')) return const Duration(days: 30);
    if (id.contains('yearly')) return const Duration(days: 365);
    return const Duration(days: 30); // Default to monthly
  }
}
