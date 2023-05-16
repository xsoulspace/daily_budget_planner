import 'package:firebase_core/firebase_core.dart';
import 'package:life_hooks/life_hooks.dart';

import '../../services/services.dart';

abstract interface class GlobalInitializer implements Loadable, Disposable {
  AnalyticsService get analyticsService;
}

class GlobalInitializerImpl extends GlobalInitializer {
  GlobalInitializerImpl({
    this.firebaseOptions,
  });
  @override
  final AnalyticsService analyticsService = AnalyticsServiceImpl();
  final FirebaseOptions? firebaseOptions;
  @override
  Future<void> onLoad() async {
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

  @override
  void dispose() {
    analyticsService.dispose();
  }
}
