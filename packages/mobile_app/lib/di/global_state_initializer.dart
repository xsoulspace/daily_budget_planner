import 'package:life_hooks/life_hooks.dart';
import 'package:mobile_app/common_imports.dart';

class PreloadingScreen extends StatefulWidget {
  const PreloadingScreen({super.key});

  @override
  State<PreloadingScreen> createState() => _PreloadingScreenState();
}

class _PreloadingScreenState extends State<PreloadingScreen> {
  final _initializer = GlobalStateInitializer();
  @override
  void initState() {
    super.initState();
    unawaited(_initializer.onLoad(context));
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
    with HasLocalApis, HasStates, HasAnalyticsService
    implements StateInitializer, Disposable {
  @override
  Future<void> onLoad(final BuildContext context) async {
    await localDb.init();
    // FlutterNativeSplash.remove();
    await Future.wait([
      userNotifier.loadProfile(),
      appSettingsNotifier.onLoad(),
    ]);
    final guideVisibility = GuideVisibility();
    final hasSeenGuide = await guideVisibility.hasSeenGuide;

    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) async {
      appStatusNotifier.value = AppStatus.online;
      AppPathsController.of(context).toHome();
      if (!hasSeenGuide) {
        guideVisibility.setGuideWasOpen();
        AppPathsController.of(context).toExplanation(isFirstTimeOpening: true);
      }
      unawaited(
        Future.wait([
          weeklyCubit.onLoad(),
          monthlyCubit.onLoad(),
        ]),
      );
      await purchaseIntializer.init();
    });
  }

  @override
  void dispose() {}
}

class GuideVisibility with HasLocalApis {
  const GuideVisibility();
  static const _key = 'has_seen_guide';

  void setGuideWasOpen() => unawaited(localDb.setBool(key: _key, value: true));
  Future<bool> get hasSeenGuide => localDb.getBool(key: _key);
}
