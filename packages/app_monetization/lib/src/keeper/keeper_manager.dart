import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../purchases/purchase_manager.dart';

part 'keeper_manager.freezed.dart';
part 'keeper_manager.g.dart';

/// Represents the state of user access to premium features.
enum KeeperState { free, purchased }

/// {@template keeper_manager}
/// Manages the state of user access to premium features.
/// {@endtemplate}
class KeeperManager extends ChangeNotifier {
  KeeperState _state = KeeperState.free;

  /// The current state of user access.
  KeeperState get state => _state;

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
