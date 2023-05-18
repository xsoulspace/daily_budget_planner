import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:yandex_ads_sdk/yandex_ads_sdk.dart';

import '../../../../ui_kit.dart';

class HomeScreenTopBanner extends AdWidget {
  const HomeScreenTopBanner({super.key});
  @override
  String getAdUnitId(
    final AdPermissions permissions,
    final WidthFormFactor screenWidth,
  ) {
    if (kIsWeb) {
      if (DeviceRuntimeType.isMobile) return 'R-A-1980143-9';
      return 'R-A-1980143-7';
    }
    return 'R-M-2393149-1';
  }

  @override
  bool isAdAllowed(final AdPermissions permissions) =>
      permissions.homeScreenTopBannerEnabled;
  @override
  Widget debugBuilder(final BuildContext context) {
    final size = getSize(context);
    return Placeholder(
      fallbackHeight: size.height,
      fallbackWidth: size.width,
      child: const Text('Ad HomeScreenTopBanner'),
    );
  }

  Size getSize(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Size(
      size.width,
      math.max(
        20,
        math.min(size.height * 0.2, 35),
      ),
    );
  }

  @override
  Widget builder(final BuildContext context, final String adUnitId) {
    final size = getSize(context);
    return YandexFlexibleBanner(
      height: size.height,
      width: size.width,
      adUnitId: adUnitId,
    );
  }
}
