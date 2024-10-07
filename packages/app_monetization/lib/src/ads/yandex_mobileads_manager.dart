import 'package:flutter/widgets.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

import 'abstract_ad_manager.dart';

/// {@template yandex_mobile_ads_manager}
/// Implementation of [AbstractAdManager] using Yandex Mobile Ads.
/// {@endtemplate}
class YandexMobileAdsManager implements AbstractAdManager {
  @override
  Future<void> init() async {
    await MobileAds.initialize();
  }

  @override
  Future<void> showRewardedAd() async {
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
