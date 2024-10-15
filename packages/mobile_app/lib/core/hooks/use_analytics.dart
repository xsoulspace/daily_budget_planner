import 'package:mobile_app/common_imports.dart';

AnalyticsService useAnalyticsService() =>
    useAnalyticsManager().analyticsService;
AnalyticsManager useAnalyticsManager() => useContext().read<AnalyticsManager>();

void useLogScreenView(final String screenName) {
  final analytics = useAnalyticsManager();
  useEffect(
    () {
      unawaited(analytics.setCurrentScreen(screenName));
      return null;
    },
    [screenName],
  );
}
