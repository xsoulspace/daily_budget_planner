// ignore_for_file: do_not_use_environment

import 'package:flutter/foundation.dart';

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

@immutable
class _Envs {
  _Envs._prod()
      : dbUrl = const String.fromEnvironment('db-url'),
        isMarketingMode = false,
        isDebugAds = false,
        storeTarget = StoreTarget.fromString(
          const String.fromEnvironment('store-target'),
        );
  _Envs._dev()
      : dbUrl = 'https://',
        isMarketingMode = const bool.fromEnvironment('is-marketing-mode'),
        isDebugAds = const bool.fromEnvironment('is-debug-ads'),
        storeTarget = StoreTarget.fromString(
          const String.fromEnvironment('store-target'),
        );
  final String dbUrl;
  final bool isMarketingMode;
  final bool isDebugAds;
  final StoreTarget storeTarget;
}

@immutable
class Envs {
  const Envs._();
  static final instance = kDebugMode ? _Envs._dev() : _Envs._prod();
}
