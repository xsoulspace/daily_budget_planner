// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keeper_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdResult _$AdResultFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'rewarded':
      return AdRewarded.fromJson(json);
    case 'failed':
      return AdFailed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AdResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AdResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() rewarded,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? rewarded,
    TResult? Function()? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? rewarded,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdRewarded value) rewarded,
    required TResult Function(AdFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdRewarded value)? rewarded,
    TResult? Function(AdFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdRewarded value)? rewarded,
    TResult Function(AdFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AdResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdResultCopyWith<$Res> {
  factory $AdResultCopyWith(AdResult value, $Res Function(AdResult) then) =
      _$AdResultCopyWithImpl<$Res, AdResult>;
}

/// @nodoc
class _$AdResultCopyWithImpl<$Res, $Val extends AdResult>
    implements $AdResultCopyWith<$Res> {
  _$AdResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AdRewardedImplCopyWith<$Res> {
  factory _$$AdRewardedImplCopyWith(
          _$AdRewardedImpl value, $Res Function(_$AdRewardedImpl) then) =
      __$$AdRewardedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdRewardedImplCopyWithImpl<$Res>
    extends _$AdResultCopyWithImpl<$Res, _$AdRewardedImpl>
    implements _$$AdRewardedImplCopyWith<$Res> {
  __$$AdRewardedImplCopyWithImpl(
      _$AdRewardedImpl _value, $Res Function(_$AdRewardedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AdRewardedImpl implements AdRewarded {
  const _$AdRewardedImpl({final String? $type}) : $type = $type ?? 'rewarded';

  factory _$AdRewardedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdRewardedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AdResult.rewarded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AdRewardedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() rewarded,
    required TResult Function() failed,
  }) {
    return rewarded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? rewarded,
    TResult? Function()? failed,
  }) {
    return rewarded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? rewarded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (rewarded != null) {
      return rewarded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdRewarded value) rewarded,
    required TResult Function(AdFailed value) failed,
  }) {
    return rewarded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdRewarded value)? rewarded,
    TResult? Function(AdFailed value)? failed,
  }) {
    return rewarded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdRewarded value)? rewarded,
    TResult Function(AdFailed value)? failed,
    required TResult orElse(),
  }) {
    if (rewarded != null) {
      return rewarded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AdRewardedImplToJson(
      this,
    );
  }
}

abstract class AdRewarded implements AdResult {
  const factory AdRewarded() = _$AdRewardedImpl;

  factory AdRewarded.fromJson(Map<String, dynamic> json) =
      _$AdRewardedImpl.fromJson;
}

/// @nodoc
abstract class _$$AdFailedImplCopyWith<$Res> {
  factory _$$AdFailedImplCopyWith(
          _$AdFailedImpl value, $Res Function(_$AdFailedImpl) then) =
      __$$AdFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdFailedImplCopyWithImpl<$Res>
    extends _$AdResultCopyWithImpl<$Res, _$AdFailedImpl>
    implements _$$AdFailedImplCopyWith<$Res> {
  __$$AdFailedImplCopyWithImpl(
      _$AdFailedImpl _value, $Res Function(_$AdFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AdFailedImpl implements AdFailed {
  const _$AdFailedImpl({final String? $type}) : $type = $type ?? 'failed';

  factory _$AdFailedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdFailedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AdResult.failed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AdFailedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() rewarded,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? rewarded,
    TResult? Function()? failed,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? rewarded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdRewarded value) rewarded,
    required TResult Function(AdFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdRewarded value)? rewarded,
    TResult? Function(AdFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdRewarded value)? rewarded,
    TResult Function(AdFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AdFailedImplToJson(
      this,
    );
  }
}

abstract class AdFailed implements AdResult {
  const factory AdFailed() = _$AdFailedImpl;

  factory AdFailed.fromJson(Map<String, dynamic> json) =
      _$AdFailedImpl.fromJson;
}
