import 'package:mobile_app/common_imports.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class UserLocalApi with HasLocalApis {
  static const _persistenceKey = 'user';

  Future<void> saveUser({
    required final UserModel user,
  }) async =>
      localDb.setMap(key: _persistenceKey, value: user.toJson());

  Future<UserModel> loadUser() async => localDb.getItem(
        key: _persistenceKey,
        defaultValue: UserModel.empty,
        fromJson: (final json) =>
            json.isEmpty ? null : UserModel.fromJson(json),
      );
}
