import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app/common_imports.dart';

class GlobalInitializerImpl {
  GlobalInitializerImpl();
  final analyticsManager = AnalyticsManager();
  Future<void> load({
    final FirebaseOptions? firebaseOptions,
  }) async {
    if (firebaseOptions == null) return;
    analyticsManager
      ..firebaseInitializer = FirebaseInitializer(
        firebaseOptions: firebaseOptions,
      )
      ..analyticsService = FirebaseAnalyticsPlugin(
        // ignore: avoid_redundant_argument_values
        forceAnalytics: kTestingAnalytics,
      )
      ..crashlyticsService = FirebaseCrashlyticsPlugin(
        // ignore: avoid_redundant_argument_values
        forceCrashlytics: kTestingCrashlytics,
      );
    await analyticsManager.onLoad();
  }

  void dispose() {
    analyticsManager.dispose();
  }
}
