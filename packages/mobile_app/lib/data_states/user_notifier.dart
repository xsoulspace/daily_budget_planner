import 'package:mobile_app/common_imports.dart';

final class UserNotifier extends ValueNotifier<UserModel> {
  UserNotifier() : super(UserModel.empty);
  Future<void> loadProfile() async {
    final localUser = await _userRepository.getLocalUser(UserModel.empty);
    value = localUser;
  }

  Future<void> changeLanguage(final Locale locale) async {
    await S.delegate.load(locale);
    final updatedUser = value.copyWith(locale: locale);
    value = updatedUser;
    unawaited(_userRepository.saveUserLocally(updatedUser));
  }

  void reset() => value = UserModel.empty;
}
