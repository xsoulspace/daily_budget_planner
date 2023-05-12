import '../../../models/models.dart';
import '../../interfaces/interfaces.dart';
import 'local_api_service.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class UserApiLocalServiceImpl implements UserApiLocalService {
  UserApiLocalServiceImpl({
    required this.localApiService,
  });
  final LocalApiService localApiService;
  static const _persistenceKey = 'user';
  @override
  Future<void> saveUser({
    required final UserModel user,
  }) async {
    await localApiService.setMap(_persistenceKey, user.toJson());
  }

  @override
  Future<UserModel> loadUser() async => localApiService.getInstance(
        key: _persistenceKey,
        defaultValue: UserModel.empty,
        fromJson: (final json) =>
            json.isEmpty ? null : UserModel.fromJson(json),
      );
}
