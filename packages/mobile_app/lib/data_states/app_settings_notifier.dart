import 'package:flutter/foundation.dart';
import 'package:mobile_app/common_imports.dart';

class AppSettingsNotifier extends ValueNotifier<AppSettingsModel>
    with HasLocalApis, HasNotifiers {
  AppSettingsNotifier() : super(AppSettingsModel.empty);

  static const teaserDismissCooldown = Duration(days: 7);

  Future<void> _updateSettings(final AppSettingsModel settings) async {
    value = settings;
    await appSettingsApi.saveSettings(settings: settings);
  }

  AppSettingsModel get settings => value;

  Future<void> onLoad() async {
    final settings = await appSettingsApi.loadSettings();
    // Seed the runtime flag default from the compile-time environment;
    // a persisted value always wins over the seed.
    await _updateSettings(
      settings.copyWith(isPredictionUiEnabled: Envs.isPredictionUiDefault),
    );
    final persisted = await appSettingsApi.loadSettings();
    await _updateSettings(persisted);
    await updateLocale(value.locale);
  }

  Future<void> updateBrightness(final UiBrightness brightness) async {
    await _updateSettings(value.copyWith(brightness: brightness));
  }

  bool get isPredictionUiEnabled => value.isPredictionUiEnabled;
  Future<void> updatePredictionUiEnabled({required final bool enabled}) =>
      _updateSettings(value.copyWith(isPredictionUiEnabled: enabled));

  bool get showPredictionIntro => value.showPredictionIntro;
  Future<void> markPredictionIntroSeen() =>
      _updateSettings(value.copyWith(showPredictionIntro: false));

  bool get showPredictionTeaser => value.showPredictionTeaser;
  bool get isPredictionTeaserVisible {
    if (!value.showPredictionTeaser) {
      final dismissedAt = value.predictionTeaserDismissedAt;
      if (dismissedAt == null) return false;
      return !DateTime.now().isBefore(dismissedAt.add(teaserDismissCooldown));
    }
    return true;
  }

  Future<void> dismissPredictionTeaser() => _updateSettings(
    value.copyWith(
      showPredictionTeaser: false,
      predictionTeaserDismissedAt: DateTime.now(),
    ),
  );

  ValueListenable<Locale> get locale => localeNotifier;
  UiLanguage get language => locale.value.language;
  Future<void> updateLocale(final Locale? locale) async {
    final result = await const LocaleLogic().updateLocale(
      newLocale: locale,
      oldLocale: value.locale,
      uiLocale: localeNotifier.value,
      onLocaleChanged: S.delegate.load,
    );
    if (result == null) return;
    localeNotifier.value = result.uiLocale;
    notifyListeners();
    if (value.locale == result.updatedLocale) return;
    await _updateSettings(value.copyWith(locale: result.updatedLocale));
  }

  bool get use24HourFormat => value.use24HourFormat;
}
