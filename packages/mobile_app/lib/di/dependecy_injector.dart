import 'package:get_it/get_it.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_states/app_settings_notifier.dart';

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

void _init() {
  final r = _getIt.registerSingleton;

  /// ********************************************
  /// *      Stateless
  /// ********************************************
  r<AnalyticsService>(AnalyticsServiceImpl());

  /// ********************************************
  /// *      API
  /// ********************************************
  r<LocalDbI>(PrefsDb());
  r(UserLocalApi());
  r(AppSettingsLocalApi());
  r(BudgetLocalApi());

  /// ********************************************
  /// *      STATES
  /// ********************************************
  r(UiLocaleNotifier(Locales.en));
  r(AppSettingsNotifier());
  r(UserNotifier());
  r(AppStatusNotifier());
}

mixin HasLocalApis {
  LocalDbI get localDb => _g<LocalDbI>();
  AppSettingsLocalApi get appSettingsApi => _g<AppSettingsLocalApi>();
  UserLocalApi get userLocalApi => _g<UserLocalApi>();
  BudgetLocalApi get budgetLocalApi => _g<BudgetLocalApi>();
}
mixin HasUserNotifier {
  UserNotifier get userNotifier => _g<UserNotifier>();
}
mixin HasAppStatusNotifier {
  AppStatusNotifier get appStatusNotifier => _g<AppStatusNotifier>();
}
mixin HasLocaleNotifier {
  UiLocaleNotifier get localeNotifier => _g<UiLocaleNotifier>();
}
mixin HasAnalyticsService {
  AnalyticsService get analyticsService => _g<AnalyticsService>();
}
mixin HasAppSettingsNotifier {
  AppSettingsNotifier get appSettingsNotifier => _g<AppSettingsNotifier>();
}
