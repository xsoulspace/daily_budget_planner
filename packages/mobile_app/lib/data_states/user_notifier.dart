import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:ui_locale/ui_locale.dart';

final class UserNotifier extends ValueNotifier<UserModel> {
  UserNotifier({
    required this.repositories,
  }) : super(UserModel.empty);
  final RepositoriesCollection repositories;
  UserRepository get _userRepository => repositories.user;
  Future<void> loadProfile() async {
    final localUser = await _userRepository.getLocalUser(UserModel.empty);
    value = localUser;
  }

  Future<void> changeLanguage(final Locale locale) async {
    await S.delegate.load(locale);
    final updatedUser = state.copyWith(locale: locale);
    value = updatedUser;
    unawaited(_userRepository.saveUserLocally(updatedUser));
  }

  void reset() => value = UserModel.empty;
}
