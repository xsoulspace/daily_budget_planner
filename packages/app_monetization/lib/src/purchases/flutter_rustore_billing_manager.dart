// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_billing/flutter_rustore_billing.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import 'abstract_purchase_manager.dart';

/// {@template flutter_rustore_billing_manager}
/// Implementation of [AbstractPurchaseManager] using RuStore Billing.
///
/// [consolApplicationId] is the application id of the console application.
/// "123456",
/// [deeplinkScheme] is the deeplink scheme of the application.
/// "yourappscheme://iamback",
/// [enableLogger] is the flag to enable logger.
///
/// https://www.rustore.ru/help/en/sdk/payments/flutter/6-1-0
/// {@endtemplate}
class FlutterRustoreBillingManager implements AbstractPurchaseManager {
  FlutterRustoreBillingManager({
    required this.consolApplicationId,
    required this.deeplinkScheme,
    this.enableLogger = false,
  });
  final String consolApplicationId;
  final String deeplinkScheme;
  final bool enableLogger;
  @override
  Future<bool> isAvailable() async => RustoreBillingClient.available();

  @override
  Future<bool> init() async {
    try {
      await RustoreBillingClient.initialize(
        consolApplicationId,
        deeplinkScheme,
        enableLogger,
      );
      return true;
    } catch (e) {
      debugPrint('FlutterRustoreBillingManager.init: $e');
      return false;
    }
  }

  @override
  Future<PurchaseResult> buyConsumable(
    final PurchaseProductDetails details,
  ) async {
    try {
      assert(
        details.productType == PurchaseProductType.consumable,
        'Product type must be consumable',
      );
      final purchase =
          await RustoreBillingClient.purchase(details.productId.value, null);
      if (purchase.successPurchase == null) {
        return PurchaseResult.failure(
          'Purchase failed. ${purchase.invalidPurchase} '
          '${purchase.invalidInvoice}',
        );
      }
      return PurchaseResult.success(
        PurchaseDetails(
          purchaseType: PurchaseProductType.consumable,
          purchaseId: PurchaseId(purchase.successPurchase!.purchaseId),
          productId: details.productId,
          name: details.name,
          formattedPrice: details.formattedPrice,
          price: details.price,
          currency: details.currency,
          purchaseDate: DateTime.now(),
        ),
      );
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
      assert(
        details.productType == PurchaseProductType.nonConsumable,
        'Product type must be non-consumable',
      );
      final purchase =
          await RustoreBillingClient.purchase(details.productId.value, null);
      if (purchase.successPurchase == null) {
        return PurchaseResult.failure(
          'Purchase failed. ${purchase.invalidPurchase} '
          '${purchase.invalidInvoice}',
        );
      }
      return PurchaseResult.success(
        PurchaseDetails(
          purchaseId: PurchaseId(purchase.successPurchase!.purchaseId),
          purchaseType: PurchaseProductType.nonConsumable,
          productId: details.productId,
          name: details.name,
          formattedPrice: details.formattedPrice,
          price: details.price,
          currency: details.currency,
          purchaseDate: DateTime.now(),
        ),
      );
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseResult> subscribe(final PurchaseProductDetails details) async {
    try {
      assert(
        details.productType == PurchaseProductType.subscription,
        'Product type must be subscription',
      );
      final purchase =
          await RustoreBillingClient.purchase(details.productId.value, null);
      if (purchase.successPurchase == null) {
        return PurchaseResult.failure(
          'Subscription failed. ${purchase.invalidPurchase} '
          '${purchase.invalidInvoice}',
        );
      }
      return PurchaseResult.success(
        PurchaseDetails(
          purchaseId: PurchaseId(purchase.successPurchase!.purchaseId),
          purchaseType: PurchaseProductType.subscription,
          productId: details.productId,
          name: details.name,
          formattedPrice: details.formattedPrice,
          price: details.price,
          currency: details.currency,
          purchaseDate: DateTime.now(),
          expiryDate: DateTime.now().add(details.duration),
        ),
      );
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<List<PurchaseProductDetails>> getSubscriptions(
    final List<ProductId> productIds,
  ) async {
    final productsResponse =
        await RustoreBillingClient.products(productIds.toJson());
    return productsResponse.products
        .where(
          (final product) =>
              PurchaseProductType.fromRustoreJson(product?.productType) ==
              PurchaseProductType.subscription,
        )
        .map(
          (final product) => PurchaseProductDetails(
            productId: ProductId(product!.productId),
            productType:
                PurchaseProductType.fromRustoreJson(product.productType),
            name: product.title ?? '',
            formattedPrice: product.priceLabel ?? '',
            description: product.description ?? '',
            price: doubleFromJson(product.price ?? '0'),
            currency: product.currency ?? '',
            duration: _getDurationFromId(product.productId),
          ),
        )
        .toList();
  }

  @override
  Future<List<PurchaseProductDetails>> getConsumables(
    final List<ProductId> productIds,
  ) async {
    final productsResponse =
        await RustoreBillingClient.products(productIds.toJson());
    return productsResponse.products
        .where(
          (final product) =>
              PurchaseProductType.fromRustoreJson(product?.productType) ==
              PurchaseProductType.consumable,
        )
        .map(
          (final product) => PurchaseProductDetails(
            productId: ProductId(product!.productId),
            productType:
                PurchaseProductType.fromRustoreJson(product.productType),
            name: product.title ?? '',
            formattedPrice: product.priceLabel ?? '',
            price: doubleFromJson(product.price ?? '0'),
            currency: product.currency ?? '',
            duration: _getDurationFromId(product.productId),
          ),
        )
        .toList();
  }

  @override
  Future<List<PurchaseProductDetails>> getNonConsumables(
    final List<ProductId> productIds,
  ) async {
    final productsResponse =
        await RustoreBillingClient.products(productIds.toJson());
    return productsResponse.products
        .where(
          (final product) =>
              PurchaseProductType.fromRustoreJson(product?.productType) ==
              PurchaseProductType.nonConsumable,
        )
        .map(
          (final product) => PurchaseProductDetails(
            productId: ProductId(product!.productId),
            productType:
                PurchaseProductType.fromRustoreJson(product.productType),
            name: product.title ?? '',
            formattedPrice: product.priceLabel ?? '',
            price: doubleFromJson(product.price ?? '0'),
            currency: product.currency ?? '',
            duration: _getDurationFromId(product.productId),
          ),
        )
        .toList();
  }

  @override
  Future<void> openSubscriptionManagement() async {
    /// TODO: open rustore app for subscription management
    throw UnimplementedError();
  }

  final _purchasesController = StreamController<PurchaseUpdate>.broadcast();
  @override
  Stream<PurchaseUpdate> get purchasesStream => _purchasesController.stream;

  @override
  Future<RestoreResult> restore() async {
    try {
      final purchasesResponse = await RustoreBillingClient.purchases();
      final restoredPurchases = purchasesResponse.purchases
          .map(
            (final purchase) => PurchaseDetails(
              purchaseType:
                  PurchaseProductType.fromRustoreJson(purchase?.productType),
              purchaseId: PurchaseId(purchase?.purchaseId ?? ''),
              productId: ProductId(purchase?.productId ?? ''),
              name: '',
              formattedPrice: purchase?.amountLabel ?? '',
              price: doubleFromJson(purchase?.amount ?? '0'),
              currency: purchase?.currency ?? '',

              /// verify format
              purchaseDate: DateTime.fromMillisecondsSinceEpoch(
                intFromJson(purchase?.purchaseTime ?? '0'),
              ),
            ),
          )
          .toList();
      return RestoreResult.success(restoredPurchases);
    } catch (e) {
      return RestoreResult.failure(e.toString());
    }
  }

  @override
  Future<CancelResult> cancel(final PurchaseProductDetails details) async {
    try {
      assert(
        details.productType == PurchaseProductType.subscription,
        'Product type must be subscription',
      );
      await RustoreBillingClient.deletePurchase(details.productId.value);
      return CancelResult.success();
    } catch (e) {
      return CancelResult.failure(e.toString());
    }
  }

  Duration _getDurationFromId(final String id) {
    if (id.endsWith('month_1')) return const Duration(days: 30);
    if (id.endsWith('month_3')) return const Duration(days: 90);
    if (id.endsWith('year_1')) return const Duration(days: 365);
    return const Duration(days: 30); // Default to monthly
  }

  @override
  Future<void> dispose() async {
    await _purchasesController.close();
  }
}
