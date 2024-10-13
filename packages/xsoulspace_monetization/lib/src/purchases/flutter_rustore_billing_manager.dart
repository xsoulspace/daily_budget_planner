// ignore_for_file: avoid_catches_without_on_clauses, lines_longer_than_80_chars

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_billing/flutter_rustore_billing.dart';
import 'package:flutter_rustore_billing/pigeons/rustore.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import 'purchase_manager.dart';

/// {@template flutter_rustore_billing_manager}
/// Implementation of [PurchaseManager] using RuStore Billing.
///
/// [consoleApplicationId] is the application id of the console application.
/// "123456",
/// [deeplinkScheme] is the deeplink scheme of the application.
/// "yourappscheme://iamback",
/// [enableLogger] is the flag to enable logger.
///
/// https://www.rustore.ru/help/en/sdk/payments/flutter/6-1-0
///
/// Testing || Sandbox Docs:
///
/// https://www.rustore.ru/help/developers/monetization/sandbox
///
/// Testing Bank Cards:
/// https://www.rustore.ru/help/developers/monetization/sandbox/test-bank-cards
/// {@endtemplate}
class FlutterRustoreBillingManager implements PurchaseManager {
  FlutterRustoreBillingManager({
    required this.consoleApplicationId,
    required this.deeplinkScheme,
    this.enableLogger = false,
  });
  final String consoleApplicationId;
  final String deeplinkScheme;
  final bool enableLogger;

  @override
  Future<bool> isAvailable() async => RustoreBillingClient.available();

  @override
  Future<bool> init() async {
    if (!Platform.isAndroid) return false;
    try {
      // https://www.rustore.ru/help/sdk/payments/flutter/6-1-0#deeplink
      final str = await RustoreBillingClient.initialize(
        consoleApplicationId,
        deeplinkScheme,
        enableLogger,
      );
      final available = await isAvailable();
      if (!available) return false;

      debugPrint(
        'FlutterRustoreBillingManager.init: $str available:$available',
      );
      return available;
    } catch (e) {
      debugPrint('FlutterRustoreBillingManager.init: $e');
      return false;
    }
  }

  @override
  Future<PurchaseResult> buyConsumable(
    final PurchaseProductDetails details,
  ) async =>
      _processPurchaseWithUpdate(details, PurchaseProductType.consumable);

  @override
  Future<PurchaseResult> buyNonConsumable(
    final PurchaseProductDetails details,
  ) async =>
      _processPurchaseWithUpdate(details, PurchaseProductType.nonConsumable);

  @override
  Future<PurchaseResult> subscribe(
    final PurchaseProductDetails details,
  ) async =>
      _processPurchaseWithUpdate(details, PurchaseProductType.subscription);

  Future<PurchaseResult> _processPurchaseWithUpdate(
    final PurchaseProductDetails details,
    final PurchaseProductType expectedType,
  ) async {
    final result = await _processPurchase(details, expectedType);
    final update = PurchaseVerificationDto(
      productType: expectedType,
      purchaseId: result.when(
        success: (final purchase) => purchase.purchaseId,
        failure: (final _) => PurchaseId(''),
      ),
      productId: details.productId,
      status: result.when(
        success: (final details) => details.status,
        failure: (final _) => PurchaseStatus.error,
      ),
    );
    _purchasesController.add(update);
    return result;
  }

  Future<PurchaseResult> _processPurchase(
    final PurchaseProductDetails details,
    final PurchaseProductType expectedType,
  ) async {
    try {
      assert(
        details.productType == expectedType,
        'Product type must be $expectedType',
      );
      final purchase =
          await RustoreBillingClient.purchase(details.productId.value, null);
      if (purchase.successPurchase == null) {
        return PurchaseResult.failure(
          'Purchase failed. ${purchase.invalidPurchase} ${purchase.invalidInvoice}',
        );
      }
      return PurchaseResult.success(
        PurchaseDetails(
          status: switch (expectedType) {
            PurchaseProductType.consumable => PurchaseStatus.restored,
            PurchaseProductType.nonConsumable ||
            PurchaseProductType.subscription =>
              PurchaseStatus.purchased,
          },
          purchaseId: PurchaseId(purchase.successPurchase!.purchaseId),
          purchaseType: expectedType,
          productId: details.productId,
          name: details.name,
          formattedPrice: details.formattedPrice,
          price: details.price,
          currency: details.currency,
          purchaseDate: DateTime.now(),
          expiryDate: expectedType == PurchaseProductType.subscription
              ? DateTime.now().add(details.duration)
              : null,
        ),
      );
    } catch (e) {
      return PurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<CompletePurchaseResult> completePurchase(
    final PurchaseVerificationDto dto,
  ) async {
    try {
      /// there is no confirmation for non-consumable purchases and subscriptions
      if (dto.productType != PurchaseProductType.consumable) {
        return const CompletePurchaseResult.success();
      }
      final result = await RustoreBillingClient.confirm(dto.purchaseId.value);
      if (result.success) {
        return const CompletePurchaseResult.success();
      } else {
        return CompletePurchaseResult.failure(
          'Failed to complete purchase: ${result.errorMessage}',
        );
      }
    } catch (e) {
      return CompletePurchaseResult.failure(e.toString());
    }
  }

  @override
  Future<List<PurchaseProductDetails>> getSubscriptions(
    final List<ProductId> productIds,
  ) =>
      _getProducts(productIds, PurchaseProductType.subscription);

  @override
  Future<List<PurchaseProductDetails>> getConsumables(
    final List<ProductId> productIds,
  ) =>
      _getProducts(productIds, PurchaseProductType.consumable);

  @override
  Future<List<PurchaseProductDetails>> getNonConsumables(
    final List<ProductId> productIds,
  ) =>
      _getProducts(productIds, PurchaseProductType.nonConsumable);

  Future<List<PurchaseProductDetails>> _getProducts(
    final List<ProductId> productIds,
    final PurchaseProductType type,
  ) async {
    final productsResponse =
        await RustoreBillingClient.products(productIds.toJson());
    return productsResponse.products
        .where(
          (final product) =>
              PurchaseProductType.fromRustoreJson(product?.productType) == type,
        )
        .map(_mapToPurchaseProductDetails)
        .toList();
  }

  PurchaseProductDetails _mapToPurchaseProductDetails(final Product? product) {
    final duration = _getDurationFromId(product?.productId ?? '');
    final freeTrialDuration = product?.subscription?.freeTrialPeriod;

    return PurchaseProductDetails(
      productId: ProductId(product!.productId),
      productType: PurchaseProductType.fromRustoreJson(product.productType),
      name: product.title ?? '',
      formattedPrice: product.priceLabel ?? '',
      price: doubleFromJson(product.price ?? '0'),
      currency: product.currency ?? '',
      duration: duration,
      freeTrialDuration: PurchaseDuration(
        years: freeTrialDuration?.years ?? 0,
        months: freeTrialDuration?.months ?? 0,
        days: freeTrialDuration?.days ?? 0,
      ),
    );
  }

  @override
  Future<void> openSubscriptionManagement() async {
    await launchUrlString('rustore://profile/subscriptions');
  }

  final _purchasesController =
      StreamController<PurchaseVerificationDto>.broadcast();
  @override
  Stream<PurchaseVerificationDto> get purchasesStream =>
      _purchasesController.stream;

  @override
  Future<RestoreResult> restore() async {
    try {
      final purchasesResponse = await RustoreBillingClient.purchases();
      final restoredPurchases =
          purchasesResponse.purchases.map(_mapToPurchaseDetails).toList();
      return RestoreResult.success(restoredPurchases);
    } catch (e) {
      return RestoreResult.failure(e.toString());
    }
  }

  PurchaseDetails _mapToPurchaseDetails(final Purchase? purchase) {
    final purchaseDate = DateTime.fromMillisecondsSinceEpoch(
      intFromJson(purchase?.purchaseTime ?? '0'),
    );
    final duration = _getDurationFromId(purchase?.productId ?? '');
    return PurchaseDetails(
      status: PurchaseStatus.fromRustoreState(purchase?.purchaseState),
      purchaseType: PurchaseProductType.fromRustoreJson(purchase?.productType),
      purchaseId: PurchaseId(purchase?.purchaseId ?? ''),
      productId: ProductId(purchase?.productId ?? ''),
      name: '',
      formattedPrice: purchase?.amountLabel ?? '',
      price: doubleFromJson(purchase?.amount ?? '0'),
      currency: purchase?.currency ?? '',
      purchaseDate: purchaseDate,
      duration: duration,
      expiryDate: purchaseDate.add(duration),
    );
  }

  @override
  Future<CancelResult> cancel(final PurchaseProductDetails details) async {
    try {
      assert(
        details.productType == PurchaseProductType.consumable,
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
