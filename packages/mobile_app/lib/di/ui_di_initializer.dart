import 'dart:async';

import 'package:life_hooks/life_hooks.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/states/states.dart';
import 'package:provider/provider.dart';

/// ********************************************
/// *      Widget
/// ********************************************
class AppDiInitializerLoader extends StatefulWidget {
  const AppDiInitializerLoader({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  State<AppDiInitializerLoader> createState() => _AppDiInitializerLoaderState();
}

class _AppDiInitializerLoaderState extends State<AppDiInitializerLoader> {
  bool _isInitialized = false;
  final _initalizer = AppDiInitializer();

  @override
  Widget build(final BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            widget.child,
            if (!_isInitialized)
              FutureBuilder(
                // ignore: discarded_futures
                future: () async {
                  if (_isInitialized) return;
                  _isInitialized = true;
                  WidgetsBinding.instance
                      .addPostFrameCallback((final timeStamp) {
                    setState(() {});
                  });

                  return _initalizer.onLoad(context);
                }(),
                builder: (final context, final snapshot) =>
                    const LoadingScreen(),
              ),
          ],
        ),
      );
}

/// ********************************************
/// *      Initializer
/// ********************************************

class _AppDiInitializerDto {
  _AppDiInitializerDto.of(final Locator read)
      : authCubit = read(),
        adManager = read();
  final AuthCubit authCubit;
  final AdManager adManager;
}

class AppDiInitializer implements StateInitializer {
  /// If you need to wait until, then add await for
  /// required functions. But notice: every await
  /// function will increase app loading time because
  /// at the time the loader will be shown instead of the app.

  @override
  Future<void> onLoad(final BuildContext context) async {
    // FlutterNativeSplash.remove();

    final dto = _AppDiInitializerDto.of(context.read);
    unawaited(
      Future.wait([dto.authCubit.onLoad(), dto.adManager.onLoad()]),
    );
  }
}
