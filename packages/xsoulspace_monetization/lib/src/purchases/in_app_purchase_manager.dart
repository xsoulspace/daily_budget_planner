// ignore_for_file: avoid_catches_without_on_clauses

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart' as iap;

import 'purchase_manager.dart';

/// {@template in_app_purchase_manager}
/// Implementation of [PurchaseManager] using In-App Purchase.
/// {@endtemplate}
class InAppPurchaseManager implements PurchaseManager {
  final iap.InAppPurchase _inAppPurchase = iap.InAppPurchase.instance;

  @override
  Future<bool> isAvailable() => _inAppPurchase.isAvailable();

  @override
  Future<bool> init() async {
    try {
      return await _inAppPurchase.isAvailable();
    } catch (e) {
      debugPrint('InAppPurchaseManager.init: $e');
      return false;
    }
  }

  @override
  Future<PurchaseDetails> getPurchaseInfo(final PurchaseId purchaseId) async {
    // final purchase = await IapClient.getOwnedPurchase(purchaseId.value);
    // return _mapToPurchaseDetails(purchase);
    throw UnimplementedError();
  }

  @override
  Future<CompletePurchaseResult> completePurchase(
    final PurchaseVerificationDto dto,
  ) async {
    try {
      await _inAppPurchase.completePurchase(
        iap.PurchaseDetails(
          purchaseID: dto.purchaseId.value,
          productID: dto.productId.value,
          transactionDate: dto.transactionDate?.toIso8601String(),
          status: dto.status.toFlutterIAPStatus(),
          verificationData: iap.PurchaseVerificationData(
            localVerificationData: dto.localVerificationData ?? '',
            serverVerificationData: dto.serverVerificationData ?? '',
            source: dto.source ?? '',
          ),
        ),
      );
      return const CompletePurchaseResult.success();
    } catch (e) {
      return CompletePurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseResult> buyConsumable(
    final PurchaseProductDetails details,
  ) async {
    try {
      throw UnimplementedError();
      // final productDetails = await _getProductDetails(details.productId.value);
      // final purchaseParam = iap.PurchaseParam(productDetails: productDetails);
      // final success = await _inAppPurchase.con(purchaseParam: purchaseParam);
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
    final PurchaseProductDetails details,
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
  Future<PurchaseResult> subscribe(final PurchaseProductDetails details) async {
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
  Future<List<PurchaseProductDetails>> getSubscriptions(
    final List<PurchaseProductId> productIds,
  ) async {
    final productDetails = await _getProductDetails(productIds);
    return productDetails
        .where((final product) => product.id.startsWith('subscription_'))
        .map(
          (final product) => PurchaseProductDetails(
            formattedPrice: product.price,
            productId: PurchaseProductId(product.id),
            productType: PurchaseProductType.subscription,
            name: product.title,
            price: product.rawPrice,
            currency: product.currencyCode,
            duration: _getDurationFromId(product.id),
          ),
        )
        .toList();
  }

  @override
  Future<List<PurchaseProductDetails>> getConsumables(
    final List<PurchaseProductId> productIds,
  ) async {
    final productDetails = await _getProductDetails(productIds);
    return productDetails
        .where((final product) => product.id.startsWith('consumable_'))
        .map(
          (final product) => PurchaseProductDetails(
            productId: PurchaseProductId(product.id),
            formattedPrice: product.price,
            productType: PurchaseProductType.consumable,
            name: product.title,
            price: product.rawPrice,
            currency: product.currencyCode,
          ),
        )
        .toList();
  }

  @override
  Future<List<PurchaseProductDetails>> getNonConsumables(
    final List<PurchaseProductId> productIds,
  ) async {
    final productDetails = await _getProductDetails(productIds);
    return productDetails
        .where((final product) => product.id.startsWith('non_consumable_'))
        .map(
          (final product) => PurchaseProductDetails(
            productId: PurchaseProductId(product.id),
            formattedPrice: product.price,
            productType: PurchaseProductType.nonConsumable,
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
  Stream<PurchaseVerificationDto> get purchasesStream {
    throw UnimplementedError();
    // return _inAppPurchase.purchaseStream.map(
    //   (final purchaseDetails) {
    //     return PurchaseUpdate(
    //       purchaseId: PurchaseId(purchaseDetails.purchaseID),
    //       productId: ProductId(purchaseDetails.productID),
    //       status: _mapPurchaseStatus(purchaseDetails.status),
    //     );
    //   },
    // );
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
  Future<CancelResult> cancel(final PurchaseProductDetails details) async {
    // Cancellation might not be directly available in in_app_purchase package
    throw UnimplementedError();
  }

  Future<List<iap.ProductDetails>> _getProductDetails(
    final List<PurchaseProductId> productIds,
  ) async {
    final productDetailResponse =
        await _inAppPurchase.queryProductDetails(productIds.toJson().toSet());
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
        return PurchaseStatus.purchased;
      case iap.PurchaseStatus.error:
        return PurchaseStatus.error;
      case iap.PurchaseStatus.canceled:
        return PurchaseStatus.canceled;
      case iap.PurchaseStatus.restored:
        return PurchaseStatus.restored;
    }
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }
}
