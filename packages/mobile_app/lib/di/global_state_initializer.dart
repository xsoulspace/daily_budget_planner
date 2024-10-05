import 'package:life_hooks/life_hooks.dart' hide Disposable;
import 'package:mobile_app/common_imports.dart';

class GlobalInitializerLoader extends StatefulWidget {
  const GlobalInitializerLoader({
    required this.builder,
    super.key,
  });
  final WidgetBuilder builder;

  @override
  State<GlobalInitializerLoader> createState() =>
      _GlobalInitializerLoaderState();
}

class _GlobalInitializerLoaderState extends State<GlobalInitializerLoader> {
  final _initializer = GlobalInitializerImpl();
  @override
  void dispose() {
    super.dispose();
    _initializer.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final isInitializedNotifier = useIsBool();
    final isInitialized = isInitializedNotifier.value;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Builder(builder: widget.builder),
          if (!isInitialized)
            FutureBuilder(
              // ignore: discarded_futures
              future: () async {
                if (isInitialized) return;
                WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
                  isInitializedNotifier.value = true;
                });

                return _initializer.onLoad();
              }(),
              builder: (final context, final snapshot) => const LoadingScreen(),
            ),
        ],
      ),
    );
  }
}

class AppDiInitializer
    with
        HasUserNotifier,
        HasAppStatusNotifier,
        HasAppSettingsNotifier,
        HasLocaleNotifier,
        HasAnalyticsService
    implements StateInitializer, Disposable {
  @override
  Future<void> onLoad(final BuildContext context) async {
    // FlutterNativeSplash.remove();
    await Future.wait([
      userNotifier.loadProfile(),
    ]);

    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
      appStatusNotifier.value = AppStatus.online;
    });
  }

  @override
  void dispose() {}
}
