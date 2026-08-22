import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/monthly/monthly_notifier.dart';
import 'package:mobile_app/ui_home/weekly/weekly_notifier.dart';

class GlobalStateProviders extends StatelessWidget {
  const GlobalStateProviders({required this.builder, super.key});

  final WidgetBuilder builder;

  @override
  Widget build(final BuildContext context) {
    const g = Di.get;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PredictionConfigResource>.value(value: g()),
        ChangeNotifierProvider<OneTimeSumResource>.value(value: g()),
        ChangeNotifierProvider<TotalSumResource>.value(value: g()),
        ChangeNotifierProvider<DailyBudgetResource>.value(value: g()),
        ChangeNotifierProvider<IncomeTasksResource>.value(value: g()),
        ChangeNotifierProvider<ExpenseTasksResource>.value(value: g()),
        ChangeNotifierProvider<TaskTransactionsResource>.value(value: g()),
        ChangeNotifierProvider<TransactionsConfigResource>.value(value: g()),
        ChangeNotifierProvider<BudgetsResource>.value(value: g()),
        ChangeNotifierProvider<PlannedSumResource>.value(value: g()),
        ChangeNotifierProvider<RecentBudgetResource>.value(value: g()),
        ChangeNotifierProvider<UiTimelineNotifier>.value(value: g()),
        ChangeNotifierProvider<UserNotifier>.value(value: g()),
        ChangeNotifierProvider<UiLocaleResource>.value(value: g()),
        ChangeNotifierProvider<AppStatusResource>.value(value: g()),
        ChangeNotifierProvider<AppSettingsNotifier>.value(value: g()),
        ChangeNotifierProvider<FinSettingsNotifier>.value(value: g()),
        ChangeNotifierProvider<WeeklyNotifier>.value(value: g()),
        ChangeNotifierProvider<MonthlyNotifier>.value(value: g()),
        ChangeNotifierProvider<MonetizationStoreStatusResource>.value(
          value: g(),
        ),
        ChangeNotifierProvider<MonetizationTypeResource>.value(value: g()),
        ChangeNotifierProvider<ActiveSubscriptionResource>.value(value: g()),
        ChangeNotifierProvider<SubscriptionStatusResource>.value(value: g()),
        ChangeNotifierProvider<AvailableSubscriptionsResource>.value(
          value: g(),
        ),
        ChangeNotifierProvider<PaywallSelectedSubscriptionResource>.value(
          value: g(),
        ),
        ChangeNotifierProvider<PurchasePaywallErrorResource>.value(value: g()),
        Provider<AnalyticsManager>.value(value: g()),
        Provider<AnalyticsService>.value(value: g()),
        Provider<MonetizationFoundation>.value(value: g()),
        ChangeNotifierProvider<StoreReviewRequester>.value(value: g()),
      ],
      child: builder(context),
    );
  }
}
