import 'package:freezed_annotation/freezed_annotation.dart';

part 'abstract_purchase_manager.freezed.dart';
part 'abstract_purchase_manager.g.dart';

/// {@template product_id}
/// Represents a unique identifier for a product.
/// {@endtemplate}
extension type ProductId(String value) {
  factory ProductId.fromJson(final dynamic json) => ProductId(json.toString());
  String toJson() => value;
}

/// {@template purchase_id}
/// Represents a unique identifier for a purchase.
/// {@endtemplate}
extension type PurchaseId(String value) {
  factory PurchaseId.fromJson(final dynamic json) =>
      PurchaseId(json.toString());
  String toJson() => value;
}

enum PurchaseType {
  consumable,
  nonConsumable,
  subscription;

  factory PurchaseType.fromJson(final dynamic json) => switch (json) {
        'NON_CONSUMABLE' => PurchaseType.nonConsumable,
        'CONSUMABLE' => PurchaseType.consumable,
        'SUBSCRIPTION' => PurchaseType.subscription,
        _ => throw Exception('Invalid purchase type: $json'),
      };
  String toJson() => name;
}

/// {@template abstract_purchase_manager}
/// An abstract class defining the interface for purchase management.
/// {@endtemplate}
abstract class AbstractPurchaseManager {
  /// Checks if in-app purchases are available on the device.
  Future<bool> isAvailable();

  /// Purchases a consumable item.
  Future<PurchaseResult> buyConsumable(final ConsumableDetails details);

  /// Purchases a non-consumable item.
  Future<PurchaseResult> buyNonConsumable(final NonConsumableDetails details);

  /// Subscribes to a product.
  Future<PurchaseResult> subscribe(final SubscriptionDetails details);

  /// Retrieves available subscriptions.
  Future<List<AvailableSubscription>> getSubscriptions();

  /// Retrieves available consumable items.
  Future<List<AvailableConsumable>> getConsumables();

  /// Retrieves available non-consumable items.
  Future<List<AvailableNonConsumable>> getNonConsumables();

  /// Opens the subscription management page.
  Future<void> openSubscriptionManagement();

  /// Provides a stream of purchase updates.
  Stream<PurchaseUpdate> get purchasesStream;

  /// Restores previously made purchases.
  Future<RestoreResult> restore();

  /// Cancels an active subscription.
  Future<CancelResult> cancel(final SubscriptionDetails details);
}

/// {@template subscription_details}
/// Represents the details of a subscription.
/// {@endtemplate}
@freezed
class SubscriptionDetails with _$SubscriptionDetails {
  const factory SubscriptionDetails({
    required final ProductId productId,
    required final String name,
    required final double price,
    required final String currency,
    required final Duration duration,
  }) = _SubscriptionDetails;

  factory SubscriptionDetails.fromJson(final Map<String, dynamic> json) =>
      _$SubscriptionDetailsFromJson(json);
}

/// {@template consumable_details}
/// Represents the details of a consumable purchase.
/// {@endtemplate}
@freezed
class ConsumableDetails with _$ConsumableDetails {
  const factory ConsumableDetails({
    required final ProductId productId,
    required final String name,
    required final double price,
    required final String currency,
  }) = _ConsumableDetails;

  factory ConsumableDetails.fromJson(final Map<String, dynamic> json) =>
      _$ConsumableDetailsFromJson(json);
}

/// {@template non_consumable_details}
/// Represents the details of a non-consumable purchase.
/// {@endtemplate}
@freezed
class NonConsumableDetails with _$NonConsumableDetails {
  const factory NonConsumableDetails({
    required final ProductId productId,
    required final String name,
    required final double price,
    required final String currency,
  }) = _NonConsumableDetails;

  factory NonConsumableDetails.fromJson(final Map<String, dynamic> json) =>
      _$NonConsumableDetailsFromJson(json);
}

/// {@template available_subscription}
/// Represents an available subscription.
/// {@endtemplate}
@freezed
class AvailableSubscription with _$AvailableSubscription {
  const factory AvailableSubscription({
    required final ProductId productId,
    required final String name,
    required final double price,
    required final String currency,
    required final Duration duration,
  }) = _AvailableSubscription;

  factory AvailableSubscription.fromJson(final Map<String, dynamic> json) =>
      _$AvailableSubscriptionFromJson(json);
}

/// {@template available_consumable}
/// Represents an available consumable item.
/// {@endtemplate}
@freezed
class AvailableConsumable with _$AvailableConsumable {
  const factory AvailableConsumable({
    required final ProductId productId,
    required final String name,
    required final double price,
    required final String currency,
  }) = _AvailableConsumable;

  factory AvailableConsumable.fromJson(final Map<String, dynamic> json) =>
      _$AvailableConsumableFromJson(json);
}

/// {@template available_non_consumable}
/// Represents an available non-consumable item.
/// {@endtemplate}
@freezed
class AvailableNonConsumable with _$AvailableNonConsumable {
  const factory AvailableNonConsumable({
    required final ProductId productId,
    required final String name,
    required final double price,
    required final String currency,
  }) = _AvailableNonConsumable;

  factory AvailableNonConsumable.fromJson(final Map<String, dynamic> json) =>
      _$AvailableNonConsumableFromJson(json);
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
    required final double price,
    required final String currency,
    required final DateTime purchaseDate,
    required final PurchaseType purchaseType,
    final DateTime? expiryDate,
  }) = _PurchaseDetails;

  factory PurchaseDetails.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseDetailsFromJson(json);
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
    required final PurchaseId purchaseId,
    required final PurchaseStatus status,
  }) = _PurchaseUpdate;

  factory PurchaseUpdate.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseUpdateFromJson(json);
}

/// {@template purchase_status}
/// Represents the status of a purchase.
/// {@endtemplate}
enum PurchaseStatus {
  pending,
  completed,
  cancelled,
  failed,
}

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
