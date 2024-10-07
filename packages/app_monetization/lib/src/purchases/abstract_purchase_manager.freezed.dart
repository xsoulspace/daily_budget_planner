// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abstract_purchase_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubscriptionDetails _$SubscriptionDetailsFromJson(Map<String, dynamic> json) {
  return _SubscriptionDetails.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionDetails {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionDetailsCopyWith<SubscriptionDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionDetailsCopyWith<$Res> {
  factory $SubscriptionDetailsCopyWith(
          SubscriptionDetails value, $Res Function(SubscriptionDetails) then) =
      _$SubscriptionDetailsCopyWithImpl<$Res, SubscriptionDetails>;
  @useResult
  $Res call({String id, String name, double price, Duration duration});
}

/// @nodoc
class _$SubscriptionDetailsCopyWithImpl<$Res, $Val extends SubscriptionDetails>
    implements $SubscriptionDetailsCopyWith<$Res> {
  _$SubscriptionDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionDetailsImplCopyWith<$Res>
    implements $SubscriptionDetailsCopyWith<$Res> {
  factory _$$SubscriptionDetailsImplCopyWith(_$SubscriptionDetailsImpl value,
          $Res Function(_$SubscriptionDetailsImpl) then) =
      __$$SubscriptionDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price, Duration duration});
}

/// @nodoc
class __$$SubscriptionDetailsImplCopyWithImpl<$Res>
    extends _$SubscriptionDetailsCopyWithImpl<$Res, _$SubscriptionDetailsImpl>
    implements _$$SubscriptionDetailsImplCopyWith<$Res> {
  __$$SubscriptionDetailsImplCopyWithImpl(_$SubscriptionDetailsImpl _value,
      $Res Function(_$SubscriptionDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? duration = null,
  }) {
    return _then(_$SubscriptionDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionDetailsImpl implements _SubscriptionDetails {
  const _$SubscriptionDetailsImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.duration});

  factory _$SubscriptionDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'SubscriptionDetails(id: $id, name: $name, price: $price, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, duration);

  /// Create a copy of SubscriptionDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionDetailsImplCopyWith<_$SubscriptionDetailsImpl> get copyWith =>
      __$$SubscriptionDetailsImplCopyWithImpl<_$SubscriptionDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionDetailsImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionDetails implements SubscriptionDetails {
  const factory _SubscriptionDetails(
      {required final String id,
      required final String name,
      required final double price,
      required final Duration duration}) = _$SubscriptionDetailsImpl;

  factory _SubscriptionDetails.fromJson(Map<String, dynamic> json) =
      _$SubscriptionDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  Duration get duration;

  /// Create a copy of SubscriptionDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionDetailsImplCopyWith<_$SubscriptionDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OneTimePurchaseDetails _$OneTimePurchaseDetailsFromJson(
    Map<String, dynamic> json) {
  return _OneTimePurchaseDetails.fromJson(json);
}

/// @nodoc
mixin _$OneTimePurchaseDetails {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this OneTimePurchaseDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OneTimePurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OneTimePurchaseDetailsCopyWith<OneTimePurchaseDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneTimePurchaseDetailsCopyWith<$Res> {
  factory $OneTimePurchaseDetailsCopyWith(OneTimePurchaseDetails value,
          $Res Function(OneTimePurchaseDetails) then) =
      _$OneTimePurchaseDetailsCopyWithImpl<$Res, OneTimePurchaseDetails>;
  @useResult
  $Res call({String id, String name, double price});
}

/// @nodoc
class _$OneTimePurchaseDetailsCopyWithImpl<$Res,
        $Val extends OneTimePurchaseDetails>
    implements $OneTimePurchaseDetailsCopyWith<$Res> {
  _$OneTimePurchaseDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OneTimePurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OneTimePurchaseDetailsImplCopyWith<$Res>
    implements $OneTimePurchaseDetailsCopyWith<$Res> {
  factory _$$OneTimePurchaseDetailsImplCopyWith(
          _$OneTimePurchaseDetailsImpl value,
          $Res Function(_$OneTimePurchaseDetailsImpl) then) =
      __$$OneTimePurchaseDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price});
}

/// @nodoc
class __$$OneTimePurchaseDetailsImplCopyWithImpl<$Res>
    extends _$OneTimePurchaseDetailsCopyWithImpl<$Res,
        _$OneTimePurchaseDetailsImpl>
    implements _$$OneTimePurchaseDetailsImplCopyWith<$Res> {
  __$$OneTimePurchaseDetailsImplCopyWithImpl(
      _$OneTimePurchaseDetailsImpl _value,
      $Res Function(_$OneTimePurchaseDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OneTimePurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$OneTimePurchaseDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OneTimePurchaseDetailsImpl implements _OneTimePurchaseDetails {
  const _$OneTimePurchaseDetailsImpl(
      {required this.id, required this.name, required this.price});

  factory _$OneTimePurchaseDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OneTimePurchaseDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;

  @override
  String toString() {
    return 'OneTimePurchaseDetails(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneTimePurchaseDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of OneTimePurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OneTimePurchaseDetailsImplCopyWith<_$OneTimePurchaseDetailsImpl>
      get copyWith => __$$OneTimePurchaseDetailsImplCopyWithImpl<
          _$OneTimePurchaseDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OneTimePurchaseDetailsImplToJson(
      this,
    );
  }
}

abstract class _OneTimePurchaseDetails implements OneTimePurchaseDetails {
  const factory _OneTimePurchaseDetails(
      {required final String id,
      required final String name,
      required final double price}) = _$OneTimePurchaseDetailsImpl;

  factory _OneTimePurchaseDetails.fromJson(Map<String, dynamic> json) =
      _$OneTimePurchaseDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;

  /// Create a copy of OneTimePurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OneTimePurchaseDetailsImplCopyWith<_$OneTimePurchaseDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AvailableSubscription _$AvailableSubscriptionFromJson(
    Map<String, dynamic> json) {
  return _AvailableSubscription.fromJson(json);
}

/// @nodoc
mixin _$AvailableSubscription {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  /// Serializes this AvailableSubscription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableSubscriptionCopyWith<AvailableSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableSubscriptionCopyWith<$Res> {
  factory $AvailableSubscriptionCopyWith(AvailableSubscription value,
          $Res Function(AvailableSubscription) then) =
      _$AvailableSubscriptionCopyWithImpl<$Res, AvailableSubscription>;
  @useResult
  $Res call({String id, String name, double price, Duration duration});
}

/// @nodoc
class _$AvailableSubscriptionCopyWithImpl<$Res,
        $Val extends AvailableSubscription>
    implements $AvailableSubscriptionCopyWith<$Res> {
  _$AvailableSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableSubscriptionImplCopyWith<$Res>
    implements $AvailableSubscriptionCopyWith<$Res> {
  factory _$$AvailableSubscriptionImplCopyWith(
          _$AvailableSubscriptionImpl value,
          $Res Function(_$AvailableSubscriptionImpl) then) =
      __$$AvailableSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price, Duration duration});
}

/// @nodoc
class __$$AvailableSubscriptionImplCopyWithImpl<$Res>
    extends _$AvailableSubscriptionCopyWithImpl<$Res,
        _$AvailableSubscriptionImpl>
    implements _$$AvailableSubscriptionImplCopyWith<$Res> {
  __$$AvailableSubscriptionImplCopyWithImpl(_$AvailableSubscriptionImpl _value,
      $Res Function(_$AvailableSubscriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? duration = null,
  }) {
    return _then(_$AvailableSubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableSubscriptionImpl implements _AvailableSubscription {
  const _$AvailableSubscriptionImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.duration});

  factory _$AvailableSubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableSubscriptionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'AvailableSubscription(id: $id, name: $name, price: $price, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableSubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, duration);

  /// Create a copy of AvailableSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableSubscriptionImplCopyWith<_$AvailableSubscriptionImpl>
      get copyWith => __$$AvailableSubscriptionImplCopyWithImpl<
          _$AvailableSubscriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableSubscriptionImplToJson(
      this,
    );
  }
}

abstract class _AvailableSubscription implements AvailableSubscription {
  const factory _AvailableSubscription(
      {required final String id,
      required final String name,
      required final double price,
      required final Duration duration}) = _$AvailableSubscriptionImpl;

  factory _AvailableSubscription.fromJson(Map<String, dynamic> json) =
      _$AvailableSubscriptionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  Duration get duration;

  /// Create a copy of AvailableSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableSubscriptionImplCopyWith<_$AvailableSubscriptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AvailableOneTimePurchase _$AvailableOneTimePurchaseFromJson(
    Map<String, dynamic> json) {
  return _AvailableOneTimePurchase.fromJson(json);
}

/// @nodoc
mixin _$AvailableOneTimePurchase {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this AvailableOneTimePurchase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableOneTimePurchase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableOneTimePurchaseCopyWith<AvailableOneTimePurchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableOneTimePurchaseCopyWith<$Res> {
  factory $AvailableOneTimePurchaseCopyWith(AvailableOneTimePurchase value,
          $Res Function(AvailableOneTimePurchase) then) =
      _$AvailableOneTimePurchaseCopyWithImpl<$Res, AvailableOneTimePurchase>;
  @useResult
  $Res call({String id, String name, double price});
}

/// @nodoc
class _$AvailableOneTimePurchaseCopyWithImpl<$Res,
        $Val extends AvailableOneTimePurchase>
    implements $AvailableOneTimePurchaseCopyWith<$Res> {
  _$AvailableOneTimePurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableOneTimePurchase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableOneTimePurchaseImplCopyWith<$Res>
    implements $AvailableOneTimePurchaseCopyWith<$Res> {
  factory _$$AvailableOneTimePurchaseImplCopyWith(
          _$AvailableOneTimePurchaseImpl value,
          $Res Function(_$AvailableOneTimePurchaseImpl) then) =
      __$$AvailableOneTimePurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price});
}

/// @nodoc
class __$$AvailableOneTimePurchaseImplCopyWithImpl<$Res>
    extends _$AvailableOneTimePurchaseCopyWithImpl<$Res,
        _$AvailableOneTimePurchaseImpl>
    implements _$$AvailableOneTimePurchaseImplCopyWith<$Res> {
  __$$AvailableOneTimePurchaseImplCopyWithImpl(
      _$AvailableOneTimePurchaseImpl _value,
      $Res Function(_$AvailableOneTimePurchaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableOneTimePurchase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$AvailableOneTimePurchaseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableOneTimePurchaseImpl implements _AvailableOneTimePurchase {
  const _$AvailableOneTimePurchaseImpl(
      {required this.id, required this.name, required this.price});

  factory _$AvailableOneTimePurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableOneTimePurchaseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;

  @override
  String toString() {
    return 'AvailableOneTimePurchase(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableOneTimePurchaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of AvailableOneTimePurchase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableOneTimePurchaseImplCopyWith<_$AvailableOneTimePurchaseImpl>
      get copyWith => __$$AvailableOneTimePurchaseImplCopyWithImpl<
          _$AvailableOneTimePurchaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableOneTimePurchaseImplToJson(
      this,
    );
  }
}

abstract class _AvailableOneTimePurchase implements AvailableOneTimePurchase {
  const factory _AvailableOneTimePurchase(
      {required final String id,
      required final String name,
      required final double price}) = _$AvailableOneTimePurchaseImpl;

  factory _AvailableOneTimePurchase.fromJson(Map<String, dynamic> json) =
      _$AvailableOneTimePurchaseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;

  /// Create a copy of AvailableOneTimePurchase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableOneTimePurchaseImplCopyWith<_$AvailableOneTimePurchaseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PurchaseDetails _$PurchaseDetailsFromJson(Map<String, dynamic> json) {
  return _PurchaseDetails.fromJson(json);
}

/// @nodoc
mixin _$PurchaseDetails {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  String? get subscriptionId => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;

  /// Serializes this PurchaseDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseDetailsCopyWith<PurchaseDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseDetailsCopyWith<$Res> {
  factory $PurchaseDetailsCopyWith(
          PurchaseDetails value, $Res Function(PurchaseDetails) then) =
      _$PurchaseDetailsCopyWithImpl<$Res, PurchaseDetails>;
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      DateTime purchaseDate,
      String? subscriptionId,
      DateTime? expiryDate});
}

/// @nodoc
class _$PurchaseDetailsCopyWithImpl<$Res, $Val extends PurchaseDetails>
    implements $PurchaseDetailsCopyWith<$Res> {
  _$PurchaseDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? purchaseDate = null,
    Object? subscriptionId = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subscriptionId: freezed == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseDetailsImplCopyWith<$Res>
    implements $PurchaseDetailsCopyWith<$Res> {
  factory _$$PurchaseDetailsImplCopyWith(_$PurchaseDetailsImpl value,
          $Res Function(_$PurchaseDetailsImpl) then) =
      __$$PurchaseDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      DateTime purchaseDate,
      String? subscriptionId,
      DateTime? expiryDate});
}

/// @nodoc
class __$$PurchaseDetailsImplCopyWithImpl<$Res>
    extends _$PurchaseDetailsCopyWithImpl<$Res, _$PurchaseDetailsImpl>
    implements _$$PurchaseDetailsImplCopyWith<$Res> {
  __$$PurchaseDetailsImplCopyWithImpl(
      _$PurchaseDetailsImpl _value, $Res Function(_$PurchaseDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? purchaseDate = null,
    Object? subscriptionId = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_$PurchaseDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subscriptionId: freezed == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseDetailsImpl implements _PurchaseDetails {
  const _$PurchaseDetailsImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.purchaseDate,
      this.subscriptionId,
      this.expiryDate});

  factory _$PurchaseDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final DateTime purchaseDate;
  @override
  final String? subscriptionId;
  @override
  final DateTime? expiryDate;

  @override
  String toString() {
    return 'PurchaseDetails(id: $id, name: $name, price: $price, purchaseDate: $purchaseDate, subscriptionId: $subscriptionId, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, price, purchaseDate, subscriptionId, expiryDate);

  /// Create a copy of PurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseDetailsImplCopyWith<_$PurchaseDetailsImpl> get copyWith =>
      __$$PurchaseDetailsImplCopyWithImpl<_$PurchaseDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseDetailsImplToJson(
      this,
    );
  }
}

abstract class _PurchaseDetails implements PurchaseDetails {
  const factory _PurchaseDetails(
      {required final String id,
      required final String name,
      required final double price,
      required final DateTime purchaseDate,
      final String? subscriptionId,
      final DateTime? expiryDate}) = _$PurchaseDetailsImpl;

  factory _PurchaseDetails.fromJson(Map<String, dynamic> json) =
      _$PurchaseDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  DateTime get purchaseDate;
  @override
  String? get subscriptionId;
  @override
  DateTime? get expiryDate;

  /// Create a copy of PurchaseDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseDetailsImplCopyWith<_$PurchaseDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseResult _$PurchaseResultFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return PurchaseSuccess.fromJson(json);
    case 'failure':
      return PurchaseFailure.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PurchaseResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PurchaseResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseDetails details) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseDetails details)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseDetails details)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseSuccess value) success,
    required TResult Function(PurchaseFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PurchaseSuccess value)? success,
    TResult? Function(PurchaseFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseSuccess value)? success,
    TResult Function(PurchaseFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PurchaseResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseResultCopyWith<$Res> {
  factory $PurchaseResultCopyWith(
          PurchaseResult value, $Res Function(PurchaseResult) then) =
      _$PurchaseResultCopyWithImpl<$Res, PurchaseResult>;
}

/// @nodoc
class _$PurchaseResultCopyWithImpl<$Res, $Val extends PurchaseResult>
    implements $PurchaseResultCopyWith<$Res> {
  _$PurchaseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PurchaseSuccessImplCopyWith<$Res> {
  factory _$$PurchaseSuccessImplCopyWith(_$PurchaseSuccessImpl value,
          $Res Function(_$PurchaseSuccessImpl) then) =
      __$$PurchaseSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseDetails details});

  $PurchaseDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$PurchaseSuccessImplCopyWithImpl<$Res>
    extends _$PurchaseResultCopyWithImpl<$Res, _$PurchaseSuccessImpl>
    implements _$$PurchaseSuccessImplCopyWith<$Res> {
  __$$PurchaseSuccessImplCopyWithImpl(
      _$PurchaseSuccessImpl _value, $Res Function(_$PurchaseSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$PurchaseSuccessImpl(
      null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ));
  }

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseDetailsCopyWith<$Res> get details {
    return $PurchaseDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseSuccessImpl implements PurchaseSuccess {
  const _$PurchaseSuccessImpl(this.details, {final String? $type})
      : $type = $type ?? 'success';

  factory _$PurchaseSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseSuccessImplFromJson(json);

  @override
  final PurchaseDetails details;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PurchaseResult.success(details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseSuccessImpl &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, details);

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseSuccessImplCopyWith<_$PurchaseSuccessImpl> get copyWith =>
      __$$PurchaseSuccessImplCopyWithImpl<_$PurchaseSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseDetails details) success,
    required TResult Function(String error) failure,
  }) {
    return success(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseDetails details)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseDetails details)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseSuccess value) success,
    required TResult Function(PurchaseFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PurchaseSuccess value)? success,
    TResult? Function(PurchaseFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseSuccess value)? success,
    TResult Function(PurchaseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseSuccessImplToJson(
      this,
    );
  }
}

abstract class PurchaseSuccess implements PurchaseResult {
  const factory PurchaseSuccess(final PurchaseDetails details) =
      _$PurchaseSuccessImpl;

  factory PurchaseSuccess.fromJson(Map<String, dynamic> json) =
      _$PurchaseSuccessImpl.fromJson;

  PurchaseDetails get details;

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseSuccessImplCopyWith<_$PurchaseSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PurchaseFailureImplCopyWith<$Res> {
  factory _$$PurchaseFailureImplCopyWith(_$PurchaseFailureImpl value,
          $Res Function(_$PurchaseFailureImpl) then) =
      __$$PurchaseFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PurchaseFailureImplCopyWithImpl<$Res>
    extends _$PurchaseResultCopyWithImpl<$Res, _$PurchaseFailureImpl>
    implements _$$PurchaseFailureImplCopyWith<$Res> {
  __$$PurchaseFailureImplCopyWithImpl(
      _$PurchaseFailureImpl _value, $Res Function(_$PurchaseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PurchaseFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseFailureImpl implements PurchaseFailure {
  const _$PurchaseFailureImpl(this.error, {final String? $type})
      : $type = $type ?? 'failure';

  factory _$PurchaseFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseFailureImplFromJson(json);

  @override
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PurchaseResult.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseFailureImplCopyWith<_$PurchaseFailureImpl> get copyWith =>
      __$$PurchaseFailureImplCopyWithImpl<_$PurchaseFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseDetails details) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseDetails details)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseDetails details)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseSuccess value) success,
    required TResult Function(PurchaseFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PurchaseSuccess value)? success,
    TResult? Function(PurchaseFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseSuccess value)? success,
    TResult Function(PurchaseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseFailureImplToJson(
      this,
    );
  }
}

abstract class PurchaseFailure implements PurchaseResult {
  const factory PurchaseFailure(final String error) = _$PurchaseFailureImpl;

  factory PurchaseFailure.fromJson(Map<String, dynamic> json) =
      _$PurchaseFailureImpl.fromJson;

  String get error;

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseFailureImplCopyWith<_$PurchaseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
