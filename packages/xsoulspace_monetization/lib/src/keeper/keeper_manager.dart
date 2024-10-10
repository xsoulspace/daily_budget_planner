import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../purchases/purchase_manager.dart';

part 'keeper_manager.freezed.dart';
part 'keeper_manager.g.dart';

/// Represents the state of user access to premium features.
enum KeeperState { free, purchased }

/// The type of monetization used by the app.
enum MonetizationType {
  /// The app uses a subscription model.
  subscription,

  /// The app is free.
  free;

  factory MonetizationType.fromJson(final String value) =>
      MonetizationType.values.byName(value);
}

/// {@template keeper_manager}
/// Manages the state of user access to premium features.
/// {@endtemplate}
class KeeperManager extends ChangeNotifier {
  KeeperState _state = KeeperState.free;
  MonetizationType _monetizationType = MonetizationType.subscription;

  /// The current state of user access.
  KeeperState get state => _state;

  /// The type of monetization used by the app.
  MonetizationType get monetizationType => _monetizationType;
  Future<void> init({required final MonetizationType type}) async {
    _monetizationType = type;
    notifyListeners();
    if (type case MonetizationType.subscription) {
      // TODO(arenukvern): add logic to check if user is subscribed if type is subscription
      await _verifySubscription();
    }
  }

  Future<void> _verifySubscription() async {
    // TODO(arenukvern): add logic to check if user is subscribed if type is subscription
    // final isSubscribed = await Purchases.getSubscriptionStatus();
    // _state = isSubscribed ? KeeperState.purchased : KeeperState.free;
  }

  /// Updates the state based on a purchase result.
  void updateStateFromPurchase(final PurchaseResult result) {
    result.when(
      success: (final details) => _state = KeeperState.purchased,
      failure: (final _) => _state = KeeperState.free,
    );
    notifyListeners();
  }

  /// Updates the state based on an ad interaction result.
  void updateStateFromAd(final AdResult result) {
    result.when(
      rewarded: () => _state = KeeperState.purchased,
      failed: () => _state = KeeperState.free,
    );
    notifyListeners();
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
