import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app/common_imports.dart';

class GlobalInitializerImpl with HasAnalyticsService {
  GlobalInitializerImpl({
    this.firebaseOptions,
  });
  final FirebaseOptions? firebaseOptions;
  Future<void> onLoad() async {
    final effectiveFirebaseOptions = firebaseOptions;
    Di.init();
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
