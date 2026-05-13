import 'package:mobile_app/data_local_api/kernel_map_storage_bridge.dart';
import 'package:mobile_app/data_models/data_models.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class UserLocalApi {
  UserLocalApi({
    required final LocalDbI localDb,
    required final StorageKernel storageKernel,
    final StorageNamespace userNamespace = _defaultUserNamespace,
  })  : _kernelMapStore = KernelMapStorageBridge(
          localDb: localDb,
          storageKernel: storageKernel,
        ),
        _userNamespace = userNamespace;

  static const _persistenceKey = 'user';
  static const _kernelPath = 'profile/user_v1.json';
  static const _defaultUserNamespace = StorageNamespace('user');

  final KernelMapStorageBridge _kernelMapStore;
  final StorageNamespace _userNamespace;

  Future<void> saveUser({
    required final UserModel user,
  }) =>
      _kernelMapStore.writeMap(
        legacyKey: _persistenceKey,
        namespace: _userNamespace,
        kernelPath: _kernelPath,
        value: user.toJson(),
      );

  Future<UserModel> loadUser() async {
    final json = await _kernelMapStore.readMap(
      legacyKey: _persistenceKey,
      namespace: _userNamespace,
      kernelPath: _kernelPath,
    );
    if (json.isEmpty) return UserModel.empty;
    return UserModel.fromJson(json);
  }
}
