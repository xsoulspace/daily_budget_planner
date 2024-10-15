import 'package:mobile_app/common_imports.dart';

enum AppStatus {
  offline,
  online,
  loading;
}

@stateDistributor
class AppStatusNotifier extends ValueNotifier<AppStatus> {
  AppStatusNotifier() : super(AppStatus.loading);
}
