import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:mobile_app/mobile_app.dart';

/// Prod entrypoint.
///
/// Firebase options are optional: if `firebase_options.dart` was generated
/// (`flutterfire configure`), analytics/crashlytics are enabled; otherwise the
/// app runs without Firebase. To generate, run:
/// `flutterfire configure --project=<your-firebase-project>`
/// and uncomment the import and the options line below.
// import 'firebase_options.dart';

Future<void> main() async => runMobileApp(
  // (firebaseOptions: DefaultFirebaseOptions.currentPlatform),
  null,
);
