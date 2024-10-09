import 'package:flutter/widgets.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

import 'ad_manager.dart';

/// {@template yandex_mobile_ads_manager}
/// Implementation of [AdManager] using Yandex Mobile Ads.
/// {@endtemplate}
class YandexMobileAdsManager implements AdManager {
  YandexMobileAdsManager({this.debug = false});
  final bool debug;
  @override
  Future<void> init() async {
    await MobileAds.initialize();
    if (debug) {
      await MobileAds.setLogging(true);
      await MobileAds.showDebugPanel();
    }
    await MobileAds.setAgeRestrictedUser(true);
  }

  @override
  Future<void> showRewardedAd() async {
    await RewardedAdLoader.create(
      onAdFailedToLoad: (final error) {
        debugPrint('Rewarded ad failed to load: $error');
      },
      onAdLoaded: (final ad) {
        ad.show();
      },
    );
    // final rewardedAd = RewardedAd(adUnitId: 'your_rewarded_ad_unit_id');
    // await rewardedAd.load();
    // await rewardedAd.show();
  }

  @override
  Future<void> showInterstitialAd() async {
    // final interstitialAd =
    //     InterstitialAd(adUnitId: 'your_interstitial_ad_unit_id');
    // await interstitialAd.load();
    // await interstitialAd.show();
  }

  @override
  Widget buildBannerAd() {
    throw UnimplementedError();
    // return BannerAdWidget(
    //     adUnitId: 'your_banner_ad_unit_id',
    //     adSize: BannerAdSize.stickySize(width: 320),
    //   );
  }
}
