import 'package:mobile_app/common_imports.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class UserLocalApi {
  UserLocalApi({
    required this.localApi,
  });
  final LocalApiService localApi;
  static const _persistenceKey = 'user';

  Future<void> saveUser({
    required final UserModel user,
  }) async {
    await localApi.setMap(_persistenceKey, user.toJson());
  }

  Future<UserModel> loadUser() async => localApi.getInstance(
        key: _persistenceKey,
        defaultValue: UserModel.empty,
        fromJson: (final json) =>
            json.isEmpty ? null : UserModel.fromJson(json),
      );
}
