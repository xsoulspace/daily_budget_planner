// ignore_for_file: do_not_use_environment
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

class Envs {
  const Envs._();
  static const appScheme = 'dev.xsoulspace.daily_budget_planner';
  static const logging = bool.fromEnvironment('LOGGING');
  static const rustoreApplicationId = '2045332927';
  static const isTestPayments = bool.fromEnvironment('TEST_PAYMENTS');
  static final storeTarget = InstallPlatformTarget.fromString(
    const String.fromEnvironment('STORE'),
  );
}
