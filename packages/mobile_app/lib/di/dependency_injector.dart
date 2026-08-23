import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/di/storage_kernel_bootstrap.dart';
import 'package:mobile_app/ui_home/monthly/monthly_notifier.dart';
import 'package:mobile_app/ui_home/weekly/weekly_notifier.dart';
import 'package:mobile_app/ui_pay/paywall_flow.dart';
import 'package:mobile_app/ui_pay/monetization_products.dart';
import 'package:xsoulspace_installation_store/xsoulspace_installation_store.dart';
import 'package:xsoulspace_monetization_foundation/xsoulspace_monetization_foundation.dart';
import 'package:xsoulspace_monetization_interface/xsoulspace_monetization_interface.dart';
import 'package:xsoulspace_monetization_rustore/xsoulspace_monetization_rustore.dart';

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
  final rl = _getIt.registerLazySingleton;
  FutureOr<dynamic> d<T>(final T instance) {
    if (instance is ChangeNotifier) {
      instance.dispose();
    } else {
      assert(false, 'Not implemented');
    }
  }

  /// ********************************************
  /// *      API
  /// ********************************************
  r<AnalyticsManager>(analyticsManager, dispose: d);
  r<CrashlyticsService>(analyticsManager.crashlyticsService, dispose: d);
  r<AnalyticsService>(analyticsManager.analyticsService, dispose: d);
  final storageKernelBootstrap = DailyBudgetStorageKernelBootstrap();
  await storageKernelBootstrap.initialize();
  final storageKernel = storageKernelBootstrap.kernel;
  r(storageKernelBootstrap);
  final localDb = PrefsDb();
  // final isarDb = IsarDb();
  final sembastDb = SembastDb();

  r<LocalDbI>(localDb);
  // r<IsarDb>(isarDb, dispose: (final i) => i.close());
  r<SembastDb>(sembastDb, dispose: (final i) => i.close());
  r(UserLocalApi(localDb: localDb, storageKernel: storageKernel));
  r(AppSettingsLocalApi(localDb: localDb, storageKernel: storageKernel));
  r(BudgetLocalApi(localDb: localDb, storageKernel: storageKernel));
  rl<ManualBudgetsLocalApi>(ManualBudgetsLocalApiSembast.new);
  rl(DictionariesLocalApi.new);
  rl(FinSettingsLocalApi.new);
  rl<TransactionsLocalApi>(TransactionsLocalApiSembast.new);
  rl<ScheduledTransactionsLocalApi>(ScheduledTransactionsLocalApiSembast.new);
  rl<TasksLocalApi>(TasksLocalApiSembast.new);
  rl<CommitmentsLocalApi>(CommitmentsLocalApiSembast.new);
  rl<PlannedSumsLocalApi>(PlannedSumsLocalApiSembast.new);

  /// ********************************************
  /// *      RESOURCES
  /// ********************************************
  rl(IncomeTasksResource.new, dispose: d);
  rl(ExpenseTasksResource.new, dispose: d);
  rl(TaskTransactionsResource.new, dispose: d);
  rl(TransactionsConfigResource.new, dispose: d);
  rl(IncomeTransactionsResource.new, dispose: d);
  rl(ExpenseTransactionsResource.new, dispose: d);
  rl(TransferInTransactionsResource.new, dispose: d);
  rl(TransferOutTransactionsResource.new, dispose: d);
  rl(BudgetsResource.new, dispose: d);
  rl(RecentBudgetResource.new, dispose: d);
  rl(PredictionConfigResource.new, dispose: d);
  rl(OneTimeSumResource.new, dispose: d);
  rl(TotalSumResource.new, dispose: d);
  rl(DailyBudgetResource.new, dispose: d);
  rl(PlannedSumResource.new, dispose: d);
  rl(CommitmentsResource.new, dispose: d);
  rl(PlannedSumsStoreResource.new, dispose: d);

  /// ********************************************
  /// *      Notifiers
  /// ********************************************
  final localeNotifier = UiLocaleResource(Locales.fallback);
  r(localeNotifier, dispose: d);
  rl(AppSettingsNotifier.new, dispose: d);
  rl(UserNotifier.new, dispose: d);
  rl(AppStatusResource.new, dispose: d);
  // TODO(arenukvern): create a factory for this
  /// possible conflicts with purchase managers
  /// ********************************************
  /// *      MONETIZATION
  /// ********************************************
  rl<MonetizationStoreStatusResource>(
    MonetizationStoreStatusResource.new,
    dispose: d,
  );
  rl<MonetizationTypeResource>(
    () => MonetizationTypeResource(Envs.monetizationType),
    dispose: d,
  );
  rl<ActiveSubscriptionResource>(ActiveSubscriptionResource.new, dispose: d);
  rl<SubscriptionStatusResource>(SubscriptionStatusResource.new, dispose: d);
  rl<AvailableSubscriptionsResource>(
    AvailableSubscriptionsResource.new,
    dispose: d,
  );
  rl<PaywallSelectedSubscriptionResource>(
    PaywallSelectedSubscriptionResource.new,
    dispose: d,
  );
  rl<PurchasePaywallErrorResource>(
    PurchasePaywallErrorResource.new,
    dispose: d,
  );
  rl<PurchasesLocalApi>(() => PurchasesLocalApi(localDb: localDb));
  rl<PurchaseFlagsLocalApi>(() => PurchaseFlagsLocalApi(localDb: localDb));
  rl(
    () => MonetizationFoundation(
      resources: (
        status: _g(),
        type: _g(),
        activeSubscription: _g(),
        subscriptionStatus: _g(),
        availableSubscriptions: _g(),
        paywallSelectedSubscription: _g(),
        purchasePaywallError: _g(),
      ),
      purchasesLocalApi: _g(),
      purchaseProvider: switch (Envs.storeTarget) {
        InstallationTargetStore.rustore => RustorePurchaseProvider(
          consoleApplicationId: Envs.rustoreApplicationId,
          deeplinkScheme: Envs.appScheme,
          // ignore: avoid_redundant_argument_values
          enableLogging: Envs.logging,
          productTypeChecker: MonetizationProducts.productTypeChecker,
        ),
        InstallationTargetStore.mobileAppleAppStore ||
        InstallationTargetStore.mobileGooglePlay ||
        InstallationTargetStore.huawei => NoopPurchaseProvider(),
        _ => NoopPurchaseProvider(),
      },
    ),
    dispose: (final instance) => instance.dispose(),
  );
  rl(
    () => StoreReviewRequester(
      localDb: localDb,
      getLocale: () => localeNotifier.value,
    ),
    dispose: d,
  );
  rl(
    () => UiTimelineNotifier(
      state: UiTimelineState.create(
        presentationType: UiPresentationType.day,
        initialDate: DateTime.now(),
      ),
    ),
    dispose: d,
  );
  rl(DictionariesNotifier.new, dispose: d);
  rl(FinSettingsNotifier.new, dispose: d);
  rl(WeeklyNotifier.new, dispose: d);
  rl(MonthlyNotifier.new, dispose: d);
}

mixin HasLocalApis {
  LocalDbI get localDb => _g();
  AppSettingsLocalApi get appSettingsApi => _g();
  UserLocalApi get userLocalApi => _g();
  FinSettingsLocalApi get finSettingsLocalApi => _g();

  BudgetLocalApi get simpleBudgetLocalApi => _g();
  ManualBudgetsLocalApi get manualBudgetsLocalApi => _g();
  CommitmentsLocalApi get commitmentsLocalApi => _g();
  PlannedSumsLocalApi get plannedSumsLocalApi => _g();

  DictionariesLocalApi get dictionariesLocalApi => _g();
  TransactionsLocalApi get transactionsLocalApi => _g();
  ScheduledTransactionsLocalApi get scheduledTransactionsLocalApi => _g();
  TasksLocalApi get tasksLocalApi => _g();
}

/// Resources cannot access any Notifiers directly.
/// They have simple mission - to distribute and store runtime data
/// for ui access.
mixin HasResources {
  IncomeTasksResource get incomeTasksResource => _g();
  ExpenseTasksResource get expenseTasksResource => _g();

  TransactionsConfigResource get transactionsConfigResource => _g();
  TaskTransactionsResource get tasksTransactionsResource => _g();
  IncomeTransactionsResource get incomeTransactionsResource => _g();
  ExpenseTransactionsResource get expenseTransactionsResource => _g();
  TransferInTransactionsResource get transferInTransactionsResource => _g();
  TransferOutTransactionsResource get transferOutTransactionsResource => _g();
  BudgetsResource get budgetsResource => _g();
  RecentBudgetResource get recentBudgetResource => _g();
  PredictionConfigResource get predictionConfigResource => _g();
  DailyBudgetResource get dailyBudgetResource => _g();
  CommitmentsResource get commitmentsResource => _g();
  PlannedSumsStoreResource get plannedSumsStoreResource => _g();

  /// ********************************************
  /// *      SUM RESOURCES
  /// ********************************************
  OneTimeSumResource get oneTimeSumsResource => _g();
  PlannedSumResource get plannedSumsResource => _g();
  TotalSumResource get totalSumResource => _g();
}

/// These states should not be used in each other,
/// but they can access Distributors via [HasResources]
///
/// States can and should have business logic, but should minimize
/// state usage to make ui management more effective.
mixin HasNotifiers {
  UserNotifier get userNotifier => _g();
  AppStatusResource get appStatusNotifier => _g();
  UiLocaleResource get localeNotifier => _g();
  AppSettingsNotifier get appSettingsNotifier => _g();
  MonetizationFoundation get monetizationFoundation => _g();
  WeeklyNotifier get weeklyCubit => _g();
  MonthlyNotifier get monthlyCubit => _g();
  StoreReviewRequester get storeReviewRequester => _g();
  DictionariesNotifier get dictionariesNotifier => _g();
  FinSettingsNotifier get finSettingsNotifier => _g();
  UiTimelineNotifier get uiTimelineNotifier => _g();
}

mixin HasAnalytics {
  AnalyticsManager get analyticsManager => _g();
  AnalyticsService get analyticsService => _g();
  CrashlyticsService get crashlyticsService => _g();
}

mixin HasComplexLocalDbs {
  // IsarDb get isarDb => _g();
  SembastDb get sembastDb => _g();
}
