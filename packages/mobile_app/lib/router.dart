import 'package:mobile_app/common_imports.dart';

enum ScreenPaths {
  root('/');

  const ScreenPaths(this.value);
  final String value;
}

final router = GoRouter(
  redirect: _handleRootRedirect,
  initialLocation: ScreenPaths.root.value,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: ScreenPaths.root.value,
      builder: (final context, final state) => const HomeScreen(),
    ),
  ],
);

String? _handleRootRedirect(
  final BuildContext context,
  final GoRouterState state,
) {
  final appStatus = context.read<AppStatusNotifier>().value;
  final location = state.uri.toString();
  // Prevent anyone from navigating away from `/` if app is starting up.
  if (appStatus == AppStatus.loading && location != ScreenPaths.root.value) {
    return ScreenPaths.root.value;
  }

  debugPrint('Navigate to: ${state.uri}');
  return null; // do nothing
}

/// runtime only
class AppPathsController {
  AppPathsController.of(this.context);
  final BuildContext context;
  void toRoot() => to(ScreenPaths.root.value);
  void to(final String path) => context.go(path);
}

extension AppBuildContextX on BuildContext {
  GoRouter get router => GoRouter.of(this);
  Map<String, String> get routeParams =>
      router.routerDelegate.currentConfiguration.pathParameters;
}
