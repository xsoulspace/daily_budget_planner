import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/monthly/monthly_cubit.dart';
import 'package:mobile_app/ui_home/weekly/weekly_cubit.dart';

class GlobalStateProviders extends StatelessWidget {
  const GlobalStateProviders({required this.builder, super.key});

  final WidgetBuilder builder;

  @override
  Widget build(final BuildContext context) {
    const g = Di.get;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>.value(value: g()),
        ChangeNotifierProvider<UiLocaleNotifier>.value(value: g()),
        ChangeNotifierProvider<AppStatusNotifier>.value(value: g()),
        ChangeNotifierProvider<AppSettingsNotifier>.value(value: g()),
        ChangeNotifierProvider<SubscriptionManager>.value(value: g()),
        ChangeNotifierProvider<WeeklyCubit>.value(value: g()),
        ChangeNotifierProvider<MonthlyCubit>.value(value: g()),
        ChangeNotifierProvider<MonetizationStatusNotifier>.value(value: g()),
        Provider<AnalyticsManager>.value(value: g()),
        Provider<AnalyticsService>.value(value: g()),
        Provider<PurchaseInitializer>.value(value: g()),
        ChangeNotifierProvider<StoreReviewRequester>.value(value: g()),
      ],
      child: builder(context),
    );
  }
}
