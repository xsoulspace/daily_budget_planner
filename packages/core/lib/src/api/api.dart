import '../../core.dart';

export 'clients/clients.dart';
export 'implementations/implementations.dart';
export 'interfaces/interfaces.dart';

class RemoteApiServices {
  const RemoteApiServices._({
    required this.user,
  });
  factory RemoteApiServices.buildAppRuntime() {
    final userApi = UserApiRemoteServiceFirebaseImpl();
    return RemoteApiServices._(
      user: userApi,
    );
  }
  factory RemoteApiServices.buildMockRuntime() {
    // TODO(arenukvern): description
    throw UnimplementedError('reason');
  }

  final UserApiRemoteService user;
}

class LocalApiServices {
  const LocalApiServices._({
    required this.localApi,
    required this.appSettings,
    required this.budget,
  });

  factory LocalApiServices.buildAppRuntime() {
    final localApi = LocalApiServiceSharedPreferencesImpl();
    return LocalApiServices._(
      localApi: localApi,
      appSettings: AppSettingsApiLocalService(
        localApiService: localApi,
      ),
      budget: BudgetApiLocalServiceImpl(localApi: localApi),
    );
  }
  factory LocalApiServices.buildMockRuntime() {
    // TODO(arenukvern): description
    throw UnimplementedError('reason');
  }
  final BudgetApiService budget;
  final LocalApiService localApi;
  final AppSettingsApiLocalService appSettings;
}
