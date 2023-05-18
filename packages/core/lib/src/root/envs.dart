// ignore_for_file: do_not_use_environment

import 'package:flutter/foundation.dart';

@immutable
class _Envs {
  const _Envs._prod()
      : dbUrl = const String.fromEnvironment('db-url'),
        isMarketingMode = false,
        isDebugAds = false;
  const _Envs._dev()
      : dbUrl = 'https://',
        isMarketingMode = const bool.fromEnvironment('is-marketing-mode'),
        isDebugAds = const bool.fromEnvironment('is-debug-ads');
  final String dbUrl;
  final bool isMarketingMode;
  final bool isDebugAds;
}

@immutable
class Envs {
  const Envs._();
  static const instance = kDebugMode ? _Envs._dev() : _Envs._prod();
}
