// ignore_for_file: avoid_annotating_with_dynamic

import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/common_imports.dart';

class FirebaseCrashlyticsPlugin implements CrashlyticsService {
  late final FirebaseCrashlytics _crashlytics;
  bool _isEnabled = false;

  @override
  Future<void> onLoad() async {
    _isEnabled = kTestingCrashlytics || DeviceRuntimeType.isNativeMobile;
    if (!_isEnabled) return;
    _crashlytics = FirebaseCrashlytics.instance;
    await _crashlytics.setCrashlyticsCollectionEnabled(true);
    Isolate.current.addErrorListener(
      RawReceivePort((final pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        await FirebaseCrashlytics.instance.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last,
          fatal: true,
          reason: 'Unhandled isolate error',
          information: <DiagnosticsNode>[
            DiagnosticsProperty<Isolate>(
              'Isolate',
              Isolate.current,
            ),
          ],
        );
      }).sendPort,
    );
    // Pass all uncaught asynchronous errors that aren't handled by the
    // Flutter framework to Crashlytics
    FlutterError.onError = (final errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the
    // Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (final error, final stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  @override
  Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack, {
    final bool fatal = false,
  }) async {
    if (!_isEnabled) return;
    await _crashlytics.recordError(exception, stack, fatal: fatal);
  }

  @override
  Future<void> recordFlutterError(final FlutterErrorDetails details) async {
    if (!_isEnabled) return;
    await _crashlytics.recordFlutterError(details);
  }

  @override
  Future<void> log(final String message) async {
    if (!_isEnabled) return;
    await _crashlytics.log(message);
  }

  @override
  Future<void> setCustomKey(final String key, final dynamic value) async {
    if (!_isEnabled) return;
    await _crashlytics.setCustomKey(key, value);
  }

  @override
  Future<void> setUserIdentifier(final String identifier) async {
    if (!_isEnabled) return;
    await _crashlytics.setUserIdentifier(identifier);
  }

  @override
  void dispose() {
    // No specific disposal needed for Firebase Crashlytics
  }

  @override
  Future<void> testAsyncErrorOnInit() async {
    Future<void>.delayed(const Duration(seconds: 2), () {
      final List<int> list = <int>[];
      // ignore: avoid_print
      print(list[100]);
    });
  }
}
