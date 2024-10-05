import 'package:mobile_app/router.dart';
import 'package:mobile_app/ui_root/app_scaffold.dart';
import 'package:mobile_app/ui_root/bootstrap.dart';

Future<void> runMobileApp() async => bootstrapMain(
      builder: (final context) => const AppScaffold(
        goRouterBuilder: GoRouterBuilder.create,
      ),
    );
