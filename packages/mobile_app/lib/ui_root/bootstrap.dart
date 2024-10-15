import 'dart:async';

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/di/di.dart';

/// ********************************************
/// *      APP RUNTIME
/// ********************************************

Future<void> bootstrapMain({
  required final Widget Function(GlobalInitializerImpl) builder,
  final AppBootstrapDto? dto,
}) =>
    _bootstrap(
      builder: builder,
      dto: dto,
    );

/// ********************************************
/// *      BOOTSTRAP
/// ********************************************
typedef AppBootstrapDto = ({
  FirebaseOptions? firebaseOptions,
});

Future<void> _bootstrap({
  required final Widget Function(GlobalInitializerImpl) builder,
  required final AppBootstrapDto? dto,
}) async {
  final initializer = GlobalInitializerImpl(
    firebaseOptions: dto?.firebaseOptions,
  );
  await initializer.loadAnalytics();
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      LicenseRegistry.addLicense(() async* {
        final license = await rootBundle.loadString('google_fonts/OFL.txt');
        yield LicenseEntryWithLineBreaks(['google_fonts'], license);
      });
      // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      runApp(builder(initializer));
    },
    initializer.analyticsService.recordError,
  );
}
