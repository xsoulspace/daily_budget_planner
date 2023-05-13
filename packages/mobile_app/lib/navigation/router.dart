import 'package:daily_budget_planner/home/home.dart';
import 'package:go_router/go_router.dart';

enum AppPath {
  home('/');

  const AppPath(this.value);
  final String value;
}

class GoRouterBuilder {
  GoRouterBuilder._();
  static GoRouter create() => GoRouter(
        initialLocation: AppPath.home.value,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: AppPath.home.value,
            builder: (final context, final state) => const HomeScreen(),
          ),
        ],
      );
}
