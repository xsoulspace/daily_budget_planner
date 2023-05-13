import 'package:core/core.dart';
import 'package:daily_budget_planner/navigation/navigation.dart';

Future<void> main() async => bootstrapMain(
      builder: (final context) => const AppScaffold(
        goRouterBuilder: GoRouterBuilder.create,
      ),
    );
