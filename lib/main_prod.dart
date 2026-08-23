/// Prod entrypoint.
///
/// Firebase options are optional: if `firebase_options.dart` was generated
/// (`flutterfire configure`), analytics/crashlytics are enabled; otherwise the
/// app runs without Firebase. To enable:
/// 1. Run `flutterfire configure --project=<your-firebase-project>`
/// 2. Uncomment the import and the `firebaseOptions` line below.
// import 'firebase_options.dart';
import 'package:mobile_app/mobile_app.dart';

Future<void> main() async => runMobileApp(
  // (firebaseOptions: DefaultFirebaseOptions.currentPlatform),
  null,
);
