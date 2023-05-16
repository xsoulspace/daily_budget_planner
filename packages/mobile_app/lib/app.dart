import 'package:core/core.dart';
import 'package:mobile_app/navigation/navigation.dart';

export 'package:core/core.dart';
export 'package:mobile_app/navigation/navigation.dart';

Future<void> runMobileApp() async => bootstrapMain(
      builder: (final context) => const AppScaffold(
        goRouterBuilder: GoRouterBuilder.create,
      ),
    );
