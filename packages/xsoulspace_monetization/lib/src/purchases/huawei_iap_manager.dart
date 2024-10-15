// ignore_for_file: avoid_catches_without_on_clauses

import 'package:flutter/foundation.dart';
import 'package:huawei_iap/huawei_iap.dart';

import 'purchase_manager.dart';

/// {@template huawei_iap_manager}
/// Implementation of [PurchaseManager] using Huawei IAP.
/// {@endtemplate}
class HuaweiIapManager implements PurchaseManager {
  HuaweiIapManager({
    this.isSandbox = false,
    this.enableLogger = false,
  });
  final bool isSandbox;
  final bool enableLogger;
  @override
  Future<bool> isAvailable() async {
    try {
      final result = await IapClient.isEnvReady();

      /// - `0`: Success
      /// - `1`: Failure
      /// - `404`: No resource found
      /// - `500`: Internal error
      return result.status?.statusCode == 0;
    } catch (e) {
      debugPrint('HuaweiIapManager.isAvailable: $e');
      return false;
    }
  }

  @override
  Future<bool> init() async {
    try {
      if (enableLogger) {
        await IapClient.enableLogger();
      }
      if (isSandbox) {
        final isSandbox = await IapClient.isSandboxActivated();
        if (isSandbox.isSandboxApk == true) {
          // ok
        } else {
          throw UnsupportedError('Sandbox is not available');
        }
      }
      return true;
    } catch (e) {
      debugPrint('HuaweiIapManager.init: $e');
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
      final result = await IapClient.consumeOwnedPurchase(
        ConsumeOwnedPurchaseReq(
          developerChallenge: dto.developerPayload,
          purchaseToken: dto.purchaseToken!,
          // reservedInfor: dto.reservedInfor,
        ),
      );
      if (result.returnCode == '0') {
        return const CompletePurchaseResult.success();
      } else {
        return CompletePurchaseResult.failure(
          'Failed to complete purchase: ${result.errMsg}',
        );
      }
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
      // final result = await IapClient.purchaseProduct(details.productId.value);
      // if (result.returnCode == OrderStatusCode.orderStateSuccess) {
      //   return PurchaseResult.success(
      //     PurchaseDetails(
      //       purchaseId: PurchaseId(result.inAppPurchaseData.orderId),
      //       productId: details.productId,
      //       name: details.name,
      //       price: details.price,
      //       currency: details.currency,
      //       purchaseDate: DateTime.fromMillisecondsSinceEpoch(
      //         result.inAppPurchaseData.purchaseTime,
      //       ),
      //     ),
      //   );
      // } else {
      //   return PurchaseResult.failure('Purchase failed: ${result.errMsg}');
      // }
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseResult> buyNonConsumable(
    final PurchaseProductDetails details,
  ) async {
    // Implementation similar to buyConsumable
    try {
      throw UnimplementedError();
      // final result = await IapClient.purchaseProduct(details.productId.value);
      // if (result.returnCode == OrderStatusCode.orderStateSuccess) {
      //   return PurchaseResult.success(
      //     PurchaseDetails(
      //       purchaseId: PurchaseId(result.inAppPurchaseData.orderId),
      //       productId: details.productId,
      //       name: details.name,
      //       price: details.price,
      //       currency: details.currency,
      //       purchaseDate: DateTime.fromMillisecondsSinceEpoch(
      //         result.inAppPurchaseData.purchaseTime,
      //       ),
      //     ),
      //   );
      // } else {
      //   return PurchaseResult.failure('Purchase failed: ${result.errMsg}');
      // }
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseResult> subscribe(final PurchaseProductDetails details) async {
    try {
      throw UnimplementedError();
      // final result = await IapClient.purchaseProduct(details.productId.value);
      // if (result.returnCode == OrderStatusCode.orderStateSuccess) {
      //   return PurchaseResult.success(
      //     PurchaseDetails(
      //       purchaseId: PurchaseId(result.inAppPurchaseData.orderId),
      //       productId: details.productId,
      //       name: details.name,
      //       price: details.price,
      //       currency: details.currency,
      //       purchaseDate: DateTime.fromMillisecondsSinceEpoch(
      //         result.inAppPurchaseData.purchaseTime,
      //       ),
      //       expiryDate: DateTime.fromMillisecondsSinceEpoch(
      //         result.inAppPurchaseData.expirationDate,
      //       ),
      //     ),
      //   );
      // } else {
      //   return PurchaseResult.failure('Subscription failed: ${result.errMsg}');
      // }
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<List<PurchaseProductDetails>> getSubscriptions(
    final List<PurchaseProductId> productIds,
  ) async {
    try {
      throw UnimplementedError();
      // final result = await IapClient.obtainProductInfo(
      //   ProductInfoReq(priceType: PriceType.priceTypeSubscription),
      // );
      // return result.productInfoList
      //     .map(
      //       (final product) => AvailableSubscription(
      //         productId: ProductId(product.productId),
      //         name: product.productName,
      //         price: double.parse(product.price),
      //         currency: product.currency,
      //         duration: _getDurationFromPeriod(product.subscriptionPeriod),
      //       ),
      //     )
      //     .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<PurchaseProductDetails>> getConsumables(
    final List<PurchaseProductId> productIds,
  ) async {
    try {
      throw UnimplementedError();
      // final result = await IapClient.obtainProductInfo(
      //   ProductInfoReq(priceType: PriceType.priceTypeConsumable),
      // );
      // return result.productInfoList
      //     .map(
      //       (final product) => AvailableConsumable(
      //         productId: ProductId(product.productId),
      //         name: product.productName,
      //         price: double.parse(product.price),
      //         currency: product.currency,
      //       ),
      //     )
      //     .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<PurchaseProductDetails>> getNonConsumables(
    final List<PurchaseProductId> productIds,
  ) async {
    try {
      throw UnimplementedError();
      // final result = await IapClient.obtainProductInfo(
      //   ProductInfoReq(priceType: PriceType.priceTypeNonconsumable),
      // );
      // return result.productInfoList
      //     .map(
      //       (final product) => AvailableNonConsumable(
      //         productId: ProductId(product.productId),
      //         name: product.productName,
      //         price: double.parse(product.price),
      //         currency: product.currency,
      //       ),
      //     )
      //     .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> openSubscriptionManagement() async {
    // await IapClient.showSubscriptionManagementPage();
    throw UnimplementedError();
  }

  @override
  Stream<PurchaseVerificationDto> get purchasesStream {
    // TODO: Implement purchase update stream for Huawei IAP
    throw UnimplementedError();
  }

  @override
  Future<RestoreResult> restore() async {
    try {
      throw UnimplementedError();
      // final result = await IapClient.obtainOwnedPurchases(OwnedPurchasesReq());
      // final restoredPurchases = result.inAppPurchaseDataList
      //     .map(
      //       (final purchase) => PurchaseDetails(
      //         purchaseId: PurchaseId(purchase.orderId),
      //         productId: ProductId(purchase.productId),
      //         name: purchase.productName,
      //         price: double.parse(purchase.price),
      //         currency: purchase.currency,
      //         purchaseDate:
      //             DateTime.fromMillisecondsSinceEpoch(purchase.purchaseTime),
      //         expiryDate: purchase.expirationDate != 0
      //             ? DateTime.fromMillisecondsSinceEpoch(purchase.expirationDate)
      //             : null,
      //       ),
      //     )
      //     .toList();
      // return RestoreResult.success(restoredPurchases);
    } catch (e) {
      return RestoreResult.failure(e.toString());
    }
  }

  @override
  Future<CancelResult> cancel(final PurchaseProductDetails details) async {
    try {
      throw UnimplementedError();
      // final result =
      //     await IapClient.cancelSubscription(details.productId.value);
      // if (result.returnCode == 0) {
      //   return const CancelResult.success();
      // } else {
      //   return CancelResult.failure('Cancellation failed: ${result.errMsg}');
      // }
    } catch (e) {
      return CancelResult.failure(e.toString());
    }
  }

  Duration _getDurationFromPeriod(final String period) {
    final regex = RegExp(r'P(\d+)([DWMY])');
    final match = regex.firstMatch(period);
    if (match != null) {
      final value = int.parse(match.group(1)!);
      final unit = match.group(2);
      switch (unit) {
        case 'D':
          return Duration(days: value);
        case 'W':
          return Duration(days: value * 7);
        case 'M':
          return Duration(days: value * 30);
        case 'Y':
          return Duration(days: value * 365);
      }
    }
    return const Duration(days: 30); // Default to monthly
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }
}
