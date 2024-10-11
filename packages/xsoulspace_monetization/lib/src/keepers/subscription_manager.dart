import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../purchases/purchase_manager.dart';
import 'monetization_utils.dart';

part 'subscription_manager.freezed.dart';
part 'subscription_manager.g.dart';

/// Represents the state of user access to premium features.
enum SubscriptionManagerStatus { free, subscribed, pending }

/// {@template keeper_manager}
/// Manages the state of user access to premium features.
/// {@endtemplate}
class SubscriptionManager extends ChangeNotifier {
  SubscriptionManager();
  late final PurchaseManager purchaseManager;
  SubscriptionManagerStatus _state = SubscriptionManagerStatus.free;
  MonetizationType _monetizationType = MonetizationType.subscription;
  bool _isInitialized = false;

  /// The current state of user access.
  SubscriptionManagerStatus get state =>
      _monetizationType == MonetizationType.free
          ? SubscriptionManagerStatus.subscribed
          : _state;

  /// The type of monetization used by the app.
  MonetizationType get monetizationType => _monetizationType;
  StreamSubscription<PurchaseVerificationDto>? _purchaseUpdateSubscription;
  Future<void> init({
    required final MonetizationType monetizationType,
    required final PurchaseManager purchaseManager,
  }) async {
    _monetizationType = monetizationType;
    this.purchaseManager = purchaseManager;
    _isInitialized = await purchaseManager.init();
    if (monetizationType case MonetizationType.subscription
        when _isInitialized) {
      await restore();
      await _purchaseUpdateSubscription?.cancel();
      _purchaseUpdateSubscription =
          purchaseManager.purchasesStream.listen(handlePurchaseUpdate);
    }
    notifyListeners();
  }

  Future<void> restore() async {
    if (!_isInitialized) return;
    final result = await purchaseManager.restore();
    // TODO(arenukvern): add other types of purchases handlers,
    // which will be better handled in separate classes
    // like for hanlder in handlers
    // handler.onRestore()
    switch (result) {
      case RestoreSuccess(:final restoredPurchases):
        for (final purchase in restoredPurchases) {
          if (!purchase.isActive) continue;
          await _confirmPurchase(purchase.toVerificationDto());
        }
      case RestoreFailure():
        _state = SubscriptionManagerStatus.free;
        notifyListeners();
    }
  }

  /// Updates the state based on a purchase update.
  Future<void> handlePurchaseUpdate(final PurchaseVerificationDto dto) async {
    if (!_isInitialized) return;
    switch (dto.status) {
      case PurchaseStatus.restored || PurchaseStatus.purchased:
        await _confirmPurchase(dto);
        return;
      case PurchaseStatus.error:
        // TODO(arenukvern): add error notification
        await _confirmPurchase(dto);
      case PurchaseStatus.pending:
        _state = SubscriptionManagerStatus.pending;
        notifyListeners();
        return;
      case PurchaseStatus.canceled:
    }
    _state = SubscriptionManagerStatus.free;
    notifyListeners();
  }

  /// Updates the state based on a purchase result.
  Future<void> _handlePurchase(final PurchaseResult result) async {
    if (!_isInitialized) return;
    switch (result) {
      case PurchaseSuccess(:final details):
        if (details.isActive) {
          await _confirmPurchase(details.toVerificationDto());
        }
      case PurchaseFailure():
    }
    _state = SubscriptionManagerStatus.free;
    notifyListeners();
  }

  /// Updates the state based on an ad interaction result.
  void updateStateFromAd(final AdResult result) {
    if (!_isInitialized) return;
    // TODO(arenukvern): description
    notifyListeners();
  }

  Future<void> subscribe(final PurchaseProductDetails details) async {
    if (!_isInitialized) return;
    final result = await purchaseManager.subscribe(details);
    await _handlePurchase(result);
  }

  Future<void> cancel(final PurchaseProductDetails details) async {
    if (!_isInitialized) return;
    final result = await purchaseManager.cancel(details);
    switch (result) {
      case CancelSuccess():
        _state = SubscriptionManagerStatus.free;
      case CancelFailure():
      // Handle failure if needed
    }
    notifyListeners();
  }

  Future<void> _confirmPurchase(final PurchaseVerificationDto details) async {
    if (!_isInitialized) return;
    if (details.status
        case PurchaseStatus.error ||
            PurchaseStatus.purchased ||
            PurchaseStatus.restored) return;
    final result = await purchaseManager.completePurchase(details);
    switch (result) {
      case CompletePurchaseSuccess():
        _state = SubscriptionManagerStatus.subscribed;
      case CompletePurchaseFailure():
    }
    notifyListeners();
  }

  /// Checks if the user has access to premium features.
  bool hasActiveSubscription() => state == SubscriptionManagerStatus.subscribed;

  /// Disposes of the KeeperManager and its resources.
  @override
  Future<void> dispose() async {
    await _purchaseUpdateSubscription?.cancel();
    await purchaseManager.dispose();
    super.dispose();
  }
}

/// Represents the result of an ad interaction.
@freezed
class AdResult with _$AdResult {
  const factory AdResult.rewarded() = AdRewarded;
  const factory AdResult.failed() = AdFailed;

  factory AdResult.fromJson(final Map<String, dynamic> json) =>
      _$AdResultFromJson(json);
}
