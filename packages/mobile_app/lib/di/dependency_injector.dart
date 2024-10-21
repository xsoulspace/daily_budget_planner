import 'package:get_it/get_it.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/monthly/monthly_cubit.dart';
import 'package:mobile_app/ui_home/weekly/weekly_cubit.dart';
import 'package:mobile_app/ui_paywalls/ui_paywalls.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_notifier.dart';

/// Shortcuts
/// Should not be exposed
final _getIt = GetIt.instance;

/// get instance of a service
final _g = _getIt.get;

class Di {
  Di._();
  static const init = _init;
  static const dispose = _dispose;
  static T get<T extends Object>() => _getIt.get<T>();
}

void _dispose() => unawaited(_getIt.reset());

Future<void> _init({required final AnalyticsManager analyticsManager}) async {
  await _getIt.reset();
  final r = _getIt.registerSingleton;

  /// ********************************************
  /// *      API
  /// ********************************************
  r<AnalyticsManager>(analyticsManager);
  r<CrashlyticsService>(analyticsManager.crashlyticsService);
  r<AnalyticsService>(analyticsManager.analyticsService);
  final localDb = PrefsDb();
  r<LocalDbI>(localDb);
  r(UserLocalApi());
  r(AppSettingsLocalApi());
  r(BudgetLocalApi());

  /// ********************************************
  /// *      STATES
  /// ********************************************
  final localeNotifier = UiLocaleNotifier(Locales.fallback);
  r(localeNotifier);
  r(AppSettingsNotifier());
  r(UserNotifier());
  r(AppStatusNotifier());
  // TODO(arenukvern): create a factory for this
  final PurchaseManager purchaseManager = switch (Envs.storeTarget) {
    InstallPlatformTarget.rustore => FlutterRustoreBillingManager(
        consoleApplicationId: Envs.rustoreApplicationId,
        // ignore: avoid_redundant_argument_values
        enableLogger: Envs.logging,
        deeplinkScheme: Envs.appScheme,
        productTypeChecker: MonetizationProducts.productTypeChecker,
      ),
    InstallPlatformTarget.appleStore ||
    InstallPlatformTarget.googlePlay =>
      NoopPurchaseManager(),
    // TODO(arenukvern): description
    // InAppPurchaseManager(),
    _ => NoopPurchaseManager(),
  };
  r<PurchaseManager>(purchaseManager);
  r(UiPredictionNotifier());
  final monetizationTypeNotifier =
      MonetizationStatusNotifier(Envs.monetizationType);
  r(monetizationTypeNotifier);
  final subscriptionManager = SubscriptionManager(
    productIds: MonetizationProducts.subscriptions,
    purchaseManager: purchaseManager,
    monetizationTypeNotifier: monetizationTypeNotifier,
  );
  r(subscriptionManager);
  r(
    StoreReviewRequester(
      localDb: localDb,
      getLocale: () => localeNotifier.value,
    ),
  );
  r(
    PurchaseInitializer(
      monetizationTypeNotifier: monetizationTypeNotifier,
      purchaseManager: purchaseManager,
      subscriptionManager: subscriptionManager,
    ),
  );
  r(WeeklyCubit());
  r(MonthlyCubit());
}

mixin HasLocalApis {
  LocalDbI get localDb => _g();
  AppSettingsLocalApi get appSettingsApi => _g();
  UserLocalApi get userLocalApi => _g();
  BudgetLocalApi get budgetLocalApi => _g();
}
mixin HasStates {
  UserNotifier get userNotifier => _g();
  AppStatusNotifier get appStatusNotifier => _g();
  UiLocaleNotifier get localeNotifier => _g();
  SubscriptionManager get keeperManager => _g();
  AppSettingsNotifier get appSettingsNotifier => _g();
  PurchaseInitializer get purchaseIntializer => _g();
  SubscriptionManager get subscriptionManager => _g();
  WeeklyCubit get weeklyCubit => _g();
  MonthlyCubit get monthlyCubit => _g();
  StoreReviewRequester get storeReviewRequester => _g();
}
mixin HasAnalytics {
  AnalyticsManager get analyticsManager => _g();
  AnalyticsService get analyticsService => _g();
  CrashlyticsService get crashlyticsService => _g();
}
