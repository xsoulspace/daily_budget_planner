import 'package:mobile_app/common_imports.dart';

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
  PurchaseProductId get productId => PurchaseProductId(_productId);

  static final subscriptions = values
      .where((final e) => e.name.startsWith('s'))
      .map((final e) => e.productId)
      .toList();

  static PurchaseProductType? productTypeChecker(
    final PurchaseProductId productId,
  ) =>
      MonetizationProducts.subscriptions.contains(productId)
          ? PurchaseProductType.subscription
          : null;
}
