import 'package:get_it/get_it.dart';
import 'package:mobile_app/common_imports.dart';

/// Shortcuts
/// Should not be exposed
final _getIt = GetIt.instance;
final _get = _getIt.get;

/// shortcutting
class Di {
  Di._();
  static const init = _init;
  static const dispose = _dispose;
  static T get<T extends Object>() => _getIt.get<T>();
}

void _dispose() => unawaited(_getIt.reset());

void _init() {
  /// ********************************************
  /// *      Stateless Singletones
  /// ********************************************
  final r = _getIt.registerSingleton;
  r<LocalDbI>(PrefsDb());
  r(UserNotifier());
  r(AppSettingsLocalApi());
}

mixin HasLocalApis {
  LocalDbI get localDb => _get<LocalDbI>();
  AppSettingsLocalApi get appSettingsApi => _get<AppSettingsLocalApi>();
}
