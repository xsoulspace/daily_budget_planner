import 'package:mobile_app/common_imports.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class AppSettingsLocalApi with HasLocalApis {
  static const _persistenceKey = 'settings';
  Future<void> saveSettings({
    required final AppSettingsModel settings,
  }) async {
    await localDb.setItem(
      key: _persistenceKey,
      value: settings,
      toJson: (final instance) => instance.toJson(),
    );
  }

  Future<AppSettingsModel> loadSettings() async => localDb.getItem(
        key: _persistenceKey,
        defaultValue: AppSettingsModel.empty,
        fromJson: (final json) => json.isEmpty
            ? AppSettingsModel.empty
            : AppSettingsModel.fromJson(json),
      );
}
