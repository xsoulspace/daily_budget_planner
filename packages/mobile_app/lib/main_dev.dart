import 'package:core/core.dart';
import 'package:mobile_app/navigation/navigation.dart';

Future<void> main() async => bootstrapMain(
      builder: (final context) => const AppScaffold(
        goRouterBuilder: GoRouterBuilder.create,
      ),
    );
