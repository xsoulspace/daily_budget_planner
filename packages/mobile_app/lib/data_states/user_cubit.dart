import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core.dart';
import 'package:ui_locale/ui_locale.dart';

final class UserCubit extends Cubit<UserModel> {
  UserCubit({
    required this.repositories,
  }) : super(UserModel.empty);
  final RepositoriesCollection repositories;
  UserRepository get _userRepository => repositories.user;
  Future<void> loadProfile() async {
    final localUser = await _userRepository.getLocalUser(UserModel.empty);
    emit(localUser);
  }

  Future<void> changeLanguage(final Locale locale) async {
    await S.delegate.load(locale);
    final updatedUser = state.copyWith(locale: locale);
    emit(updatedUser);
    unawaited(_userRepository.saveUserLocally(updatedUser));
  }

  void reset() {
    emit(UserModel.empty);
  }
}
