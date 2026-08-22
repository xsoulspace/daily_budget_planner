import 'package:life_hooks/life_hooks.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_pay/monetization_products.dart';

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
    with HasLocalApis, HasNotifiers, HasAnalytics, HasComplexLocalDbs
    implements StateInitializer, Disposable {
  /// Initializes the monetization foundation (local restore + store init).
  Future<void> purchaseInitializerInit() async {
    final monetization = monetizationFoundation;
    await monetization.initLocal();
    await monetization.init(
      productIds: MonetizationProducts.subscriptionsForBuild,
    );
  }

  @override
  Future<void> onLoad(final BuildContext context) async {
    await Future.wait([localDb.init(), sembastDb.open()]);
    // FlutterNativeSplash.remove();
    await Future.wait([
      userNotifier.loadProfile(),
      appSettingsNotifier.onLoad(),
    ]);
    const guideVisibility = GuideVisibility();
    final hasSeenGuide = await guideVisibility.hasSeenGuide;

    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) async {
      appStatusNotifier.value = AppStatus.online;
      AppPathsController.of(context).toHome();
      if (!hasSeenGuide) {
        guideVisibility.setGuideWasOpen();
        AppPathsController.of(context).toExplanation(isFirstTimeOpening: true);
      }
      await purchaseInitializerInit();
      await dictionariesNotifier.onLoad();
      await finSettingsNotifier.onLoad();
      await Future.wait([
        weeklyCubit.onLoad(),
        monthlyCubit.onLoad(),
        storeReviewRequester.onLoad(),
        const LoadTasksCommand().execute(),
        const LoadBudgetsCmd().execute(),
        const LoadTransactionsCmd().execute(),
        const LoadTransactionsCmd().execute(),
      ]);
    });
  }

  @override
  void dispose() {}
}

@immutable
class GuideVisibility with HasLocalApis {
  const GuideVisibility();
  static const _key = 'has_seen_guide';

  void setGuideWasOpen() => unawaited(localDb.setBool(key: _key, value: true));
  Future<bool> get hasSeenGuide => localDb.getBool(key: _key);
}
