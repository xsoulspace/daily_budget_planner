import 'package:freezed_annotation/freezed_annotation.dart';

part 'abstract_purchase_manager.freezed.dart';
part 'abstract_purchase_manager.g.dart';

/// {@template abstract_purchase_manager}
/// An abstract class defining the interface for purchase management.
/// {@endtemplate}
abstract class AbstractPurchaseManager {
  /// Purchases a subscription.
  Future<PurchaseResult> purchaseSubscription(
    final SubscriptionDetails details,
  );

  /// Purchases a one-time item.
  Future<PurchaseResult> purchaseOneTimePurchase(
    final OneTimePurchaseDetails details,
  );

  /// Retrieves available subscriptions.
  Future<List<AvailableSubscription>> getAvailableSubscriptions();

  /// Retrieves available one-time purchases.
  Future<List<AvailableOneTimePurchase>> getAvailableOneTimePurchases();

  /// Retrieves details for a specific purchase.
  Future<PurchaseDetails> getPurchaseDetails(final String purchaseId);

  /// Restores previously made purchases.
  Future<bool> restorePurchases();
}

/// Represents the details of a subscription.
@freezed
class SubscriptionDetails with _$SubscriptionDetails {
  const factory SubscriptionDetails({
    required final String id,
    required final String name,
    required final double price,
    required final Duration duration,
  }) = _SubscriptionDetails;

  factory SubscriptionDetails.fromJson(final Map<String, dynamic> json) =>
      _$SubscriptionDetailsFromJson(json);
}

/// Represents the details of a one-time purchase.
@freezed
class OneTimePurchaseDetails with _$OneTimePurchaseDetails {
  const factory OneTimePurchaseDetails({
    required final String id,
    required final String name,
    required final double price,
  }) = _OneTimePurchaseDetails;

  factory OneTimePurchaseDetails.fromJson(final Map<String, dynamic> json) =>
      _$OneTimePurchaseDetailsFromJson(json);
}

/// Represents an available subscription.
@freezed
class AvailableSubscription with _$AvailableSubscription {
  const factory AvailableSubscription({
    required final String id,
    required final String name,
    required final double price,
    required final Duration duration,
  }) = _AvailableSubscription;

  factory AvailableSubscription.fromJson(final Map<String, dynamic> json) =>
      _$AvailableSubscriptionFromJson(json);
}

/// Represents an available one-time purchase.
@freezed
class AvailableOneTimePurchase with _$AvailableOneTimePurchase {
  const factory AvailableOneTimePurchase({
    required final String id,
    required final String name,
    required final double price,
  }) = _AvailableOneTimePurchase;

  factory AvailableOneTimePurchase.fromJson(final Map<String, dynamic> json) =>
      _$AvailableOneTimePurchaseFromJson(json);
}

/// Represents the details of a purchase.
@freezed
class PurchaseDetails with _$PurchaseDetails {
  const factory PurchaseDetails({
    required final String id,
    required final String name,
    required final double price,
    required final DateTime purchaseDate,
    final String? subscriptionId,
    final DateTime? expiryDate,
  }) = _PurchaseDetails;

  factory PurchaseDetails.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseDetailsFromJson(json);
}

/// Represents the result of a purchase operation.
@freezed
class PurchaseResult with _$PurchaseResult {
  const factory PurchaseResult.success(final PurchaseDetails details) =
      PurchaseSuccess;
  const factory PurchaseResult.failure(final String error) = PurchaseFailure;

  factory PurchaseResult.fromJson(final Map<String, dynamic> json) =>
      _$PurchaseResultFromJson(json);
}
