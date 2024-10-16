// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyticsEvent _$AnalyticsEventFromJson(Map<String, dynamic> json) {
  return _AnalyticsEvent.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsEvent {
  String get name => throw _privateConstructorUsedError;
  Map<String, dynamic>? get parameters => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsEventCopyWith<AnalyticsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsEventCopyWith<$Res> {
  factory $AnalyticsEventCopyWith(
          AnalyticsEvent value, $Res Function(AnalyticsEvent) then) =
      _$AnalyticsEventCopyWithImpl<$Res, AnalyticsEvent>;
  @useResult
  $Res call({String name, Map<String, dynamic>? parameters});
}

/// @nodoc
class _$AnalyticsEventCopyWithImpl<$Res, $Val extends AnalyticsEvent>
    implements $AnalyticsEventCopyWith<$Res> {
  _$AnalyticsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? parameters = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsEventImplCopyWith<$Res>
    implements $AnalyticsEventCopyWith<$Res> {
  factory _$$AnalyticsEventImplCopyWith(_$AnalyticsEventImpl value,
          $Res Function(_$AnalyticsEventImpl) then) =
      __$$AnalyticsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Map<String, dynamic>? parameters});
}

/// @nodoc
class __$$AnalyticsEventImplCopyWithImpl<$Res>
    extends _$AnalyticsEventCopyWithImpl<$Res, _$AnalyticsEventImpl>
    implements _$$AnalyticsEventImplCopyWith<$Res> {
  __$$AnalyticsEventImplCopyWithImpl(
      _$AnalyticsEventImpl _value, $Res Function(_$AnalyticsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? parameters = freezed,
  }) {
    return _then(_$AnalyticsEventImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parameters: freezed == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsEventImpl implements _AnalyticsEvent {
  const _$AnalyticsEventImpl(
      {required this.name, final Map<String, dynamic>? parameters})
      : _parameters = parameters;

  factory _$AnalyticsEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsEventImplFromJson(json);

  @override
  final String name;
  final Map<String, dynamic>? _parameters;
  @override
  Map<String, dynamic>? get parameters {
    final value = _parameters;
    if (value == null) return null;
    if (_parameters is EqualUnmodifiableMapView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AnalyticsEvent(name: $name, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsEventImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_parameters));

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsEventImplCopyWith<_$AnalyticsEventImpl> get copyWith =>
      __$$AnalyticsEventImplCopyWithImpl<_$AnalyticsEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsEventImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsEvent implements AnalyticsEvent {
  const factory _AnalyticsEvent(
      {required final String name,
      final Map<String, dynamic>? parameters}) = _$AnalyticsEventImpl;

  factory _AnalyticsEvent.fromJson(Map<String, dynamic> json) =
      _$AnalyticsEventImpl.fromJson;

  @override
  String get name;
  @override
  Map<String, dynamic>? get parameters;

  /// Create a copy of AnalyticsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsEventImplCopyWith<_$AnalyticsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
