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
  ProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
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
  $Res call(
      {ProductId productId,
      String name,
      double price,
      String currency,
      Duration duration});
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
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {ProductId productId,
      String name,
      double price,
      String currency,
      Duration duration});
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
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
    Object? duration = null,
  }) {
    return _then(_$SubscriptionDetailsImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.productId,
      required this.name,
      required this.price,
      required this.currency,
      required this.duration});

  factory _$SubscriptionDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionDetailsImplFromJson(json);

  @override
  final ProductId productId;
  @override
  final String name;
  @override
  final double price;
  @override
  final String currency;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'SubscriptionDetails(productId: $productId, name: $name, price: $price, currency: $currency, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDetailsImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, name, price, currency, duration);

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
      {required final ProductId productId,
      required final String name,
      required final double price,
      required final String currency,
      required final Duration duration}) = _$SubscriptionDetailsImpl;

  factory _SubscriptionDetails.fromJson(Map<String, dynamic> json) =
      _$SubscriptionDetailsImpl.fromJson;

  @override
  ProductId get productId;
  @override
  String get name;
  @override
  double get price;
  @override
  String get currency;
  @override
  Duration get duration;

  /// Create a copy of SubscriptionDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionDetailsImplCopyWith<_$SubscriptionDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConsumableDetails _$ConsumableDetailsFromJson(Map<String, dynamic> json) {
  return _ConsumableDetails.fromJson(json);
}

/// @nodoc
mixin _$ConsumableDetails {
  ProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this ConsumableDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsumableDetailsCopyWith<ConsumableDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumableDetailsCopyWith<$Res> {
  factory $ConsumableDetailsCopyWith(
          ConsumableDetails value, $Res Function(ConsumableDetails) then) =
      _$ConsumableDetailsCopyWithImpl<$Res, ConsumableDetails>;
  @useResult
  $Res call({ProductId productId, String name, double price, String currency});
}

/// @nodoc
class _$ConsumableDetailsCopyWithImpl<$Res, $Val extends ConsumableDetails>
    implements $ConsumableDetailsCopyWith<$Res> {
  _$ConsumableDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumableDetailsImplCopyWith<$Res>
    implements $ConsumableDetailsCopyWith<$Res> {
  factory _$$ConsumableDetailsImplCopyWith(_$ConsumableDetailsImpl value,
          $Res Function(_$ConsumableDetailsImpl) then) =
      __$$ConsumableDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductId productId, String name, double price, String currency});
}

/// @nodoc
class __$$ConsumableDetailsImplCopyWithImpl<$Res>
    extends _$ConsumableDetailsCopyWithImpl<$Res, _$ConsumableDetailsImpl>
    implements _$$ConsumableDetailsImplCopyWith<$Res> {
  __$$ConsumableDetailsImplCopyWithImpl(_$ConsumableDetailsImpl _value,
      $Res Function(_$ConsumableDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$ConsumableDetailsImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumableDetailsImpl implements _ConsumableDetails {
  const _$ConsumableDetailsImpl(
      {required this.productId,
      required this.name,
      required this.price,
      required this.currency});

  factory _$ConsumableDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumableDetailsImplFromJson(json);

  @override
  final ProductId productId;
  @override
  final String name;
  @override
  final double price;
  @override
  final String currency;

  @override
  String toString() {
    return 'ConsumableDetails(productId: $productId, name: $name, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumableDetailsImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, name, price, currency);

  /// Create a copy of ConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumableDetailsImplCopyWith<_$ConsumableDetailsImpl> get copyWith =>
      __$$ConsumableDetailsImplCopyWithImpl<_$ConsumableDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumableDetailsImplToJson(
      this,
    );
  }
}

abstract class _ConsumableDetails implements ConsumableDetails {
  const factory _ConsumableDetails(
      {required final ProductId productId,
      required final String name,
      required final double price,
      required final String currency}) = _$ConsumableDetailsImpl;

  factory _ConsumableDetails.fromJson(Map<String, dynamic> json) =
      _$ConsumableDetailsImpl.fromJson;

  @override
  ProductId get productId;
  @override
  String get name;
  @override
  double get price;
  @override
  String get currency;

  /// Create a copy of ConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsumableDetailsImplCopyWith<_$ConsumableDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NonConsumableDetails _$NonConsumableDetailsFromJson(Map<String, dynamic> json) {
  return _NonConsumableDetails.fromJson(json);
}

/// @nodoc
mixin _$NonConsumableDetails {
  ProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this NonConsumableDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NonConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NonConsumableDetailsCopyWith<NonConsumableDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonConsumableDetailsCopyWith<$Res> {
  factory $NonConsumableDetailsCopyWith(NonConsumableDetails value,
          $Res Function(NonConsumableDetails) then) =
      _$NonConsumableDetailsCopyWithImpl<$Res, NonConsumableDetails>;
  @useResult
  $Res call({ProductId productId, String name, double price, String currency});
}

/// @nodoc
class _$NonConsumableDetailsCopyWithImpl<$Res,
        $Val extends NonConsumableDetails>
    implements $NonConsumableDetailsCopyWith<$Res> {
  _$NonConsumableDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NonConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NonConsumableDetailsImplCopyWith<$Res>
    implements $NonConsumableDetailsCopyWith<$Res> {
  factory _$$NonConsumableDetailsImplCopyWith(_$NonConsumableDetailsImpl value,
          $Res Function(_$NonConsumableDetailsImpl) then) =
      __$$NonConsumableDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductId productId, String name, double price, String currency});
}

/// @nodoc
class __$$NonConsumableDetailsImplCopyWithImpl<$Res>
    extends _$NonConsumableDetailsCopyWithImpl<$Res, _$NonConsumableDetailsImpl>
    implements _$$NonConsumableDetailsImplCopyWith<$Res> {
  __$$NonConsumableDetailsImplCopyWithImpl(_$NonConsumableDetailsImpl _value,
      $Res Function(_$NonConsumableDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NonConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$NonConsumableDetailsImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NonConsumableDetailsImpl implements _NonConsumableDetails {
  const _$NonConsumableDetailsImpl(
      {required this.productId,
      required this.name,
      required this.price,
      required this.currency});

  factory _$NonConsumableDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NonConsumableDetailsImplFromJson(json);

  @override
  final ProductId productId;
  @override
  final String name;
  @override
  final double price;
  @override
  final String currency;

  @override
  String toString() {
    return 'NonConsumableDetails(productId: $productId, name: $name, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonConsumableDetailsImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, name, price, currency);

  /// Create a copy of NonConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NonConsumableDetailsImplCopyWith<_$NonConsumableDetailsImpl>
      get copyWith =>
          __$$NonConsumableDetailsImplCopyWithImpl<_$NonConsumableDetailsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NonConsumableDetailsImplToJson(
      this,
    );
  }
}

abstract class _NonConsumableDetails implements NonConsumableDetails {
  const factory _NonConsumableDetails(
      {required final ProductId productId,
      required final String name,
      required final double price,
      required final String currency}) = _$NonConsumableDetailsImpl;

  factory _NonConsumableDetails.fromJson(Map<String, dynamic> json) =
      _$NonConsumableDetailsImpl.fromJson;

  @override
  ProductId get productId;
  @override
  String get name;
  @override
  double get price;
  @override
  String get currency;

  /// Create a copy of NonConsumableDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NonConsumableDetailsImplCopyWith<_$NonConsumableDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AvailableSubscription _$AvailableSubscriptionFromJson(
    Map<String, dynamic> json) {
  return _AvailableSubscription.fromJson(json);
}

/// @nodoc
mixin _$AvailableSubscription {
  ProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
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
  $Res call(
      {ProductId productId,
      String name,
      double price,
      String currency,
      Duration duration});
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
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {ProductId productId,
      String name,
      double price,
      String currency,
      Duration duration});
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
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
    Object? duration = null,
  }) {
    return _then(_$AvailableSubscriptionImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.productId,
      required this.name,
      required this.price,
      required this.currency,
      required this.duration});

  factory _$AvailableSubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableSubscriptionImplFromJson(json);

  @override
  final ProductId productId;
  @override
  final String name;
  @override
  final double price;
  @override
  final String currency;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'AvailableSubscription(productId: $productId, name: $name, price: $price, currency: $currency, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableSubscriptionImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, name, price, currency, duration);

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
      {required final ProductId productId,
      required final String name,
      required final double price,
      required final String currency,
      required final Duration duration}) = _$AvailableSubscriptionImpl;

  factory _AvailableSubscription.fromJson(Map<String, dynamic> json) =
      _$AvailableSubscriptionImpl.fromJson;

  @override
  ProductId get productId;
  @override
  String get name;
  @override
  double get price;
  @override
  String get currency;
  @override
  Duration get duration;

  /// Create a copy of AvailableSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableSubscriptionImplCopyWith<_$AvailableSubscriptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AvailableConsumable _$AvailableConsumableFromJson(Map<String, dynamic> json) {
  return _AvailableConsumable.fromJson(json);
}

/// @nodoc
mixin _$AvailableConsumable {
  ProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this AvailableConsumable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableConsumable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableConsumableCopyWith<AvailableConsumable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableConsumableCopyWith<$Res> {
  factory $AvailableConsumableCopyWith(
          AvailableConsumable value, $Res Function(AvailableConsumable) then) =
      _$AvailableConsumableCopyWithImpl<$Res, AvailableConsumable>;
  @useResult
  $Res call({ProductId productId, String name, double price, String currency});
}

/// @nodoc
class _$AvailableConsumableCopyWithImpl<$Res, $Val extends AvailableConsumable>
    implements $AvailableConsumableCopyWith<$Res> {
  _$AvailableConsumableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableConsumable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableConsumableImplCopyWith<$Res>
    implements $AvailableConsumableCopyWith<$Res> {
  factory _$$AvailableConsumableImplCopyWith(_$AvailableConsumableImpl value,
          $Res Function(_$AvailableConsumableImpl) then) =
      __$$AvailableConsumableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductId productId, String name, double price, String currency});
}

/// @nodoc
class __$$AvailableConsumableImplCopyWithImpl<$Res>
    extends _$AvailableConsumableCopyWithImpl<$Res, _$AvailableConsumableImpl>
    implements _$$AvailableConsumableImplCopyWith<$Res> {
  __$$AvailableConsumableImplCopyWithImpl(_$AvailableConsumableImpl _value,
      $Res Function(_$AvailableConsumableImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableConsumable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$AvailableConsumableImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableConsumableImpl implements _AvailableConsumable {
  const _$AvailableConsumableImpl(
      {required this.productId,
      required this.name,
      required this.price,
      required this.currency});

  factory _$AvailableConsumableImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableConsumableImplFromJson(json);

  @override
  final ProductId productId;
  @override
  final String name;
  @override
  final double price;
  @override
  final String currency;

  @override
  String toString() {
    return 'AvailableConsumable(productId: $productId, name: $name, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableConsumableImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, name, price, currency);

  /// Create a copy of AvailableConsumable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableConsumableImplCopyWith<_$AvailableConsumableImpl> get copyWith =>
      __$$AvailableConsumableImplCopyWithImpl<_$AvailableConsumableImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableConsumableImplToJson(
      this,
    );
  }
}

abstract class _AvailableConsumable implements AvailableConsumable {
  const factory _AvailableConsumable(
      {required final ProductId productId,
      required final String name,
      required final double price,
      required final String currency}) = _$AvailableConsumableImpl;

  factory _AvailableConsumable.fromJson(Map<String, dynamic> json) =
      _$AvailableConsumableImpl.fromJson;

  @override
  ProductId get productId;
  @override
  String get name;
  @override
  double get price;
  @override
  String get currency;

  /// Create a copy of AvailableConsumable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableConsumableImplCopyWith<_$AvailableConsumableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailableNonConsumable _$AvailableNonConsumableFromJson(
    Map<String, dynamic> json) {
  return _AvailableNonConsumable.fromJson(json);
}

/// @nodoc
mixin _$AvailableNonConsumable {
  ProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this AvailableNonConsumable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableNonConsumable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableNonConsumableCopyWith<AvailableNonConsumable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableNonConsumableCopyWith<$Res> {
  factory $AvailableNonConsumableCopyWith(AvailableNonConsumable value,
          $Res Function(AvailableNonConsumable) then) =
      _$AvailableNonConsumableCopyWithImpl<$Res, AvailableNonConsumable>;
  @useResult
  $Res call({ProductId productId, String name, double price, String currency});
}

/// @nodoc
class _$AvailableNonConsumableCopyWithImpl<$Res,
        $Val extends AvailableNonConsumable>
    implements $AvailableNonConsumableCopyWith<$Res> {
  _$AvailableNonConsumableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableNonConsumable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableNonConsumableImplCopyWith<$Res>
    implements $AvailableNonConsumableCopyWith<$Res> {
  factory _$$AvailableNonConsumableImplCopyWith(
          _$AvailableNonConsumableImpl value,
          $Res Function(_$AvailableNonConsumableImpl) then) =
      __$$AvailableNonConsumableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductId productId, String name, double price, String currency});
}

/// @nodoc
class __$$AvailableNonConsumableImplCopyWithImpl<$Res>
    extends _$AvailableNonConsumableCopyWithImpl<$Res,
        _$AvailableNonConsumableImpl>
    implements _$$AvailableNonConsumableImplCopyWith<$Res> {
  __$$AvailableNonConsumableImplCopyWithImpl(
      _$AvailableNonConsumableImpl _value,
      $Res Function(_$AvailableNonConsumableImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailableNonConsumable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$AvailableNonConsumableImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableNonConsumableImpl implements _AvailableNonConsumable {
  const _$AvailableNonConsumableImpl(
      {required this.productId,
      required this.name,
      required this.price,
      required this.currency});

  factory _$AvailableNonConsumableImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableNonConsumableImplFromJson(json);

  @override
  final ProductId productId;
  @override
  final String name;
  @override
  final double price;
  @override
  final String currency;

  @override
  String toString() {
    return 'AvailableNonConsumable(productId: $productId, name: $name, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableNonConsumableImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, name, price, currency);

  /// Create a copy of AvailableNonConsumable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableNonConsumableImplCopyWith<_$AvailableNonConsumableImpl>
      get copyWith => __$$AvailableNonConsumableImplCopyWithImpl<
          _$AvailableNonConsumableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableNonConsumableImplToJson(
      this,
    );
  }
}

abstract class _AvailableNonConsumable implements AvailableNonConsumable {
  const factory _AvailableNonConsumable(
      {required final ProductId productId,
      required final String name,
      required final double price,
      required final String currency}) = _$AvailableNonConsumableImpl;

  factory _AvailableNonConsumable.fromJson(Map<String, dynamic> json) =
      _$AvailableNonConsumableImpl.fromJson;

  @override
  ProductId get productId;
  @override
  String get name;
  @override
  double get price;
  @override
  String get currency;

  /// Create a copy of AvailableNonConsumable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableNonConsumableImplCopyWith<_$AvailableNonConsumableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PurchaseDetails _$PurchaseDetailsFromJson(Map<String, dynamic> json) {
  return _PurchaseDetails.fromJson(json);
}

/// @nodoc
mixin _$PurchaseDetails {
  PurchaseId get purchaseId => throw _privateConstructorUsedError;
  ProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  PurchaseType get purchaseType => throw _privateConstructorUsedError;
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
      {PurchaseId purchaseId,
      ProductId productId,
      String name,
      double price,
      String currency,
      DateTime purchaseDate,
      PurchaseType purchaseType,
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
    Object? purchaseId = null,
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
    Object? purchaseDate = null,
    Object? purchaseType = null,
    Object? expiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as PurchaseId,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseType: null == purchaseType
          ? _value.purchaseType
          : purchaseType // ignore: cast_nullable_to_non_nullable
              as PurchaseType,
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
      {PurchaseId purchaseId,
      ProductId productId,
      String name,
      double price,
      String currency,
      DateTime purchaseDate,
      PurchaseType purchaseType,
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
    Object? purchaseId = null,
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? currency = null,
    Object? purchaseDate = null,
    Object? purchaseType = null,
    Object? expiryDate = freezed,
  }) {
    return _then(_$PurchaseDetailsImpl(
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as PurchaseId,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseType: null == purchaseType
          ? _value.purchaseType
          : purchaseType // ignore: cast_nullable_to_non_nullable
              as PurchaseType,
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
      {required this.purchaseId,
      required this.productId,
      required this.name,
      required this.price,
      required this.currency,
      required this.purchaseDate,
      required this.purchaseType,
      this.expiryDate});

  factory _$PurchaseDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseDetailsImplFromJson(json);

  @override
  final PurchaseId purchaseId;
  @override
  final ProductId productId;
  @override
  final String name;
  @override
  final double price;
  @override
  final String currency;
  @override
  final DateTime purchaseDate;
  @override
  final PurchaseType purchaseType;
  @override
  final DateTime? expiryDate;

  @override
  String toString() {
    return 'PurchaseDetails(purchaseId: $purchaseId, productId: $productId, name: $name, price: $price, currency: $currency, purchaseDate: $purchaseDate, purchaseType: $purchaseType, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseDetailsImpl &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.purchaseType, purchaseType) ||
                other.purchaseType == purchaseType) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, purchaseId, productId, name,
      price, currency, purchaseDate, purchaseType, expiryDate);

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
      {required final PurchaseId purchaseId,
      required final ProductId productId,
      required final String name,
      required final double price,
      required final String currency,
      required final DateTime purchaseDate,
      required final PurchaseType purchaseType,
      final DateTime? expiryDate}) = _$PurchaseDetailsImpl;

  factory _PurchaseDetails.fromJson(Map<String, dynamic> json) =
      _$PurchaseDetailsImpl.fromJson;

  @override
  PurchaseId get purchaseId;
  @override
  ProductId get productId;
  @override
  String get name;
  @override
  double get price;
  @override
  String get currency;
  @override
  DateTime get purchaseDate;
  @override
  PurchaseType get purchaseType;
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

PurchaseUpdate _$PurchaseUpdateFromJson(Map<String, dynamic> json) {
  return _PurchaseUpdate.fromJson(json);
}

/// @nodoc
mixin _$PurchaseUpdate {
  PurchaseId get purchaseId => throw _privateConstructorUsedError;
  PurchaseStatus get status => throw _privateConstructorUsedError;

  /// Serializes this PurchaseUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseUpdateCopyWith<PurchaseUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseUpdateCopyWith<$Res> {
  factory $PurchaseUpdateCopyWith(
          PurchaseUpdate value, $Res Function(PurchaseUpdate) then) =
      _$PurchaseUpdateCopyWithImpl<$Res, PurchaseUpdate>;
  @useResult
  $Res call({PurchaseId purchaseId, PurchaseStatus status});
}

/// @nodoc
class _$PurchaseUpdateCopyWithImpl<$Res, $Val extends PurchaseUpdate>
    implements $PurchaseUpdateCopyWith<$Res> {
  _$PurchaseUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as PurchaseId,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseUpdateImplCopyWith<$Res>
    implements $PurchaseUpdateCopyWith<$Res> {
  factory _$$PurchaseUpdateImplCopyWith(_$PurchaseUpdateImpl value,
          $Res Function(_$PurchaseUpdateImpl) then) =
      __$$PurchaseUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PurchaseId purchaseId, PurchaseStatus status});
}

/// @nodoc
class __$$PurchaseUpdateImplCopyWithImpl<$Res>
    extends _$PurchaseUpdateCopyWithImpl<$Res, _$PurchaseUpdateImpl>
    implements _$$PurchaseUpdateImplCopyWith<$Res> {
  __$$PurchaseUpdateImplCopyWithImpl(
      _$PurchaseUpdateImpl _value, $Res Function(_$PurchaseUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseId = null,
    Object? status = null,
  }) {
    return _then(_$PurchaseUpdateImpl(
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as PurchaseId,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseUpdateImpl implements _PurchaseUpdate {
  const _$PurchaseUpdateImpl({required this.purchaseId, required this.status});

  factory _$PurchaseUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseUpdateImplFromJson(json);

  @override
  final PurchaseId purchaseId;
  @override
  final PurchaseStatus status;

  @override
  String toString() {
    return 'PurchaseUpdate(purchaseId: $purchaseId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseUpdateImpl &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, purchaseId, status);

  /// Create a copy of PurchaseUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseUpdateImplCopyWith<_$PurchaseUpdateImpl> get copyWith =>
      __$$PurchaseUpdateImplCopyWithImpl<_$PurchaseUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseUpdateImplToJson(
      this,
    );
  }
}

abstract class _PurchaseUpdate implements PurchaseUpdate {
  const factory _PurchaseUpdate(
      {required final PurchaseId purchaseId,
      required final PurchaseStatus status}) = _$PurchaseUpdateImpl;

  factory _PurchaseUpdate.fromJson(Map<String, dynamic> json) =
      _$PurchaseUpdateImpl.fromJson;

  @override
  PurchaseId get purchaseId;
  @override
  PurchaseStatus get status;

  /// Create a copy of PurchaseUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseUpdateImplCopyWith<_$PurchaseUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestoreResult _$RestoreResultFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return RestoreSuccess.fromJson(json);
    case 'failure':
      return RestoreFailure.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RestoreResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RestoreResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PurchaseDetails> restoredPurchases) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PurchaseDetails> restoredPurchases)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PurchaseDetails> restoredPurchases)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RestoreSuccess value) success,
    required TResult Function(RestoreFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestoreSuccess value)? success,
    TResult? Function(RestoreFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestoreSuccess value)? success,
    TResult Function(RestoreFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this RestoreResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestoreResultCopyWith<$Res> {
  factory $RestoreResultCopyWith(
          RestoreResult value, $Res Function(RestoreResult) then) =
      _$RestoreResultCopyWithImpl<$Res, RestoreResult>;
}

/// @nodoc
class _$RestoreResultCopyWithImpl<$Res, $Val extends RestoreResult>
    implements $RestoreResultCopyWith<$Res> {
  _$RestoreResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestoreResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RestoreSuccessImplCopyWith<$Res> {
  factory _$$RestoreSuccessImplCopyWith(_$RestoreSuccessImpl value,
          $Res Function(_$RestoreSuccessImpl) then) =
      __$$RestoreSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PurchaseDetails> restoredPurchases});
}

/// @nodoc
class __$$RestoreSuccessImplCopyWithImpl<$Res>
    extends _$RestoreResultCopyWithImpl<$Res, _$RestoreSuccessImpl>
    implements _$$RestoreSuccessImplCopyWith<$Res> {
  __$$RestoreSuccessImplCopyWithImpl(
      _$RestoreSuccessImpl _value, $Res Function(_$RestoreSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestoreResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restoredPurchases = null,
  }) {
    return _then(_$RestoreSuccessImpl(
      null == restoredPurchases
          ? _value._restoredPurchases
          : restoredPurchases // ignore: cast_nullable_to_non_nullable
              as List<PurchaseDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestoreSuccessImpl implements RestoreSuccess {
  const _$RestoreSuccessImpl(final List<PurchaseDetails> restoredPurchases,
      {final String? $type})
      : _restoredPurchases = restoredPurchases,
        $type = $type ?? 'success';

  factory _$RestoreSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestoreSuccessImplFromJson(json);

  final List<PurchaseDetails> _restoredPurchases;
  @override
  List<PurchaseDetails> get restoredPurchases {
    if (_restoredPurchases is EqualUnmodifiableListView)
      return _restoredPurchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restoredPurchases);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RestoreResult.success(restoredPurchases: $restoredPurchases)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestoreSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._restoredPurchases, _restoredPurchases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_restoredPurchases));

  /// Create a copy of RestoreResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestoreSuccessImplCopyWith<_$RestoreSuccessImpl> get copyWith =>
      __$$RestoreSuccessImplCopyWithImpl<_$RestoreSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PurchaseDetails> restoredPurchases) success,
    required TResult Function(String error) failure,
  }) {
    return success(restoredPurchases);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PurchaseDetails> restoredPurchases)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(restoredPurchases);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PurchaseDetails> restoredPurchases)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(restoredPurchases);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RestoreSuccess value) success,
    required TResult Function(RestoreFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestoreSuccess value)? success,
    TResult? Function(RestoreFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestoreSuccess value)? success,
    TResult Function(RestoreFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RestoreSuccessImplToJson(
      this,
    );
  }
}

abstract class RestoreSuccess implements RestoreResult {
  const factory RestoreSuccess(final List<PurchaseDetails> restoredPurchases) =
      _$RestoreSuccessImpl;

  factory RestoreSuccess.fromJson(Map<String, dynamic> json) =
      _$RestoreSuccessImpl.fromJson;

  List<PurchaseDetails> get restoredPurchases;

  /// Create a copy of RestoreResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestoreSuccessImplCopyWith<_$RestoreSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestoreFailureImplCopyWith<$Res> {
  factory _$$RestoreFailureImplCopyWith(_$RestoreFailureImpl value,
          $Res Function(_$RestoreFailureImpl) then) =
      __$$RestoreFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RestoreFailureImplCopyWithImpl<$Res>
    extends _$RestoreResultCopyWithImpl<$Res, _$RestoreFailureImpl>
    implements _$$RestoreFailureImplCopyWith<$Res> {
  __$$RestoreFailureImplCopyWithImpl(
      _$RestoreFailureImpl _value, $Res Function(_$RestoreFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestoreResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RestoreFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestoreFailureImpl implements RestoreFailure {
  const _$RestoreFailureImpl(this.error, {final String? $type})
      : $type = $type ?? 'failure';

  factory _$RestoreFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestoreFailureImplFromJson(json);

  @override
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RestoreResult.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestoreFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RestoreResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestoreFailureImplCopyWith<_$RestoreFailureImpl> get copyWith =>
      __$$RestoreFailureImplCopyWithImpl<_$RestoreFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PurchaseDetails> restoredPurchases) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PurchaseDetails> restoredPurchases)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PurchaseDetails> restoredPurchases)? success,
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
    required TResult Function(RestoreSuccess value) success,
    required TResult Function(RestoreFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestoreSuccess value)? success,
    TResult? Function(RestoreFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestoreSuccess value)? success,
    TResult Function(RestoreFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RestoreFailureImplToJson(
      this,
    );
  }
}

abstract class RestoreFailure implements RestoreResult {
  const factory RestoreFailure(final String error) = _$RestoreFailureImpl;

  factory RestoreFailure.fromJson(Map<String, dynamic> json) =
      _$RestoreFailureImpl.fromJson;

  String get error;

  /// Create a copy of RestoreResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestoreFailureImplCopyWith<_$RestoreFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelResult _$CancelResultFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return CancelSuccess.fromJson(json);
    case 'failure':
      return CancelFailure.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'CancelResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$CancelResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelSuccess value) success,
    required TResult Function(CancelFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CancelSuccess value)? success,
    TResult? Function(CancelFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelSuccess value)? success,
    TResult Function(CancelFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this CancelResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelResultCopyWith<$Res> {
  factory $CancelResultCopyWith(
          CancelResult value, $Res Function(CancelResult) then) =
      _$CancelResultCopyWithImpl<$Res, CancelResult>;
}

/// @nodoc
class _$CancelResultCopyWithImpl<$Res, $Val extends CancelResult>
    implements $CancelResultCopyWith<$Res> {
  _$CancelResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CancelSuccessImplCopyWith<$Res> {
  factory _$$CancelSuccessImplCopyWith(
          _$CancelSuccessImpl value, $Res Function(_$CancelSuccessImpl) then) =
      __$$CancelSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelSuccessImplCopyWithImpl<$Res>
    extends _$CancelResultCopyWithImpl<$Res, _$CancelSuccessImpl>
    implements _$$CancelSuccessImplCopyWith<$Res> {
  __$$CancelSuccessImplCopyWithImpl(
      _$CancelSuccessImpl _value, $Res Function(_$CancelSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CancelSuccessImpl implements CancelSuccess {
  const _$CancelSuccessImpl({final String? $type}) : $type = $type ?? 'success';

  factory _$CancelSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelSuccessImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CancelResult.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelSuccessImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelSuccess value) success,
    required TResult Function(CancelFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CancelSuccess value)? success,
    TResult? Function(CancelFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelSuccess value)? success,
    TResult Function(CancelFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelSuccessImplToJson(
      this,
    );
  }
}

abstract class CancelSuccess implements CancelResult {
  const factory CancelSuccess() = _$CancelSuccessImpl;

  factory CancelSuccess.fromJson(Map<String, dynamic> json) =
      _$CancelSuccessImpl.fromJson;
}

/// @nodoc
abstract class _$$CancelFailureImplCopyWith<$Res> {
  factory _$$CancelFailureImplCopyWith(
          _$CancelFailureImpl value, $Res Function(_$CancelFailureImpl) then) =
      __$$CancelFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CancelFailureImplCopyWithImpl<$Res>
    extends _$CancelResultCopyWithImpl<$Res, _$CancelFailureImpl>
    implements _$$CancelFailureImplCopyWith<$Res> {
  __$$CancelFailureImplCopyWithImpl(
      _$CancelFailureImpl _value, $Res Function(_$CancelFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CancelFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelFailureImpl implements CancelFailure {
  const _$CancelFailureImpl(this.error, {final String? $type})
      : $type = $type ?? 'failure';

  factory _$CancelFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelFailureImplFromJson(json);

  @override
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CancelResult.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CancelResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelFailureImplCopyWith<_$CancelFailureImpl> get copyWith =>
      __$$CancelFailureImplCopyWithImpl<_$CancelFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
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
    required TResult Function(CancelSuccess value) success,
    required TResult Function(CancelFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CancelSuccess value)? success,
    TResult? Function(CancelFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelSuccess value)? success,
    TResult Function(CancelFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelFailureImplToJson(
      this,
    );
  }
}

abstract class CancelFailure implements CancelResult {
  const factory CancelFailure(final String error) = _$CancelFailureImpl;

  factory CancelFailure.fromJson(Map<String, dynamic> json) =
      _$CancelFailureImpl.fromJson;

  String get error;

  /// Create a copy of CancelResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelFailureImplCopyWith<_$CancelFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
