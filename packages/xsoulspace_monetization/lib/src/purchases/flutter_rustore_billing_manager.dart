// ignore_for_file: avoid_catches_without_on_clauses, lines_longer_than_80_chars

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_billing/flutter_rustore_billing.dart';
import 'package:flutter_rustore_billing/pigeons/rustore.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import 'purchase_manager.dart';

typedef DurationFromProductId = Duration Function(PurchaseProductId);

/// {@template flutter_rustore_billing_manager}
/// Implementation of [PurchaseManager] using RuStore Billing.
///
/// [consoleApplicationId] is the application id of the console application.
/// "123456",
/// [deeplinkScheme] is the deeplink scheme of the application.
/// "yourappscheme://iamback",
/// [enableLogger] is the flag to enable logger.
/// [productTypeChecker] is the function to check the product type
/// if it is returned from Rustore.
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
    this.productTypeChecker,
    final DurationFromProductId getDurationFromProductId =
        FlutterRustoreBillingManager.getDurationFromProductId,
  }) : _getDurationFromProductId = getDurationFromProductId;
  final String consoleApplicationId;
  final String deeplinkScheme;
  final DurationFromProductId _getDurationFromProductId;
  final bool enableLogger;

  /// [productTypeChecker] is the function to check the product type
  /// if it is returned from Rustore.
  final PurchaseProductType? Function(PurchaseProductId productId)?
      productTypeChecker;

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
    final List<PurchaseProductId> productIds,
  ) =>
      _getProducts(productIds, PurchaseProductType.subscription);

  @override
  Future<List<PurchaseProductDetails>> getConsumables(
    final List<PurchaseProductId> productIds,
  ) =>
      _getProducts(productIds, PurchaseProductType.consumable);

  @override
  Future<List<PurchaseProductDetails>> getNonConsumables(
    final List<PurchaseProductId> productIds,
  ) =>
      _getProducts(productIds, PurchaseProductType.nonConsumable);

  Future<List<PurchaseProductDetails>> _getProducts(
    final List<PurchaseProductId> productIds,
    final PurchaseProductType type,
  ) async {
    final productsResponse =
        await RustoreBillingClient.products(productIds.toJson());
    return productsResponse.products.nonNulls
        .where(
          (final product) =>
              PurchaseProductType.fromRustoreJson(
                json: product.productType,
                productId: PurchaseProductId(product.productId),
                productTypeChecker: productTypeChecker,
              ) ==
              type,
        )
        .map(_mapToPurchaseProductDetails)
        .toList();
  }

  PurchaseProductDetails _mapToPurchaseProductDetails(final Product product) {
    final productId = PurchaseProductId(product.productId);
    final duration = _getDurationFromProductId(productId);
    final freeTrialDuration = product.subscription?.freeTrialPeriod;
    final productType = PurchaseProductType.fromRustoreJson(
      json: product.productType,
      productId: productId,
      productTypeChecker: productTypeChecker,
    );
    return PurchaseProductDetails(
      productId: productId,
      productType: productType,
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
      final restoredPurchases = purchasesResponse.purchases.nonNulls
          .map(_mapToPurchaseDetails)
          .toList();
      return RestoreResult.success(restoredPurchases);
    } catch (e) {
      return RestoreResult.failure(e.toString());
    }
  }

  @override
  Future<PurchaseDetails> getPurchaseInfo(
    final PurchaseId purchaseId,
  ) async {
    final purchase = await RustoreBillingClient.purchaseInfo(purchaseId.value);
    return _mapToPurchaseDetails(purchase);
  }

  PurchaseDetails _mapToPurchaseDetails(final Purchase purchase) {
    final productId = PurchaseProductId(purchase.productId ?? '');
    final purchaseDate = _parsePurchaseDate(purchase.purchaseTime ?? '');
    final duration = _getDurationFromProductId(productId);
    final expiryDate = purchaseDate.add(duration);
    final purchaseType = PurchaseProductType.fromRustoreJson(
      json: purchase.productType,
      productId: productId,
      productTypeChecker: productTypeChecker,
    );
    return PurchaseDetails(
      status: PurchaseStatus.fromRustoreState(purchase.purchaseState),
      purchaseType: purchaseType,
      purchaseId: PurchaseId(purchase.purchaseId ?? ''),
      productId: productId,
      name: '',
      formattedPrice: purchase.amountLabel ?? '',
      price: doubleFromJson(purchase.amount ?? '0'),
      currency: purchase.currency ?? '',
      purchaseDate: purchaseDate,
      duration: duration,
      expiryDate: expiryDate,
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

  static Duration getDurationFromProductId(final PurchaseProductId id) {
    final parts = id.value.split('_');
    final unitIndex = parts
        .indexWhere((final part) => ['day', 'month', 'year'].contains(part));

    if (unitIndex == -1 || unitIndex + 1 >= parts.length) return Duration.zero;

    final unit = parts[unitIndex];
    final count = int.tryParse(parts[unitIndex + 1]) ?? 0;

    if (count == 0) return Duration.zero;

    return switch (unit) {
      'day' => Duration(days: count),
      'month' => Duration(days: count * 30),
      'year' => Duration(days: count * 365),
      _ => Duration.zero,
    };
  }

  @override
  Future<void> dispose() async {
    await _purchasesController.close();
  }
}

DateTime _parsePurchaseDate(final String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return DateTime.now();
  }

  try {
    // Check if the string is a numeric timestamp (milliseconds since epoch)
    if (RegExp(r'^\d+$').hasMatch(dateString)) {
      return DateTime.fromMillisecondsSinceEpoch(int.parse(dateString));
    }
    // Custom parsing for the specific format
    final parts = dateString.split(' ');
    if (parts.length == 6) {
      final month = _parseMonth(parts[1]);
      final day = int.parse(parts[2]);
      final timeParts = parts[3].split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final second = int.parse(timeParts[2]);
      final year = int.parse(parts[5]);

      // Parse timezone offset
      final tzOffset = _parseTzOffset(parts[4]);

      // Create DateTime in UTC
      final dateTime = DateTime.utc(year, month, day, hour, minute, second);

      // Adjust for timezone offset
      return dateTime.add(tzOffset);
    }

    // If the format doesn't match, try standard ISO 8601 format
    return DateTime.parse(dateString);
  } catch (e) {
    debugPrint('Error parsing date: $e');
    return DateTime.now();
  }
}

int _parseMonth(final String monthStr) {
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return months.indexOf(monthStr) + 1;
}

Duration _parseTzOffset(final String tzString) {
  final match = RegExp(r'GMT([+-])(\d{2}):(\d{2})').firstMatch(tzString);
  if (match != null) {
    final sign = match.group(1) == '+' ? 1 : -1;
    final hours = int.parse(match.group(2)!);
    final minutes = int.parse(match.group(3)!);
    return Duration(hours: sign * hours, minutes: sign * minutes);
  }
  return Duration.zero;
}
