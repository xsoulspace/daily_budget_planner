// ignore_for_file: invalid_annotation_target

part of 'data_models.dart';

enum UiBrightness {
  system,
  light,
  dark;

  factory UiBrightness.fromJson(final String json) {
    if (json.isEmpty) return UiBrightness.light;
    return UiBrightness.values.byName(json);
  }
  static String toJson(final UiBrightness brightness) => brightness.name;
  ThemeMode get themeMode => switch (this) {
    UiBrightness.system => ThemeMode.system,
    UiBrightness.light => ThemeMode.light,
    UiBrightness.dark => ThemeMode.dark,
  };
}

@immutable
@Freezed()
abstract class AppSettingsModel with _$AppSettingsModel {
  @JsonSerializable(explicitToJson: true)
  const factory AppSettingsModel({
    @JsonKey(fromJson: localeFromString, toJson: localeToString)
    final Locale? locale,
    @Default(UiBrightness.system)
    @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
    final UiBrightness brightness,
    @Default(true) final bool use24HourFormat,
    @Default(false) final bool isPredictionUiEnabled,
    @Default(false) final bool showPredictionIntro,
    @Default(true) final bool showPredictionTeaser,
    final DateTime? predictionTeaserDismissedAt,
  }) = _AppSettingsModel;

  const AppSettingsModel._();

  factory AppSettingsModel.fromJson(final Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);
  static const empty = AppSettingsModel();
}
