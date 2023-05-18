part of 'models.dart';

@immutable
@Freezed(
  fromJson: false,
  toJson: false,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class AdPermissions with _$AdPermissions {
  const factory AdPermissions({
    @Default(false) final bool adsAllowed,
    @Default(false) final bool homeScreenTopBannerEnabled,
  }) = _AdPermissions;

  const AdPermissions._();
  bool get adsNotAllowed => !adsAllowed;
  static const noAds = AdPermissions();
  static const webAds = allAdEnabled;
  static const nativeMobileAds = allAdEnabled;
  static const nativeDesktopAds = noAds;
  static const allAdEnabled = AdPermissions(
    adsAllowed: true,
    homeScreenTopBannerEnabled: true,
  );
}
