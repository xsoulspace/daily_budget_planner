import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_services/analytics/models/analytics_event.dart';

/// A no-operation implementation of [AnalyticsService].
///
/// This class can be used as a placeholder or for testing purposes
/// when actual analytics tracking is not required.
class NoopAnalyticsService implements AnalyticsService {
  @override
  Future<void> onLoad() async {}

  @override
  Future<void> logEvent(final AnalyticsEvent event) async {}

  @override
  Future<void> setUserProperty(final String name, final String? value) async {}

  @override
  Future<void> setUserId(final String? id) async {}

  @override
  void dispose() {}
}

abstract interface class AnalyticsService implements Loadable, Disposable {
  Future<void> logEvent(final AnalyticsEvent event);
  Future<void> setUserProperty(final String name, final String? value);
  Future<void> setUserId(final String? id);
}
