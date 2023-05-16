part of 'models.dart';

@freezed
class BlocProvidersModel with _$BlocProvidersModel {
  const factory BlocProvidersModel({
    required final Create<AuthCubit> authCubit,
    required final Create<UserCubit> userCubit,
  }) = _BlocProvidersModel;

  factory BlocProvidersModel.appRuntime() => BlocProvidersModel(
        authCubit: (final context) =>
            AuthCubit(dto: AuthCubitDto(context: context)),
        userCubit: (final context) => UserCubit(
          repositories: context.read(),
        ),
      );
  factory BlocProvidersModel.mock() => BlocProvidersModel(
        authCubit: (final context) =>
            AuthCubit(dto: AuthCubitDto(context: context)),
        userCubit: (final context) => UserCubit(
          repositories: context.read(),
        ),
      );
}
