import 'package:firebase_core/firebase_core.dart';
import 'package:life_hooks/life_hooks.dart';

/// Toggle this for testing Crashlytics in your app locally.
const kTestingCrashlytics = false;

/// Toggle this for testing Analytics in your app locally.
const kTestingAnalytics = false;

abstract interface class FirebaseInitializer implements Loadable {
  FirebaseInitializer({
    required this.firebaseOptions,
  });
  final FirebaseOptions? firebaseOptions;

  @override
  Future<void> onLoad();
  Future<void> onDelayedLoad();
}
