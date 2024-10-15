import 'package:flutter/widgets.dart';

/// {@template abstract_ad_manager}
/// An abstract class defining the interface for ad management.
/// {@endtemplate}
abstract class AdManager {
  Future<void> init();

  /// Shows a rewarded ad.
  Future<void> showRewardedAd();

  /// Shows an interstitial ad.
  Future<void> showInterstitialAd();

  /// Builds a banner ad widget.
  Widget buildBannerAd();
}
