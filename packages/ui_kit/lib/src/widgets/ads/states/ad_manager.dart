import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:life_hooks/life_hooks.dart';

import '../models/models.dart';

class AdManager implements Loadable, Disposable {
  AdPermissions permissions = AdPermissions.noAds;
  @override
  Future<void> onLoad() async {
    const envs = Envs.instance;
    if (envs.isMarketingMode) return;
    if (envs.isDebugAds) {
      permissions = AdPermissions.allAdEnabled;
      return;
    }
    if (kIsWeb) {
      permissions = AdPermissions.webAds;
    } else if (DeviceRuntimeType.isMobile) {
      permissions = AdPermissions.nativeMobileAds;
    } else {
      permissions = AdPermissions.nativeDesktopAds;
    }
  }

  @override
  void dispose() {
    //
  }
}
