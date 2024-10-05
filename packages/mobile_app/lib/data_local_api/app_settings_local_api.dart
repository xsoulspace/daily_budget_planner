import 'package:mobile_app/data_local_api/local_api_service.dart';
import 'package:mobile_app/foundation/models/models.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class AppSettingsApiLocalService {
  AppSettingsApiLocalService({
    required this.localApiService,
  });
  final LocalApiService localApiService;
  static const _persistenceKey = 'settings';
  Future<void> saveSettings({
    required final AppSettingsModel settings,
  }) async {
    await localApiService.setInstance(
      key: _persistenceKey,
      value: settings,
      toJson: (final instance) => instance.toJson(),
    );
  }

  Future<AppSettingsModel> loadSettings() async => localApiService.getInstance(
        key: _persistenceKey,
        defaultValue: AppSettingsModel.empty,
        fromJson: (final json) =>
            json.isEmpty ? null : AppSettingsModel.fromJson(json),
      );
}
