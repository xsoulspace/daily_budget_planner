import 'package:mobile_app/data_local_api/kernel_map_storage_bridge.dart';
import 'package:mobile_app/data_models/data_models.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class AppSettingsLocalApi {
  AppSettingsLocalApi({
    required final LocalDbI localDb,
    required final StorageKernel storageKernel,
    final StorageNamespace settingsNamespace = _defaultSettingsNamespace,
  })  : _kernelMapStore = KernelMapStorageBridge(
          localDb: localDb,
          storageKernel: storageKernel,
        ),
        _settingsNamespace = settingsNamespace;

  static const _persistenceKey = 'settings';
  static const _kernelPath = 'app/settings_v1.json';
  static const _defaultSettingsNamespace = StorageNamespace.settings;

  final KernelMapStorageBridge _kernelMapStore;
  final StorageNamespace _settingsNamespace;

  Future<void> saveSettings({
    required final AppSettingsModel settings,
  }) async {
    await _kernelMapStore.writeMap(
      legacyKey: _persistenceKey,
      namespace: _settingsNamespace,
      kernelPath: _kernelPath,
      value: settings.toJson(),
    );
  }

  Future<AppSettingsModel> loadSettings() async {
    final json = await _kernelMapStore.readMap(
      legacyKey: _persistenceKey,
      namespace: _settingsNamespace,
      kernelPath: _kernelPath,
    );
    if (json.isEmpty) return AppSettingsModel.empty;
    return AppSettingsModel.fromJson(json);
  }
}
