import 'package:store_checker/store_checker.dart';

/// Store source
enum StoreSource {
  rustore,
  googlePlay,
  googlePlayInstaller,
  appleStore,
  huawaiAppGallery,
  amazon,
  samsungGalaxy,
  samsungSmartSwitchMobile,
  apk,
}

/// Target store for which the app is built
enum StoreTarget {
  rustore,
  googlePlay,
  appleStore,
  huawai,
  other;

  factory StoreTarget.fromString(final String target) => switch (target) {
        'rustore' => StoreTarget.rustore,
        'googlePlay' => StoreTarget.googlePlay,
        'appleStore' => StoreTarget.appleStore,
        'huawai' => StoreTarget.huawai,
        _ => StoreTarget.other,
      };
}

class AppStoreUtils {
  AppStoreUtils();

  Future<String> getInstallationSource() async {
    final Source installationSource = await StoreChecker.getSource;

    return switch (installationSource) {
      Source.IS_INSTALLED_FROM_PLAY_STORE => 'Play Store',
      Source.IS_INSTALLED_FROM_PLAY_PACKAGE_INSTALLER =>
        'Google Package installer',
      Source.IS_INSTALLED_FROM_LOCAL_SOURCE => 'Local Source',
      Source.IS_INSTALLED_FROM_AMAZON_APP_STORE => 'Amazon Store',
      Source.IS_INSTALLED_FROM_HUAWEI_APP_GALLERY => 'Huawei App Gallery',
      Source.IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE => 'Samsung Galaxy Store',
      Source.IS_INSTALLED_FROM_SAMSUNG_SMART_SWITCH_MOBILE =>
        'Samsung Smart Switch Mobile',
      Source.IS_INSTALLED_FROM_XIAOMI_GET_APPS => 'Xiaomi Get Apps',
      Source.IS_INSTALLED_FROM_OPPO_APP_MARKET => 'Oppo App Market',
      Source.IS_INSTALLED_FROM_VIVO_APP_STORE => 'Vivo App Store',
      Source.IS_INSTALLED_FROM_RU_STORE => 'RuStore',
      _ => 'Unknown Source',
    };
  }
}
