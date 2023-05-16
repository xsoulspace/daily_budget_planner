import '../../../core.dart';
import '../interfaces/interfaces.dart';

final class UserRepository
    extends Repository<UserApiRemoteService, UserApiLocalService> {
  UserRepository({required super.sources});
  Future<void> saveUserLocally(final UserModel user) async {
    await sources.local.saveUser(user: user);
  }

  Future<UserModel> getLocalUser(final UserModel user) async =>
      sources.local.loadUser();

  void signIn() {
    // TODO(arenukvern): description
    throw UnimplementedError();
  }

  void signOut() {
    // TODO(arenukvern): description
    throw UnimplementedError();
  }
}
