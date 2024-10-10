import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_manager.freezed.dart';
part 'purchase_manager.g.dart';

/// {@template product_id}
/// Represents a unique identifier for a product.
/// {@endtemplate}
extension type ProductId(String value) {
  factory ProductId.fromJson(final dynamic json) => ProductId(json.toString());
  String toJson() => value;
}

/// {@template product_list_x}
/// Extension on List<ProductId> to convert to JSON.
/// {@endtemplate}
extension ProductListX on List<ProductId> {
  List<String> toJson() =>
      map((final productId) => productId.toJson()).toSet().toList();
}

/// {@template purchase_id}
/// Represents a unique identifier for a purchase.
/// {@endtemplate}
extension type PurchaseId(String value) {
  factory PurchaseId.fromJson(final dynamic json) =>
      PurchaseId(json.toString());
  String toJson() => value;
}

@Freezed()
class PurchaseDuration with _$PurchaseDuration {
  const factory PurchaseDuration({
    @Default(0) final int years,
    @Default(0) final int months,
    @Default(0) final int days,
  }) = _PurchaseDuration;
  factory PurchaseDuration.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseDurationFromJson(json);
  const PurchaseDuration._();
  static const zero = PurchaseDuration();
  bool get isZero => years == 0 && months == 0 && days == 0;
  Duration get duration => Duration(days: days + (months * 30) + (years * 365));
}

/// {@template purchase_product_type}
/// Represents the type of a purchasable product.
/// {@endtemplate}
enum PurchaseProductType {
  consumable,
  nonConsumable,
  subscription;

  factory PurchaseProductType.fromRustoreJson(final dynamic json) =>
      switch (json) {
        'NON_CONSUMABLE' => PurchaseProductType.nonConsumable,
        'CONSUMABLE' => PurchaseProductType.consumable,
        'SUBSCRIPTION' => PurchaseProductType.subscription,
        _ => throw Exception('Invalid purchase type: $json'),
      };
  String toJson() => name;
}

/// {@template abstract_purchase_manager}
/// An abstract class defining the interface for purchase management.
/// {@endtemplate}
abstract class PurchaseManager {
  /// Checks if in-app purchases are available on the device.
  Future<bool> isAvailable();

  /// Initializes the purchase manager.
  Future<bool> init();

  /// Purchases a consumable item.
  Future<PurchaseResult> buyConsumable(final PurchaseProductDetails details);

  /// Purchases a non-consumable item.
  Future<PurchaseResult> buyNonConsumable(final PurchaseProductDetails details);

  /// Subscribes to a product.
  Future<PurchaseResult> subscribe(final PurchaseProductDetails details);

  /// Retrieves available subscriptions.
  Future<List<PurchaseProductDetails>> getSubscriptions(
    final List<ProductId> productIds,
  );

  /// Retrieves available consumable items.
  Future<List<PurchaseProductDetails>> getConsumables(
    final List<ProductId> productIds,
  );

  /// Retrieves available non-consumable items.
  Future<List<PurchaseProductDetails>> getNonConsumables(
    final List<ProductId> productIds,
  );

  /// Opens the subscription management page.
  Future<void> openSubscriptionManagement();

  /// Provides a stream of purchase updates.
  Stream<PurchaseUpdate> get purchasesStream;

  /// Restores previously made purchases.
  Future<RestoreResult> restore();

  /// Cancels an subscription or consumable or non-consumable.
  Future<CancelResult> cancel(final PurchaseProductDetails details);

  /// Disposes of the purchase manager.
  Future<void> dispose();
}

/// {@template purchase_product_details}
/// Represents the details of a purchasable product.
/// {@endtemplate}
@freezed
class PurchaseProductDetails with _$PurchaseProductDetails {
  const factory PurchaseProductDetails({
    required final ProductId productId,
    required final PurchaseProductType productType,
    required final String name,

    /// formatted price with currency
    required final String formattedPrice,

    /// price without currency in smallest unit of currency
    required final double price,
    required final String currency,
    @Default('') final String description,
    @Default(Duration.zero) final Duration duration,
    @Default(PurchaseDuration.zero) final PurchaseDuration freeTrialDuration,
  }) = _PurchaseProductDetails;
  const PurchaseProductDetails._();
  factory PurchaseProductDetails.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseProductDetailsFromJson(json);
  bool get hasFreeTrial => !freeTrialDuration.isZero;
  bool get isOneTimePurchase => duration.inDays == 0;
  bool get isSubscription => !isOneTimePurchase;
}

/// {@template purchase_details}
/// Represents the details of a purchase.
/// {@endtemplate}
@freezed
class PurchaseDetails with _$PurchaseDetails {
  const factory PurchaseDetails({
    required final PurchaseId purchaseId,
    required final ProductId productId,
    required final String name,

    /// formatted price with currency
    required final String formattedPrice,

    /// price without currency in smallest unit of currency
    required final double price,
    required final String currency,
    required final DateTime purchaseDate,
    required final PurchaseProductType purchaseType,
    @Default(Duration.zero) final Duration freeTrialDuration,
    @Default(Duration.zero) final Duration duration,
    final DateTime? expiryDate,
  }) = _PurchaseDetails;
  const PurchaseDetails._();
  factory PurchaseDetails.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseDetailsFromJson(json);
  bool get hasFreeTrial => freeTrialDuration.inDays > 0;
  bool get isOneTimePurchase => duration.inDays == 0;
  bool get isSubscription => !isOneTimePurchase;
}

/// {@template purchase_result}
/// Represents the result of a purchase operation.
/// {@endtemplate}
@freezed
class PurchaseResult with _$PurchaseResult {
  const factory PurchaseResult.success(final PurchaseDetails details) =
      PurchaseSuccess;
  const factory PurchaseResult.failure(final String error) = PurchaseFailure;

  factory PurchaseResult.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseResultFromJson(json);
}

/// {@template purchase_update}
/// Represents an update to a purchase.
/// {@endtemplate}
@freezed
class PurchaseUpdate with _$PurchaseUpdate {
  const factory PurchaseUpdate({
    required final ProductId productId,
    required final PurchaseId purchaseId,
    required final PurchaseStatus status,
  }) = _PurchaseUpdate;

  factory PurchaseUpdate.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseUpdateFromJson(json);
}

/// {@template purchase_status}
/// Represents the status of a purchase.
/// {@endtemplate}
enum PurchaseStatus { pending, completed, cancelled, failed }

/// {@template restore_result}
/// Represents the result of a restore operation.
/// {@endtemplate}
@freezed
class RestoreResult with _$RestoreResult {
  const factory RestoreResult.success(
    final List<PurchaseDetails> restoredPurchases,
  ) = RestoreSuccess;
  const factory RestoreResult.failure(final String error) = RestoreFailure;

  factory RestoreResult.fromJson(final Map<String, dynamic> json) =>
      _$RestoreResultFromJson(json);
}

/// {@template cancel_result}
/// Represents the result of a cancellation operation.
/// {@endtemplate}
@freezed
class CancelResult with _$CancelResult {
  const factory CancelResult.success() = CancelSuccess;
  const factory CancelResult.failure(final String error) = CancelFailure;

  factory CancelResult.fromJson(final Map<String, dynamic> json) =>
      _$CancelResultFromJson(json);
}
