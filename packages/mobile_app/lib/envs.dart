// ignore_for_file: do_not_use_environment
import 'package:mobile_app/common_imports.dart';
import 'package:xsoulspace_installation_store/xsoulspace_installation_store.dart';

class Envs {
  const Envs._();
  static const kDefaultCurrencyType = CurrencyType.fiat;
  static const appScheme = 'dev.xsoulspace.daily_budget_planner';
  static const logging = bool.fromEnvironment('LOGGING');
  static const rustoreApplicationId = '2045332927';
  static const isTestPayments = bool.fromEnvironment('TEST_PAYMENTS');
  static const monetizationTypeJson = String.fromEnvironment(
    'MONETIZATION',
    defaultValue: 'free',
  );
  // TODO(arenukvern): handle taxes
  static const isAmountsTaxFree = false;
  static const isCryptoEnabled = bool.fromEnvironment('CRYPTO_ENABLED');
  static const isCurrencySwitchingEnabled = bool.fromEnvironment(
    'CURRENCY_SWITCHING_ENABLED',
  );

  /// Compile-time default for the prediction UI rollout flag (ADR-0003).
  /// A persisted user setting overrides this seed.
  static const isPredictionUiDefault = bool.fromEnvironment(
    'PREDICTION_UI_ENABLED',
  );
  static final monetizationType = MonetizationType.fromJson(
    monetizationTypeJson,
  );
  static final storeName = switch (storeTarget) {
    InstallationTargetStore.mobileGooglePlay => 'Google Play',
    InstallationTargetStore.rustore => 'RuStore',
    InstallationTargetStore.huawei => 'Huawei AppGallery',
    InstallationTargetStore.mobileAppleAppStore || _ => 'App Store',
  };
  static final storeTarget = InstallationTargetStore.values.firstWhere(
    (final e) =>
        e.name ==
        const String.fromEnvironment('STORE', defaultValue: 'rustore'),
    orElse: () => InstallationTargetStore.rustore,
  );
  static const privacyPolicyUrl =
      'https://raw.githubusercontent.com/xsoulspace/daily_budget_planner/refs/heads/main/PRIVACY_POLICY.md';
  static const termsUrl =
      'https://raw.githubusercontent.com/xsoulspace/daily_budget_planner/refs/heads/main/TERMS_AND_CONDITIONS.md';
  static const wiredashProjectId = String.fromEnvironment(
    'WIREDASH_PROJECT_ID',
  );
  static const wiredashSecret = String.fromEnvironment('WIREDASH_API_KEY');
  static final isWiredashAvailable =
      wiredashSecret.isNotEmpty && wiredashProjectId.isNotEmpty;
}
