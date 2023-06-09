import 'package:go_router/go_router.dart';
import 'package:mobile_app/home/home.dart';

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
