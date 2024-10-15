import 'package:mobile_app/common_imports.dart';

final class UserNotifier extends ValueNotifier<UserModel> with HasLocalApis {
  UserNotifier() : super(UserModel.empty);
  Future<void> loadProfile() async {
    final localUser = await userLocalApi.loadUser();
    value = localUser;
  }

  void reset() => value = UserModel.empty;
}
