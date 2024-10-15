import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app/common_imports.dart';

class GlobalInitializerImpl {
  GlobalInitializerImpl({
    this.firebaseOptions,
  });
  final FirebaseOptions? firebaseOptions;
  final analyticsService = AnalyticsServiceImpl();
  Future<void> loadAnalytics() async {
    final effectiveFirebaseOptions = firebaseOptions;
    if (effectiveFirebaseOptions != null) {
      await FirebaseInitializerImpl(firebaseOptions: effectiveFirebaseOptions)
          .onLoad();

      analyticsService
        ..upsertPlugin<FirebaseAnalyticsPlugin>(FirebaseAnalyticsPlugin())
        ..upsertPlugin<FirebaseCrashlyticsPlugin>(FirebaseCrashlyticsPlugin());
    }
    await analyticsService.onLoad();
  }

  void dispose() {
    analyticsService.dispose();
  }
}
