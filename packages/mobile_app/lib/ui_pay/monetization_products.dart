import 'package:flutter/foundation.dart';
import 'package:xsoulspace_monetization_interface/xsoulspace_monetization_interface.dart';

/// Prefixes:
/// s - subscription
/// c - consumable
/// n - non-consumable
enum MonetizationProducts {
  s2024year('2024_year_1'),
  s2024month3('2024_month_3'),
  s2024month1('2024_month_1'),
  s2024day1Test('2024_day_1_test');

  const MonetizationProducts(this._productId);
  final String _productId;
  PurchaseProductId get productId => PurchaseProductId.fromJson(_productId);

  static final subscriptions = values
      .where((final e) => e.name.startsWith('s'))
      .map((final e) => e.productId)
      .toList();

  /// Production paywall: monthly, 3-month and yearly only; excludes the
  /// test product.
  static List<PurchaseProductId> get subscriptionsForProduction => values
      .where(
        (final e) =>
            e.name.startsWith('s') && e != MonetizationProducts.s2024day1Test,
      )
      .map((final e) => e.productId)
      .toList();

  static List<PurchaseProductId> get subscriptionsForBuild =>
      kDebugMode ? subscriptions : subscriptionsForProduction;

  static PurchaseProductType? productTypeChecker(
    final PurchaseProductId productId,
  ) => MonetizationProducts.subscriptions.contains(productId)
      ? PurchaseProductType.subscription
      : null;

  static MonetizationProducts? fromProductId(final PurchaseProductId id) {
    for (final p in values) {
      if (p.productId == id) return p;
    }
    return null;
  }
}

/// User-facing disclosure labels (App Store guideline 3.1.2 style; also
/// useful on RuStore).
extension MonetizationProductsDisclosure on MonetizationProducts {
  String title() => switch (this) {
    MonetizationProducts.s2024month1 => 'Budget Planner Premium — Monthly',
    MonetizationProducts.s2024month3 => 'Budget Planner Premium — 3 Months',
    MonetizationProducts.s2024year => 'Budget Planner Premium — Yearly',
    MonetizationProducts.s2024day1Test =>
      'Budget Planner Premium — 1 Day (Test)',
  };

  String lengthLabel() => switch (this) {
    MonetizationProducts.s2024month1 => '1 month',
    MonetizationProducts.s2024month3 => '3 months',
    MonetizationProducts.s2024year => '1 year',
    MonetizationProducts.s2024day1Test => '1 day',
  };

  String perPeriodLabel() => switch (this) {
    MonetizationProducts.s2024month1 => 'per month',
    MonetizationProducts.s2024month3 => 'per 3 months',
    MonetizationProducts.s2024year => 'per year',
    MonetizationProducts.s2024day1Test => 'per day',
  };
}
