import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app/common_imports.dart';

/// Toggle this for testing Crashlytics in your app locally.
const kTestingCrashlytics = false;

/// Toggle this for testing Analytics in your app locally.
const kTestingAnalytics = false;

class FirebaseInitializer implements Loadable {
  FirebaseInitializer({required this.firebaseOptions});
  final FirebaseOptions? firebaseOptions;

  @override
  Future<void> onLoad() async {
    if (firebaseOptions == null) return;
    await Firebase.initializeApp(options: firebaseOptions);
  }
}
