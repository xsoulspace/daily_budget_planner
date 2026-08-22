// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/paywalls
  $AssetsImagesPaywallsGen get paywalls => const $AssetsImagesPaywallsGen();

  /// Directory path: packages/mobile_app/assets/images
  String get path => 'packages/mobile_app/assets/images';
}

class $AssetsImagesPaywallsGen {
  const $AssetsImagesPaywallsGen();

  /// File path: assets/images/paywalls/early_features_check.png
  AssetGenImage get earlyFeaturesCheck =>
      const AssetGenImage('assets/images/paywalls/early_features_check.png');

  /// File path: assets/images/paywalls/full_access_hands.png
  AssetGenImage get fullAccessHands =>
      const AssetGenImage('assets/images/paywalls/full_access_hands.png');

  /// File path: assets/images/paywalls/gold_snowflake.png
  AssetGenImage get goldSnowflake =>
      const AssetGenImage('assets/images/paywalls/gold_snowflake.png');

  /// File path: assets/images/paywalls/ideas.png
  AssetGenImage get ideas =>
      const AssetGenImage('assets/images/paywalls/ideas.png');

  /// File path: assets/images/paywalls/open_source_hands.png
  AssetGenImage get openSourceHands =>
      const AssetGenImage('assets/images/paywalls/open_source_hands.png');

  /// Directory path: packages/mobile_app/assets/images/paywalls
  String get path => 'packages/mobile_app/assets/images/paywalls';

  /// List of all assets
  List<AssetGenImage> get values => [
    earlyFeaturesCheck,
    fullAccessHands,
    goldSnowflake,
    ideas,
    openSourceHands,
  ];
}

abstract final class Assets {
  static const String package = 'mobile_app';

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  static const String package = 'mobile_app';

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => 'packages/mobile_app/$_assetName';
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
