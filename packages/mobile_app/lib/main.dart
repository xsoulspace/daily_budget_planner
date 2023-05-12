import 'package:core/core.dart';
import 'package:daily_buget_planner/navigation/navigation.dart';

Future<void> main() async => bootstrapMain(
      builder: (final context) => AppScaffold(
        goRouter: GoRouterBuilder.create(),
      ),
    );
