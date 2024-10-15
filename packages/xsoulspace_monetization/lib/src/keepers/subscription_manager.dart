import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import '../purchases/purchase_manager.dart';
import 'monetization_utils.dart';

part 'subscription_manager.freezed.dart';
part 'subscription_manager.g.dart';

/// Represents the state of user access to premium features.
enum SubscriptionManagerStatus { free, subscribed, pending }

enum MonetizationStatus { loading, notAvailable, storeNotAuthorized, loaded }

@stateDistributor
class MonetizationStatusNotifier extends ChangeNotifier {
  MonetizationStatusNotifier(this._type);
  MonetizationType _type;
  MonetizationType get type => _type;
  void setType(final MonetizationType value) {
    _type = value;
    notifyListeners();
  }

  MonetizationStatus _status = MonetizationStatus.loading;
  bool get isInitialized => _status == MonetizationStatus.loaded;
  MonetizationStatus get status => _status;
  void setStatus(final MonetizationStatus value) {
    _status = value;
    notifyListeners();
  }
}

/// {@template subscription_manager}
/// Manages the state of user subscription access to premium features.
/// {@endtemplate}
class SubscriptionManager extends ChangeNotifier {
  SubscriptionManager({
    required this.purchaseManager,
    required this.monetizationTypeNotifier,
    required this.productIds,
  });
  final List<PurchaseProductId> productIds;
  final PurchaseManager purchaseManager;
  final MonetizationStatusNotifier monetizationTypeNotifier;

  PurchaseDetails? _activeSubscription;
  PurchaseDetails? get activeSubscription => _activeSubscription;
  void setActiveSubscription(final PurchaseDetails? value) {
    _activeSubscription = value;
    notifyListeners();
  }

  SubscriptionManagerStatus _state = SubscriptionManagerStatus.free;
  void _setSubscriptionAsFree() {
    _activeSubscription = null;
    _state = SubscriptionManagerStatus.free;
    notifyListeners();
  }

  PurchaseProductDetails? getSubscription(final PurchaseProductId id) =>
      subscriptions.value.firstWhereOrNull((final e) => e.productId == id);
  bool get isLoading => state == SubscriptionManagerStatus.pending;

  /// The current state of user access.
  SubscriptionManagerStatus get state =>
      monetizationTypeNotifier.type == MonetizationType.free
          ? SubscriptionManagerStatus.subscribed
          : _state;

  LoadableContainer<List<PurchaseProductDetails>> subscriptions =
      LoadableContainer(value: []);
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  Future<void> init() async {
    if (_isInitialized) return;
    await getSubscriptions();
    _isInitialized = true;
  }

  Future<void> getSubscriptions() async {
    try {
      subscriptions = LoadableContainer.loaded(
        await purchaseManager.getSubscriptions(productIds),
      );
      notifyListeners();
    } on PlatformException catch (e, stackTrace) {
      debugPrint('Failed to get subscriptions: $e $stackTrace');
      if (e.code == 'RuStoreUserUnauthorizedException') {
        monetizationTypeNotifier
            .setStatus(MonetizationStatus.storeNotAuthorized);
      } else {
        monetizationTypeNotifier.setStatus(MonetizationStatus.notAvailable);
      }
    }
  }

  /// Updates the state based on a purchase update.
  Future<void> handleSubscriptionUpdate(
    final PurchaseVerificationDto dto,
  ) async {
    switch (dto.status) {
      case PurchaseStatus.restored:
      case PurchaseStatus.purchased:
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
        _setSubscriptionAsFree();
        return;
    }
  }

  Future<bool> subscribe(final PurchaseProductDetails details) async {
    if (_state == SubscriptionManagerStatus.subscribed) return false;
    _state = SubscriptionManagerStatus.pending;
    notifyListeners();
    final result = await purchaseManager.subscribe(details);
    return _handleSubscriptionResult(result);
  }

  Future<void> cancel(final PurchaseProductDetails details) async {
    final result = await purchaseManager.cancel(details);
    switch (result) {
      case CancelSuccess():
        _setSubscriptionAsFree();
      case CancelFailure():
      // Handle failure if needed
    }
    notifyListeners();
  }

  Future<bool> _confirmPurchase(final PurchaseVerificationDto details) async {
    if (details.status
        case PurchaseStatus.error ||
            PurchaseStatus.purchased ||
            PurchaseStatus.restored) {
      final result = await purchaseManager.completePurchase(details);
      switch (result) {
        case CompletePurchaseSuccess():
          if (details.status
              case (PurchaseStatus.purchased || PurchaseStatus.restored)) {
            final purchaseInfo =
                await purchaseManager.getPurchaseInfo(details.purchaseId);
            setActiveSubscription(purchaseInfo);
            _state = SubscriptionManagerStatus.subscribed;
            notifyListeners();
            return true;
          }
        case CompletePurchaseFailure():
          // Handle failure if needed
          return false;
      }
    }
    notifyListeners();
    return false;
  }

  Future<bool> _handleSubscriptionResult(final PurchaseResult result) async {
    switch (result) {
      case PurchaseSuccess(:final details):
        return _confirmPurchase(details.toVerificationDto());
      case PurchaseFailure():
        _setSubscriptionAsFree();
    }
    return false;
  }

  /// Checks if the user has access to premium features.
  bool hasActiveSubscription() => state == SubscriptionManagerStatus.subscribed;
}

/// Represents the result of an ad interaction.
@freezed
class AdResult with _$AdResult {
  const factory AdResult.rewarded() = AdRewarded;
  const factory AdResult.failed() = AdFailed;

  factory AdResult.fromJson(final Map<String, dynamic> json) =>
      _$AdResultFromJson(json);
}
