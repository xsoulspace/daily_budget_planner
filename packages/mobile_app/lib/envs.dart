// ignore_for_file: do_not_use_environment
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';
import 'package:xsoulspace_monetization/xsoulspace_monetization.dart';

class Envs {
  const Envs._();
  static const appScheme = 'dev.xsoulspace.daily_budget_planner';
  static const logging = bool.fromEnvironment('LOGGING');
  static const rustoreApplicationId = '2045332927';
  static const isTestPayments = bool.fromEnvironment('TEST_PAYMENTS');
  static const monetizationTypeJson = String.fromEnvironment(
    'MONETIZATION',
    defaultValue: 'free',
  );
  static final monetizationType =
      MonetizationType.fromJson(monetizationTypeJson);

  static final storeTarget = InstallPlatformTarget.fromString(
    const String.fromEnvironment('STORE', defaultValue: 'snapstore'),
  );
}
