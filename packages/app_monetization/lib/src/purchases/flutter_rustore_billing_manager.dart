import 'package:flutter_rustore_billing/flutter_rustore_billing.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import 'abstract_purchase_manager.dart';

/// {@template flutter_rustore_billing_manager}
/// Implementation of [AbstractPurchaseManager] using RuStore Billing.
/// {@endtemplate}
class FlutterRustoreBillingManager implements AbstractPurchaseManager {
  @override
  Future<bool> isAvailable() async {
    // TODO: Implement availability check for RuStore
    return true;
  }

  @override
  Future<PurchaseResult> buyConsumable(final ConsumableDetails details) async {
    try {
      final purchase =
          await RustoreBillingClient.purchase(details.productId.value, null);
      if (purchase.successPurchase == null) {
        return PurchaseResult.failure(
          'Purchase failed. ${purchase.invalidPurchase} ${purchase.invalidInvoice}',
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
          'Purchase failed. ${purchase.invalidPurchase} ${purchase.invalidInvoice}',
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
          'Subscription failed. ${purchase.invalidPurchase} ${purchase.invalidInvoice}',
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
  Future<List<AvailableSubscription>> getSubscriptions() async {
    final productsResponse = await RustoreBillingClient.products([]);
    return productsResponse.products
        .where((final product) => product?.productType == 'subscription')
        .map(
          (final product) => AvailableSubscription(
            productId: ProductId(product!.productId),
            name: product.title ?? '',
            price: double.tryParse(product.priceLabel ?? '0') ?? 0,
            currency: product.currency ?? '',
            duration: _getDurationFromId(product.productId),
          ),
        )
        .toList();
  }

  @override
  Future<List<AvailableConsumable>> getConsumables() async {
    final productsResponse = await RustoreBillingClient.products([]);
    return productsResponse.products
        .where((final product) => product?.productType == 'consumable')
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
  Future<List<AvailableNonConsumable>> getNonConsumables() async {
    final productsResponse = await RustoreBillingClient.products([]);
    return productsResponse.products
        .where((final product) => product?.productType == 'non_consumable')
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

  @override
  Stream<PurchaseUpdate> get purchasesStream {
    // TODO: Implement purchase update stream for RuStore
    throw UnimplementedError();
  }

  @override
  Future<RestoreResult> restore() async {
    try {
      final purchasesResponse = await RustoreBillingClient.purchases();
      final restoredPurchases = purchasesResponse.purchases
          .map(
            (final purchase) => PurchaseDetails(
              purchaseType: PurchaseType.fromJson(purchase?.productType),
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
}
