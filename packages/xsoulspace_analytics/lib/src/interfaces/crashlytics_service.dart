// ignore_for_file: avoid_annotating_with_dynamic

import 'package:flutter/foundation.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

class NoopCrashlyticsService implements CrashlyticsService {
  @override
  Future<void> dispose() async {}

  @override
  Future<void> recordFlutterError(final FlutterErrorDetails details) async {}

  @override
  Future<void> log(final String message) async {}

  @override
  Future<void> setCustomKey(final String key, final dynamic value) async {}

  @override
  Future<void> setUserIdentifier(final String identifier) async {}

  @override
  Future<void> testAsyncErrorOnInit() async {}

  @override
  Future<void> onLoad() async {}

  @override
  Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack, {
    final bool fatal = false,
  }) async {}
}

abstract interface class CrashlyticsService implements Loadable, Disposable {
  Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack, {
    final bool fatal = false,
  });
  Future<void> recordFlutterError(final FlutterErrorDetails details);
  Future<void> log(final String message);
  Future<void> setCustomKey(final String key, final dynamic value);
  Future<void> setUserIdentifier(final String identifier);
  Future<void> testAsyncErrorOnInit();
}
