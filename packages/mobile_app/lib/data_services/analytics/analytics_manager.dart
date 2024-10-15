// ignore_for_file:  avoid_annotating_with_dynamic

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_services/analytics/models/analytics_event.dart';
import 'package:mobile_app/data_services/analytics/models/analytics_events.dart';

class AnalyticsManager implements Loadable, Disposable {
  AnalyticsManager();

  /// instances may be replaced by [onLoad] to use the actual implementations
  AnalyticsService analyticsService = NoopAnalyticsService();

  /// instances may be replaced by [onLoad] to use the actual implementations
  CrashlyticsService crashlyticsService = NoopCrashlyticsService();
  FirebaseInitializer? firebaseInitializer;

  @override
  Future<void> onLoad() async {
    await firebaseInitializer?.onLoad();
    await analyticsService.onLoad();
    await crashlyticsService.onLoad();
    // Set up global error handlers here
  }

  Future<void> logEvent(final AnalyticsEvent event) async {
    await analyticsService.logEvent(event);
  }

  Future<void> setUserProperty(final String name, final String? value) async {
    await analyticsService.setUserProperty(name, value);
  }

  Future<void> setCurrentScreen(final String screenName) async =>
      analyticsService.logEvent(AnalyticsEvents.screenView(screenName));

  Future<void> setUserId(final String? id) async {
    await analyticsService.setUserId(id);
  }

  Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack, {
    final bool fatal = false,
  }) async {
    await crashlyticsService.recordError(exception, stack, fatal: fatal);
  }

  // Add other methods as needed

  @override
  void dispose() {
    analyticsService.dispose();
    crashlyticsService.dispose();
  }
}
