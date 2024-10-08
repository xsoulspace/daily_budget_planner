// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';

import 'package:flutter_rustore_billing/flutter_rustore_billing.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import 'abstract_purchase_manager.dart';

/// {@template flutter_rustore_billing_manager}
/// Implementation of [AbstractPurchaseManager] using RuStore Billing.
/// {@endtemplate}
class FlutterRustoreBillingManager implements AbstractPurchaseManager {
  @override
  Future<bool> isAvailable() async => RustoreBillingClient.available();

  @override
  Future<PurchaseResult> buyConsumable(final ConsumableDetails details) async {
    try {
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
          purchaseType: PurchaseType.consumable,
          purchaseId: PurchaseId(purchase.successPurchase!.purchaseId),
          productId: details.productId,
          name: details.name,
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
    final NonConsumableDetails details,
  ) async {
    // Implementation similar to buyConsumable
    try {
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
          purchaseType: PurchaseType.nonConsumable,
          productId: details.productId,
          name: details.name,
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
  Future<PurchaseResult> subscribe(final SubscriptionDetails details) async {
    try {
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
          purchaseType: PurchaseType.subscription,
          productId: details.productId,
          name: details.name,
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
  Future<List<AvailableSubscription>> getSubscriptions(
    final List<ProductId> productIds,
  ) async {
    final productsResponse =
        await RustoreBillingClient.products(productIds.toJson());
    return productsResponse.products
        .where(
          (final product) =>
              PurchaseType.fromRustoreJson(product?.productType) ==
              PurchaseType.subscription,
        )
        .map(
          (final product) => AvailableSubscription(
            productId: ProductId(product!.productId),
            name: product.title ?? '',
            price: doubleFromJson(product.price ?? '0'),
            currency: product.currency ?? '',
            duration: _getDurationFromId(product.productId),
          ),
        )
        .toList();
  }

  @override
  Future<List<AvailableConsumable>> getConsumables(
    final List<ProductId> productIds,
  ) async {
    final productsResponse =
        await RustoreBillingClient.products(productIds.toJson());
    return productsResponse.products
        .where(
          (final product) =>
              PurchaseType.fromRustoreJson(product?.productType) ==
              PurchaseType.consumable,
        )
        .map(
          (final product) => AvailableConsumable(
            productId: ProductId(product!.productId),
            name: product.title ?? '',
            price: double.tryParse(product.priceLabel ?? '0') ?? 0,
            currency: product.currency ?? '',
          ),
        )
        .toList();
  }

  @override
  Future<List<AvailableNonConsumable>> getNonConsumables(
    final List<ProductId> productIds,
  ) async {
    final productsResponse =
        await RustoreBillingClient.products(productIds.toJson());
    return productsResponse.products
        .where(
          (final product) =>
              PurchaseType.fromRustoreJson(product?.productType) ==
              PurchaseType.nonConsumable,
        )
        .map(
          (final product) => AvailableNonConsumable(
            productId: ProductId(product!.productId),
            name: product.title ?? '',
            price: double.tryParse(product.priceLabel ?? '0') ?? 0,
            currency: product.currency ?? '',
          ),
        )
        .toList();
  }

  @override
  Future<void> openSubscriptionManagement() async {
    // TODO: Implement subscription management opening for RuStore
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
              purchaseType: PurchaseType.fromRustoreJson(purchase?.productType),
              purchaseId: PurchaseId(purchase?.purchaseId ?? ''),
              productId: ProductId(purchase?.productId ?? ''),
              name: '',
              price: doubleFromJson(purchase?.amount ?? '0'),
              currency: purchase?.currency ?? '',
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
  Future<CancelResult> cancel(final SubscriptionDetails details) async {
    // TODO: Implement subscription cancellation for RuStore
    throw UnimplementedError();
  }

  Duration _getDurationFromId(final String id) {
    if (id.contains('weekly')) return const Duration(days: 7);
    if (id.contains('monthly')) return const Duration(days: 30);
    if (id.contains('yearly')) return const Duration(days: 365);
    return const Duration(days: 30); // Default to monthly
  }

  @override
  Future<void> dispose() async {
    await _purchasesController.close();
  }
}
