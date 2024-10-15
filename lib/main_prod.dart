import 'package:daily_budget_planner/firebase_options.dart';
import 'package:mobile_app/mobile_app.dart';

Future<void> main() async => runMobileApp(
      (firebaseOptions: DefaultFirebaseOptions.currentPlatform),
    );
