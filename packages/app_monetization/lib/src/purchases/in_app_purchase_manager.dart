import 'package:in_app_purchase/in_app_purchase.dart' as iap;

import 'abstract_purchase_manager.dart';

/// {@template in_app_purchase_manager}
/// Implementation of [AbstractPurchaseManager] using In-App Purchase.
/// {@endtemplate}
class InAppPurchaseManager implements AbstractPurchaseManager {
  final iap.InAppPurchase _inAppPurchase = iap.InAppPurchase.instance;

  @override
  Future<bool> isAvailable() => _inAppPurchase.isAvailable();

  @override
  Future<PurchaseResult> buyConsumable(final ConsumableDetails details) async {
    try {
      throw UnimplementedError();
      // final productDetails = await _getProductDetails(details.productId.value);
      // final purchaseParam = iap.PurchaseParam(productDetails: productDetails);
      // final success =
      //     await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
      // if (success) {
      //   return PurchaseResult.success(
      //     PurchaseDetails(
      //       purchaseId: PurchaseId(details.productId.value),
      //       productId: details.productId,
      //       name: details.name,
      //       price: details.price,
      //       currency: details.currency,
      //       purchaseDate: DateTime.now(),
      //     ),
      //   );
      // } else {
      //   return const PurchaseResult.failure('Purchase failed');
      // }
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseResult> buyNonConsumable(
    final NonConsumableDetails details,
  ) async {
    try {
      throw UnimplementedError();
      // final productDetails = await _getProductDetails(details.productId.value);
      // final purchaseParam = iap.PurchaseParam(productDetails: productDetails);
      // final success =
      //     await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      // if (success) {
      //   return PurchaseResult.success(
      //     PurchaseDetails(
      //       purchaseId: PurchaseId(details.productId.value),
      //       productId: details.productId,
      //       name: details.name,
      //       price: details.price,
      //       currency: details.currency,
      //       purchaseDate: DateTime.now(),
      //     ),
      //   );
      // } else {
      //   return const PurchaseResult.failure('Purchase failed');
      // }
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseResult> subscribe(final SubscriptionDetails details) async {
    try {
      throw UnimplementedError();
      // final productDetails = await _getProductDetails(details.productId.value);
      // final purchaseParam = iap.PurchaseParam(productDetails: productDetails);
      // final success =
      //     await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      // if (success) {
      //   return PurchaseResult.success(
      //     PurchaseDetails(
      //       purchaseId: PurchaseId(details.productId.value),
      //       productId: details.productId,
      //       name: details.name,
      //       price: details.price,
      //       currency: details.currency,
      //       purchaseDate: DateTime.now(),
      //       expiryDate: DateTime.now().add(details.duration),
      //     ),
      //   );
      // } else {
      //   return const PurchaseResult.failure('Subscription failed');
      // }
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<List<AvailableSubscription>> getSubscriptions() async {
    final productDetails = await _getProductDetails(null);
    return productDetails
        .where((final product) => product.id.startsWith('subscription_'))
        .map(
          (final product) => AvailableSubscription(
            productId: ProductId(product.id),
            name: product.title,
            price: product.rawPrice,
            currency: product.currencyCode,
            duration: _getDurationFromId(product.id),
          ),
        )
        .toList();
  }

  @override
  Future<List<AvailableConsumable>> getConsumables() async {
    final productDetails = await _getProductDetails(null);
    return productDetails
        .where((final product) => product.id.startsWith('consumable_'))
        .map(
          (final product) => AvailableConsumable(
            productId: ProductId(product.id),
            name: product.title,
            price: product.rawPrice,
            currency: product.currencyCode,
          ),
        )
        .toList();
  }

  @override
  Future<List<AvailableNonConsumable>> getNonConsumables() async {
    final productDetails = await _getProductDetails(null);
    return productDetails
        .where((final product) => product.id.startsWith('non_consumable_'))
        .map(
          (final product) => AvailableNonConsumable(
            productId: ProductId(product.id),
            name: product.title,
            price: product.rawPrice,
            currency: product.currencyCode,
          ),
        )
        .toList();
  }

  @override
  Future<void> openSubscriptionManagement() async {
    // This functionality might not be directly available in in_app_purchase package
    throw UnimplementedError();
  }

  @override
  Stream<PurchaseUpdate> get purchasesStream {
    throw UnimplementedError();
    // return _inAppPurchase.purchaseStream.map(
    //     (final purchaseDetails) => PurchaseUpdate(
    //       purchaseId: PurchaseId(purchaseDetails.purchaseID),
    //       status: _mapPurchaseStatus(purchaseDetails.status),
    //     ),
    //   );
  }

  @override
  Future<RestoreResult> restore() async {
    try {
      throw UnimplementedError();
      // final restoredPurchases = await _inAppPurchase.restorePurchases();
      // final restoredDetails = restoredPurchases
      //     .map(
      //       (final purchase) => PurchaseDetails(
      //         purchaseId: PurchaseId(purchase.purchaseID),
      //         productId: ProductId(purchase.productID),
      //         name: purchase.productID,
      //         price: 0, // Price not available in past purchases
      //         currency: '', // Currency not available in past purchases
      //         purchaseDate: purchase.transactionDate != null
      //             ? DateTime.fromMillisecondsSinceEpoch(
      //                 purchase.transactionDate!)
      //             : DateTime.now(),
      //       ),
      //     )
      //     .toList();
      // return RestoreResult.success(restoredDetails);
    } catch (e) {
      return RestoreResult.failure(e.toString());
    }
  }

  @override
  Future<CancelResult> cancel(final SubscriptionDetails details) async {
    // Cancellation might not be directly available in in_app_purchase package
    throw UnimplementedError();
  }

  Future<List<iap.ProductDetails>> _getProductDetails(
    final String? productId,
  ) async {
    final productDetailResponse =
        await _inAppPurchase.queryProductDetails({productId ?? ''});
    if (productDetailResponse.error != null) {
      throw productDetailResponse.error!;
    }
    return productDetailResponse.productDetails;
  }

  Duration _getDurationFromId(final String id) {
    if (id.contains('weekly')) return const Duration(days: 7);
    if (id.contains('monthly')) return const Duration(days: 30);
    if (id.contains('yearly')) return const Duration(days: 365);
    return const Duration(days: 30); // Default to monthly
  }

  PurchaseStatus _mapPurchaseStatus(final iap.PurchaseStatus status) {
    switch (status) {
      case iap.PurchaseStatus.pending:
        return PurchaseStatus.pending;
      case iap.PurchaseStatus.purchased:
        return PurchaseStatus.completed;
      case iap.PurchaseStatus.error:
        return PurchaseStatus.failed;
      case iap.PurchaseStatus.canceled:
        return PurchaseStatus.cancelled;
      case iap.PurchaseStatus.restored:
        return PurchaseStatus.completed;
    }
  }
}
