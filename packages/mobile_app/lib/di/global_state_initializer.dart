import 'package:life_hooks/life_hooks.dart' hide Disposable;
import 'package:mobile_app/common_imports.dart';

class PreloadingScreen extends StatefulWidget {
  const PreloadingScreen({super.key});

  @override
  State<PreloadingScreen> createState() => _PreloadingScreenState();
}

class _PreloadingScreenState extends State<PreloadingScreen> {
  final _initializer = GlobalInitializerImpl();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
      unawaited(_initializer.onLoad());
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _initializer.dispose();
  }

  @override
  Widget build(final BuildContext context) => const LoadingScreen();
}

class GlobalStateInitializer
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
      AppPathsController.of(context).toHome();
    });
  }

  @override
  void dispose() {}
}
