import 'package:mobile_app/core.dart';
import 'package:mobile_app/foundation/interfaces/interfaces.dart';

final class UserRepository {
  UserRepository({required super.sources});
  Future<void> saveUserLocally(final UserModel user) async {
    await sources.local.saveUser(user: user);
  }

  Future<UserModel> getLocalUser(final UserModel user) async =>
      sources.local.loadUser();
}
