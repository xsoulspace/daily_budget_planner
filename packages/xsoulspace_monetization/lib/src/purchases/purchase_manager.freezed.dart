// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseDuration _$PurchaseDurationFromJson(Map<String, dynamic> json) {
  return _PurchaseDuration.fromJson(json);
}

/// @nodoc
mixin _$PurchaseDuration {
  int get years => throw _privateConstructorUsedError;
  int get months => throw _privateConstructorUsedError;
  int get days => throw _privateConstructorUsedError;

  /// Serializes this PurchaseDuration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseDuration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseDurationCopyWith<PurchaseDuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseDurationCopyWith<$Res> {
  factory $PurchaseDurationCopyWith(
          PurchaseDuration value, $Res Function(PurchaseDuration) then) =
      _$PurchaseDurationCopyWithImpl<$Res, PurchaseDuration>;
  @useResult
  $Res call({int years, int months, int days});
}

/// @nodoc
class _$PurchaseDurationCopyWithImpl<$Res, $Val extends PurchaseDuration>
    implements $PurchaseDurationCopyWith<$Res> {
  _$PurchaseDurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseDuration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? years = null,
    Object? months = null,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      years: null == years
          ? _value.years
          : years // ignore: cast_nullable_to_non_nullable
              as int,
      months: null == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseDurationImplCopyWith<$Res>
    implements $PurchaseDurationCopyWith<$Res> {
  factory _$$PurchaseDurationImplCopyWith(_$PurchaseDurationImpl value,
          $Res Function(_$PurchaseDurationImpl) then) =
      __$$PurchaseDurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int years, int months, int days});
}

/// @nodoc
class __$$PurchaseDurationImplCopyWithImpl<$Res>
    extends _$PurchaseDurationCopyWithImpl<$Res, _$PurchaseDurationImpl>
    implements _$$PurchaseDurationImplCopyWith<$Res> {
  __$$PurchaseDurationImplCopyWithImpl(_$PurchaseDurationImpl _value,
      $Res Function(_$PurchaseDurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseDuration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? years = null,
    Object? months = null,
    Object? days = null,
  }) {
    return _then(_$PurchaseDurationImpl(
      years: null == years
          ? _value.years
          : years // ignore: cast_nullable_to_non_nullable
              as int,
      months: null == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseDurationImpl extends _PurchaseDuration {
  const _$PurchaseDurationImpl({this.years = 0, this.months = 0, this.days = 0})
      : super._();

  factory _$PurchaseDurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseDurationImplFromJson(json);

  @override
  @JsonKey()
  final int years;
  @override
  @JsonKey()
  final int months;
  @override
  @JsonKey()
  final int days;

  @override
  String toString() {
    return 'PurchaseDuration(years: $years, months: $months, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseDurationImpl &&
            (identical(other.years, years) || other.years == years) &&
            (identical(other.months, months) || other.months == months) &&
            (identical(other.days, days) || other.days == days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, years, months, days);

  /// Create a copy of PurchaseDuration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseDurationImplCopyWith<_$PurchaseDurationImpl> get copyWith =>
      __$$PurchaseDurationImplCopyWithImpl<_$PurchaseDurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseDurationImplToJson(
      this,
    );
  }
}

abstract class _PurchaseDuration extends PurchaseDuration {
  const factory _PurchaseDuration(
      {final int years,
      final int months,
      final int days}) = _$PurchaseDurationImpl;
  const _PurchaseDuration._() : super._();

  factory _PurchaseDuration.fromJson(Map<String, dynamic> json) =
      _$PurchaseDurationImpl.fromJson;

  @override
  int get years;
  @override
  int get months;
  @override
  int get days;

  /// Create a copy of PurchaseDuration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseDurationImplCopyWith<_$PurchaseDurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseProductDetails _$PurchaseProductDetailsFromJson(
    Map<String, dynamic> json) {
  return _PurchaseProductDetails.fromJson(json);
}

/// @nodoc
mixin _$PurchaseProductDetails {
  PurchaseProductId get productId => throw _privateConstructorUsedError;
  PurchaseProductType get productType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// formatted price with currency
  String get formattedPrice => throw _privateConstructorUsedError;

  /// price without currency in smallest unit of currency
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  PurchaseDuration get freeTrialDuration => throw _privateConstructorUsedError;

  /// Serializes this PurchaseProductDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseProductDetailsCopyWith<PurchaseProductDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseProductDetailsCopyWith<$Res> {
  factory $PurchaseProductDetailsCopyWith(PurchaseProductDetails value,
          $Res Function(PurchaseProductDetails) then) =
      _$PurchaseProductDetailsCopyWithImpl<$Res, PurchaseProductDetails>;
  @useResult
  $Res call(
      {PurchaseProductId productId,
      PurchaseProductType productType,
      String name,
      String formattedPrice,
      double price,
      String currency,
      String description,
      Duration duration,
      PurchaseDuration freeTrialDuration});

  $PurchaseDurationCopyWith<$Res> get freeTrialDuration;
}

/// @nodoc
class _$PurchaseProductDetailsCopyWithImpl<$Res,
        $Val extends PurchaseProductDetails>
    implements $PurchaseProductDetailsCopyWith<$Res> {
  _$PurchaseProductDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productType = null,
    Object? name = null,
    Object? formattedPrice = null,
    Object? price = null,
    Object? currency = null,
    Object? description = null,
    Object? duration = null,
    Object? freeTrialDuration = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as PurchaseProductId,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as PurchaseProductType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPrice: null == formattedPrice
          ? _value.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      freeTrialDuration: null == freeTrialDuration
          ? _value.freeTrialDuration
          : freeTrialDuration // ignore: cast_nullable_to_non_nullable
              as PurchaseDuration,
    ) as $Val);
  }

  /// Create a copy of PurchaseProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseDurationCopyWith<$Res> get freeTrialDuration {
    return $PurchaseDurationCopyWith<$Res>(_value.freeTrialDuration, (value) {
      return _then(_value.copyWith(freeTrialDuration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseProductDetailsImplCopyWith<$Res>
    implements $PurchaseProductDetailsCopyWith<$Res> {
  factory _$$PurchaseProductDetailsImplCopyWith(
          _$PurchaseProductDetailsImpl value,
          $Res Function(_$PurchaseProductDetailsImpl) then) =
      __$$PurchaseProductDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PurchaseProductId productId,
      PurchaseProductType productType,
      String name,
      String formattedPrice,
      double price,
      String currency,
      String description,
      Duration duration,
      PurchaseDuration freeTrialDuration});

  @override
  $PurchaseDurationCopyWith<$Res> get freeTrialDuration;
}

/// @nodoc
class __$$PurchaseProductDetailsImplCopyWithImpl<$Res>
    extends _$PurchaseProductDetailsCopyWithImpl<$Res,
        _$PurchaseProductDetailsImpl>
    implements _$$PurchaseProductDetailsImplCopyWith<$Res> {
  __$$PurchaseProductDetailsImplCopyWithImpl(
      _$PurchaseProductDetailsImpl _value,
      $Res Function(_$PurchaseProductDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productType = null,
    Object? name = null,
    Object? formattedPrice = null,
    Object? price = null,
    Object? currency = null,
    Object? description = null,
    Object? duration = null,
    Object? freeTrialDuration = null,
  }) {
    return _then(_$PurchaseProductDetailsImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as PurchaseProductId,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as PurchaseProductType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPrice: null == formattedPrice
          ? _value.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      freeTrialDuration: null == freeTrialDuration
          ? _value.freeTrialDuration
          : freeTrialDuration // ignore: cast_nullable_to_non_nullable
              as PurchaseDuration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseProductDetailsImpl extends _PurchaseProductDetails {
  const _$PurchaseProductDetailsImpl(
      {required this.productId,
      required this.productType,
      required this.name,
      required this.formattedPrice,
      required this.price,
      required this.currency,
      this.description = '',
      this.duration = Duration.zero,
      this.freeTrialDuration = PurchaseDuration.zero})
      : super._();

  factory _$PurchaseProductDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseProductDetailsImplFromJson(json);

  @override
  final PurchaseProductId productId;
  @override
  final PurchaseProductType productType;
  @override
  final String name;

  /// formatted price with currency
  @override
  final String formattedPrice;

  /// price without currency in smallest unit of currency
  @override
  final double price;
  @override
  final String currency;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final PurchaseDuration freeTrialDuration;

  @override
  String toString() {
    return 'PurchaseProductDetails(productId: $productId, productType: $productType, name: $name, formattedPrice: $formattedPrice, price: $price, currency: $currency, description: $description, duration: $duration, freeTrialDuration: $freeTrialDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseProductDetailsImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.freeTrialDuration, freeTrialDuration) ||
                other.freeTrialDuration == freeTrialDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productType,
      name,
      formattedPrice,
      price,
      currency,
      description,
      duration,
      freeTrialDuration);

  /// Create a copy of PurchaseProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseProductDetailsImplCopyWith<_$PurchaseProductDetailsImpl>
      get copyWith => __$$PurchaseProductDetailsImplCopyWithImpl<
          _$PurchaseProductDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseProductDetailsImplToJson(
      this,
    );
  }
}

abstract class _PurchaseProductDetails extends PurchaseProductDetails {
  const factory _PurchaseProductDetails(
      {required final PurchaseProductId productId,
      required final PurchaseProductType productType,
      required final String name,
      required final String formattedPrice,
      required final double price,
      required final String currency,
      final String description,
      final Duration duration,
      final PurchaseDuration freeTrialDuration}) = _$PurchaseProductDetailsImpl;
  const _PurchaseProductDetails._() : super._();

  factory _PurchaseProductDetails.fromJson(Map<String, dynamic> json) =
      _$PurchaseProductDetailsImpl.fromJson;

  @override
  PurchaseProductId get productId;
  @override
  PurchaseProductType get productType;
  @override
  String get name;

  /// formatted price with currency
  @override
  String get formattedPrice;

  /// price without currency in smallest unit of currency
  @override
  double get price;
  @override
  String get currency;
  @override
  String get description;
  @override
  Duration get duration;
  @override
  PurchaseDuration get freeTrialDuration;

  /// Create a copy of PurchaseProductDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseProductDetailsImplCopyWith<_$PurchaseProductDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PurchaseDetails _$PurchaseDetailsFromJson(Map<String, dynamic> json) {
  return _PurchaseDetails.fromJson(json);
}

/// @nodoc
mixin _$PurchaseDetails {
  PurchaseId get purchaseId => throw _privateConstructorUsedError;
  PurchaseProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// formatted price with currency
  String get formattedPrice => throw _privateConstructorUsedError;
  PurchaseStatus get status => throw _privateConstructorUsedError;

  /// price without currency in smallest unit of currency
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  PurchaseProductType get purchaseType => throw _privateConstructorUsedError;
  Duration get freeTrialDuration => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
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
      PurchaseProductId productId,
      String name,
      String formattedPrice,
      PurchaseStatus status,
      double price,
      String currency,
      DateTime purchaseDate,
      PurchaseProductType purchaseType,
      Duration freeTrialDuration,
      Duration duration,
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
    Object? formattedPrice = null,
    Object? status = null,
    Object? price = null,
    Object? currency = null,
    Object? purchaseDate = null,
    Object? purchaseType = null,
    Object? freeTrialDuration = null,
    Object? duration = null,
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
              as PurchaseProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPrice: null == formattedPrice
          ? _value.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
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
              as PurchaseProductType,
      freeTrialDuration: null == freeTrialDuration
          ? _value.freeTrialDuration
          : freeTrialDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
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
      PurchaseProductId productId,
      String name,
      String formattedPrice,
      PurchaseStatus status,
      double price,
      String currency,
      DateTime purchaseDate,
      PurchaseProductType purchaseType,
      Duration freeTrialDuration,
      Duration duration,
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
    Object? formattedPrice = null,
    Object? status = null,
    Object? price = null,
    Object? currency = null,
    Object? purchaseDate = null,
    Object? purchaseType = null,
    Object? freeTrialDuration = null,
    Object? duration = null,
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
              as PurchaseProductId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPrice: null == formattedPrice
          ? _value.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
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
              as PurchaseProductType,
      freeTrialDuration: null == freeTrialDuration
          ? _value.freeTrialDuration
          : freeTrialDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseDetailsImpl extends _PurchaseDetails {
  const _$PurchaseDetailsImpl(
      {required this.purchaseId,
      required this.productId,
      required this.name,
      required this.formattedPrice,
      required this.status,
      required this.price,
      required this.currency,
      required this.purchaseDate,
      required this.purchaseType,
      this.freeTrialDuration = Duration.zero,
      this.duration = Duration.zero,
      this.expiryDate})
      : super._();

  factory _$PurchaseDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseDetailsImplFromJson(json);

  @override
  final PurchaseId purchaseId;
  @override
  final PurchaseProductId productId;
  @override
  final String name;

  /// formatted price with currency
  @override
  final String formattedPrice;
  @override
  final PurchaseStatus status;

  /// price without currency in smallest unit of currency
  @override
  final double price;
  @override
  final String currency;
  @override
  final DateTime purchaseDate;
  @override
  final PurchaseProductType purchaseType;
  @override
  @JsonKey()
  final Duration freeTrialDuration;
  @override
  @JsonKey()
  final Duration duration;
  @override
  final DateTime? expiryDate;

  @override
  String toString() {
    return 'PurchaseDetails(purchaseId: $purchaseId, productId: $productId, name: $name, formattedPrice: $formattedPrice, status: $status, price: $price, currency: $currency, purchaseDate: $purchaseDate, purchaseType: $purchaseType, freeTrialDuration: $freeTrialDuration, duration: $duration, expiryDate: $expiryDate)';
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
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.purchaseType, purchaseType) ||
                other.purchaseType == purchaseType) &&
            (identical(other.freeTrialDuration, freeTrialDuration) ||
                other.freeTrialDuration == freeTrialDuration) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      purchaseId,
      productId,
      name,
      formattedPrice,
      status,
      price,
      currency,
      purchaseDate,
      purchaseType,
      freeTrialDuration,
      duration,
      expiryDate);

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

abstract class _PurchaseDetails extends PurchaseDetails {
  const factory _PurchaseDetails(
      {required final PurchaseId purchaseId,
      required final PurchaseProductId productId,
      required final String name,
      required final String formattedPrice,
      required final PurchaseStatus status,
      required final double price,
      required final String currency,
      required final DateTime purchaseDate,
      required final PurchaseProductType purchaseType,
      final Duration freeTrialDuration,
      final Duration duration,
      final DateTime? expiryDate}) = _$PurchaseDetailsImpl;
  const _PurchaseDetails._() : super._();

  factory _PurchaseDetails.fromJson(Map<String, dynamic> json) =
      _$PurchaseDetailsImpl.fromJson;

  @override
  PurchaseId get purchaseId;
  @override
  PurchaseProductId get productId;
  @override
  String get name;

  /// formatted price with currency
  @override
  String get formattedPrice;
  @override
  PurchaseStatus get status;

  /// price without currency in smallest unit of currency
  @override
  double get price;
  @override
  String get currency;
  @override
  DateTime get purchaseDate;
  @override
  PurchaseProductType get purchaseType;
  @override
  Duration get freeTrialDuration;
  @override
  Duration get duration;
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

CompletePurchaseResult _$CompletePurchaseResultFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return CompletePurchaseSuccess.fromJson(json);
    case 'failure':
      return CompletePurchaseFailure.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'CompletePurchaseResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$CompletePurchaseResult {
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
    required TResult Function(CompletePurchaseSuccess value) success,
    required TResult Function(CompletePurchaseFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompletePurchaseSuccess value)? success,
    TResult? Function(CompletePurchaseFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompletePurchaseSuccess value)? success,
    TResult Function(CompletePurchaseFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this CompletePurchaseResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletePurchaseResultCopyWith<$Res> {
  factory $CompletePurchaseResultCopyWith(CompletePurchaseResult value,
          $Res Function(CompletePurchaseResult) then) =
      _$CompletePurchaseResultCopyWithImpl<$Res, CompletePurchaseResult>;
}

/// @nodoc
class _$CompletePurchaseResultCopyWithImpl<$Res,
        $Val extends CompletePurchaseResult>
    implements $CompletePurchaseResultCopyWith<$Res> {
  _$CompletePurchaseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompletePurchaseResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CompletePurchaseSuccessImplCopyWith<$Res> {
  factory _$$CompletePurchaseSuccessImplCopyWith(
          _$CompletePurchaseSuccessImpl value,
          $Res Function(_$CompletePurchaseSuccessImpl) then) =
      __$$CompletePurchaseSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletePurchaseSuccessImplCopyWithImpl<$Res>
    extends _$CompletePurchaseResultCopyWithImpl<$Res,
        _$CompletePurchaseSuccessImpl>
    implements _$$CompletePurchaseSuccessImplCopyWith<$Res> {
  __$$CompletePurchaseSuccessImplCopyWithImpl(
      _$CompletePurchaseSuccessImpl _value,
      $Res Function(_$CompletePurchaseSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompletePurchaseResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CompletePurchaseSuccessImpl implements CompletePurchaseSuccess {
  const _$CompletePurchaseSuccessImpl({final String? $type})
      : $type = $type ?? 'success';

  factory _$CompletePurchaseSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompletePurchaseSuccessImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CompletePurchaseResult.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletePurchaseSuccessImpl);
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
    required TResult Function(CompletePurchaseSuccess value) success,
    required TResult Function(CompletePurchaseFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompletePurchaseSuccess value)? success,
    TResult? Function(CompletePurchaseFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompletePurchaseSuccess value)? success,
    TResult Function(CompletePurchaseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CompletePurchaseSuccessImplToJson(
      this,
    );
  }
}

abstract class CompletePurchaseSuccess implements CompletePurchaseResult {
  const factory CompletePurchaseSuccess() = _$CompletePurchaseSuccessImpl;

  factory CompletePurchaseSuccess.fromJson(Map<String, dynamic> json) =
      _$CompletePurchaseSuccessImpl.fromJson;
}

/// @nodoc
abstract class _$$CompletePurchaseFailureImplCopyWith<$Res> {
  factory _$$CompletePurchaseFailureImplCopyWith(
          _$CompletePurchaseFailureImpl value,
          $Res Function(_$CompletePurchaseFailureImpl) then) =
      __$$CompletePurchaseFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CompletePurchaseFailureImplCopyWithImpl<$Res>
    extends _$CompletePurchaseResultCopyWithImpl<$Res,
        _$CompletePurchaseFailureImpl>
    implements _$$CompletePurchaseFailureImplCopyWith<$Res> {
  __$$CompletePurchaseFailureImplCopyWithImpl(
      _$CompletePurchaseFailureImpl _value,
      $Res Function(_$CompletePurchaseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompletePurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CompletePurchaseFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompletePurchaseFailureImpl implements CompletePurchaseFailure {
  const _$CompletePurchaseFailureImpl(this.error, {final String? $type})
      : $type = $type ?? 'failure';

  factory _$CompletePurchaseFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompletePurchaseFailureImplFromJson(json);

  @override
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CompletePurchaseResult.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletePurchaseFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CompletePurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletePurchaseFailureImplCopyWith<_$CompletePurchaseFailureImpl>
      get copyWith => __$$CompletePurchaseFailureImplCopyWithImpl<
          _$CompletePurchaseFailureImpl>(this, _$identity);

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
    required TResult Function(CompletePurchaseSuccess value) success,
    required TResult Function(CompletePurchaseFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompletePurchaseSuccess value)? success,
    TResult? Function(CompletePurchaseFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompletePurchaseSuccess value)? success,
    TResult Function(CompletePurchaseFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CompletePurchaseFailureImplToJson(
      this,
    );
  }
}

abstract class CompletePurchaseFailure implements CompletePurchaseResult {
  const factory CompletePurchaseFailure(final String error) =
      _$CompletePurchaseFailureImpl;

  factory CompletePurchaseFailure.fromJson(Map<String, dynamic> json) =
      _$CompletePurchaseFailureImpl.fromJson;

  String get error;

  /// Create a copy of CompletePurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletePurchaseFailureImplCopyWith<_$CompletePurchaseFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PurchaseVerificationDto _$PurchaseVerificationDtoFromJson(
    Map<String, dynamic> json) {
  return _PurchaseVerificationDto.fromJson(json);
}

/// @nodoc
mixin _$PurchaseVerificationDto {
  PurchaseId get purchaseId => throw _privateConstructorUsedError;
  PurchaseProductId get productId => throw _privateConstructorUsedError;
  PurchaseStatus get status => throw _privateConstructorUsedError;
  PurchaseProductType get productType => throw _privateConstructorUsedError;
  DateTime? get transactionDate => throw _privateConstructorUsedError;
  String? get purchaseToken => throw _privateConstructorUsedError;

  /// same as developerChallenge
  String? get developerPayload => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get localVerificationData => throw _privateConstructorUsedError;
  String? get serverVerificationData => throw _privateConstructorUsedError;

  /// Serializes this PurchaseVerificationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseVerificationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseVerificationDtoCopyWith<PurchaseVerificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseVerificationDtoCopyWith<$Res> {
  factory $PurchaseVerificationDtoCopyWith(PurchaseVerificationDto value,
          $Res Function(PurchaseVerificationDto) then) =
      _$PurchaseVerificationDtoCopyWithImpl<$Res, PurchaseVerificationDto>;
  @useResult
  $Res call(
      {PurchaseId purchaseId,
      PurchaseProductId productId,
      PurchaseStatus status,
      PurchaseProductType productType,
      DateTime? transactionDate,
      String? purchaseToken,
      String? developerPayload,
      String? source,
      String? localVerificationData,
      String? serverVerificationData});
}

/// @nodoc
class _$PurchaseVerificationDtoCopyWithImpl<$Res,
        $Val extends PurchaseVerificationDto>
    implements $PurchaseVerificationDtoCopyWith<$Res> {
  _$PurchaseVerificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseVerificationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseId = null,
    Object? productId = null,
    Object? status = null,
    Object? productType = null,
    Object? transactionDate = freezed,
    Object? purchaseToken = freezed,
    Object? developerPayload = freezed,
    Object? source = freezed,
    Object? localVerificationData = freezed,
    Object? serverVerificationData = freezed,
  }) {
    return _then(_value.copyWith(
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as PurchaseId,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as PurchaseProductId,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as PurchaseProductType,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchaseToken: freezed == purchaseToken
          ? _value.purchaseToken
          : purchaseToken // ignore: cast_nullable_to_non_nullable
              as String?,
      developerPayload: freezed == developerPayload
          ? _value.developerPayload
          : developerPayload // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      localVerificationData: freezed == localVerificationData
          ? _value.localVerificationData
          : localVerificationData // ignore: cast_nullable_to_non_nullable
              as String?,
      serverVerificationData: freezed == serverVerificationData
          ? _value.serverVerificationData
          : serverVerificationData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseVerificationDtoImplCopyWith<$Res>
    implements $PurchaseVerificationDtoCopyWith<$Res> {
  factory _$$PurchaseVerificationDtoImplCopyWith(
          _$PurchaseVerificationDtoImpl value,
          $Res Function(_$PurchaseVerificationDtoImpl) then) =
      __$$PurchaseVerificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PurchaseId purchaseId,
      PurchaseProductId productId,
      PurchaseStatus status,
      PurchaseProductType productType,
      DateTime? transactionDate,
      String? purchaseToken,
      String? developerPayload,
      String? source,
      String? localVerificationData,
      String? serverVerificationData});
}

/// @nodoc
class __$$PurchaseVerificationDtoImplCopyWithImpl<$Res>
    extends _$PurchaseVerificationDtoCopyWithImpl<$Res,
        _$PurchaseVerificationDtoImpl>
    implements _$$PurchaseVerificationDtoImplCopyWith<$Res> {
  __$$PurchaseVerificationDtoImplCopyWithImpl(
      _$PurchaseVerificationDtoImpl _value,
      $Res Function(_$PurchaseVerificationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseVerificationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseId = null,
    Object? productId = null,
    Object? status = null,
    Object? productType = null,
    Object? transactionDate = freezed,
    Object? purchaseToken = freezed,
    Object? developerPayload = freezed,
    Object? source = freezed,
    Object? localVerificationData = freezed,
    Object? serverVerificationData = freezed,
  }) {
    return _then(_$PurchaseVerificationDtoImpl(
      purchaseId: null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as PurchaseId,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as PurchaseProductId,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as PurchaseProductType,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchaseToken: freezed == purchaseToken
          ? _value.purchaseToken
          : purchaseToken // ignore: cast_nullable_to_non_nullable
              as String?,
      developerPayload: freezed == developerPayload
          ? _value.developerPayload
          : developerPayload // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      localVerificationData: freezed == localVerificationData
          ? _value.localVerificationData
          : localVerificationData // ignore: cast_nullable_to_non_nullable
              as String?,
      serverVerificationData: freezed == serverVerificationData
          ? _value.serverVerificationData
          : serverVerificationData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseVerificationDtoImpl implements _PurchaseVerificationDto {
  const _$PurchaseVerificationDtoImpl(
      {required this.purchaseId,
      required this.productId,
      required this.status,
      required this.productType,
      this.transactionDate,
      this.purchaseToken,
      this.developerPayload,
      this.source,
      this.localVerificationData,
      this.serverVerificationData});

  factory _$PurchaseVerificationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseVerificationDtoImplFromJson(json);

  @override
  final PurchaseId purchaseId;
  @override
  final PurchaseProductId productId;
  @override
  final PurchaseStatus status;
  @override
  final PurchaseProductType productType;
  @override
  final DateTime? transactionDate;
  @override
  final String? purchaseToken;

  /// same as developerChallenge
  @override
  final String? developerPayload;
  @override
  final String? source;
  @override
  final String? localVerificationData;
  @override
  final String? serverVerificationData;

  @override
  String toString() {
    return 'PurchaseVerificationDto(purchaseId: $purchaseId, productId: $productId, status: $status, productType: $productType, transactionDate: $transactionDate, purchaseToken: $purchaseToken, developerPayload: $developerPayload, source: $source, localVerificationData: $localVerificationData, serverVerificationData: $serverVerificationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseVerificationDtoImpl &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.purchaseToken, purchaseToken) ||
                other.purchaseToken == purchaseToken) &&
            (identical(other.developerPayload, developerPayload) ||
                other.developerPayload == developerPayload) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.localVerificationData, localVerificationData) ||
                other.localVerificationData == localVerificationData) &&
            (identical(other.serverVerificationData, serverVerificationData) ||
                other.serverVerificationData == serverVerificationData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      purchaseId,
      productId,
      status,
      productType,
      transactionDate,
      purchaseToken,
      developerPayload,
      source,
      localVerificationData,
      serverVerificationData);

  /// Create a copy of PurchaseVerificationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseVerificationDtoImplCopyWith<_$PurchaseVerificationDtoImpl>
      get copyWith => __$$PurchaseVerificationDtoImplCopyWithImpl<
          _$PurchaseVerificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseVerificationDtoImplToJson(
      this,
    );
  }
}

abstract class _PurchaseVerificationDto implements PurchaseVerificationDto {
  const factory _PurchaseVerificationDto(
      {required final PurchaseId purchaseId,
      required final PurchaseProductId productId,
      required final PurchaseStatus status,
      required final PurchaseProductType productType,
      final DateTime? transactionDate,
      final String? purchaseToken,
      final String? developerPayload,
      final String? source,
      final String? localVerificationData,
      final String? serverVerificationData}) = _$PurchaseVerificationDtoImpl;

  factory _PurchaseVerificationDto.fromJson(Map<String, dynamic> json) =
      _$PurchaseVerificationDtoImpl.fromJson;

  @override
  PurchaseId get purchaseId;
  @override
  PurchaseProductId get productId;
  @override
  PurchaseStatus get status;
  @override
  PurchaseProductType get productType;
  @override
  DateTime? get transactionDate;
  @override
  String? get purchaseToken;

  /// same as developerChallenge
  @override
  String? get developerPayload;
  @override
  String? get source;
  @override
  String? get localVerificationData;
  @override
  String? get serverVerificationData;

  /// Create a copy of PurchaseVerificationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseVerificationDtoImplCopyWith<_$PurchaseVerificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
