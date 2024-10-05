import 'package:mobile_app/common_imports.dart';

export 'app_settings_local_api.dart';
export 'budget_local_api.dart';
export 'user_local_api.dart';

class LocalApiServices {
  const LocalApiServices._({
    required this.localApi,
    required this.appSettings,
    required this.budget,
    required this.user,
  });

  factory LocalApiServices.buildAppRuntime() {
    final localApi = LocalApiSharedPreferences();
    return LocalApiServices._(
      localApi: localApi,
      user: UserLocalApi(localApi: localApi),
      appSettings: AppSettingsLocalApi(
        localApiService: localApi,
      ),
      budget: BudgetLocalApi(localApi: localApi),
    );
  }
  final BudgetLocalApi budget;
  final LocalApiService localApi;
  final UserLocalApi user;
  final AppSettingsLocalApi appSettings;
}
