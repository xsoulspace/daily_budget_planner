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
  static final storeName = switch (storeTarget) {
    InstallPlatformTarget.googlePlay => 'Google Play',
    InstallPlatformTarget.rustore => 'RuStore',
    InstallPlatformTarget.huawai => 'Huawei AppGallery',
    InstallPlatformTarget.appleStore || _ => 'App Store',
  };
  static final storeTarget = InstallPlatformTarget.fromString(
    const String.fromEnvironment('STORE', defaultValue: 'snapstore'),
  );
  static const privacyPolicyUrl =
      'https://raw.githubusercontent.com/xsoulspace/daily_budget_planner/refs/heads/main/PRIVACY_POLICY.md';
  static const termsUrl =
      'https://raw.githubusercontent.com/xsoulspace/daily_budget_planner/refs/heads/main/TERMS_AND_CONDITIONS.md';
  static const wiredashProjectId =
      String.fromEnvironment('WIREDASH_PROJECT_ID');
  static const wiredashSecret = String.fromEnvironment('WIREDASH_API_KEY');
  static final isWiredashAvailable =
      wiredashSecret.isNotEmpty && wiredashProjectId.isNotEmpty;
}
