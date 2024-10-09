// ignore_for_file: do_not_use_environment
import 'package:app_monetization/app_monetization.dart';

class Envs {
  const Envs._();
  static const appScheme = 'dev.xsoulspace.daily_budget_planner';
  static const logging = bool.fromEnvironment('LOGGING');
  static const rustoreApplicationId = '2045332927';
  static const isTestPayments = bool.fromEnvironment('TEST_PAYMENTS');
  static final storeTarget = StoreTarget.fromString(
    const String.fromEnvironment('STORE'),
  );
}
