import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_paywalls/ui_paywalls.dart';

enum ScreenPaths {
  root('/'),
  home('/home'),
  paywall('paywall'),
  explanation('explain');

  const ScreenPaths(this.value);
  final String value;
}

final router = GoRouter(
  redirect: _handleRootRedirect,
  initialLocation: ScreenPaths.root.value,
  debugLogDiagnostics: true,
  routes: [
    AppRoute(
      ScreenPaths.root.value,
      (final context, final state) => const PreloadingScreen(),
      routes: [
        AppRoute(
          ScreenPaths.home.value,
          (final context, final state) => const HomeScreen(),
          routes: [
            AppRoute(
              ScreenPaths.paywall.value,
              (final context, final state) => const PaywallScreen(),
            ),
            AppRoute(
              ScreenPaths.explanation.value,
              (final context, final state) => MethodExplanationScreen(
                isFirstOpening:
                    state.uri.queryParameters['isFirstOpening'] != null,
              ),
            ),
          ],
        ),
      ],
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
  void toRoot() => go(ScreenPaths.root);
  void toHome() => go(ScreenPaths.home);
  void toPaywall() => go(ScreenPaths.paywall, routes: [ScreenPaths.home]);
  void toExplanation() => go(
        ScreenPaths.explanation,
        routes: [ScreenPaths.home],
        params: {
          'isFirstOpening': 'true',
        },
      );
  void go(
    final ScreenPaths path, {
    final List<ScreenPaths> routes = const [],
    final Map<String, String> params = const {},
  }) {
    final pathWithRoutes =
        '${routes.isEmpty ? '' : '${routes.map((final e) => e.value).join('/')}/'}${path.value}';
    final uri = Uri(path: pathWithRoutes, queryParameters: params);
    to(uri.toString());
  }

  void to(final String path) => context.go(path);
}

extension RouterBuildContextX on BuildContext {
  GoRouter get router => GoRouter.of(this);
  Map<String, String> get routeParams =>
      router.routerDelegate.currentConfiguration.pathParameters;
}

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(
    final String path,
    final Widget Function(BuildContext context, GoRouterState state) builder, {
    final List<GoRoute> routes = const [],
    final bool useFade = false,
    final bool isTransparent = false,
  }) : super(
          path: path,
          routes: routes,
          pageBuilder: (final context, final state) {
            // final pageContent = Scaffold(
            //   body: builder(state),
            //   resizeToAvoidBottomInset: false,
            // );
            final pageContent = builder(context, state);
            if (useFade || isTransparent) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                opaque: !isTransparent,
                barrierColor: Colors.transparent,
                transitionsBuilder: (
                  final context,
                  final animation,
                  final secondaryAnimation,
                  final child,
                ) =>
                    FadeTransition(opacity: animation, child: child),
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
}
