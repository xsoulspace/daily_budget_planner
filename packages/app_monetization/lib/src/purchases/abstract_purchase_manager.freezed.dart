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

PurchaseProductDetails _$PurchaseProductDetailsFromJson(
    Map<String, dynamic> json) {
  return _PurchaseProductDetails.fromJson(json);
}

/// @nodoc
mixin _$PurchaseProductDetails {
  ProductId get productId => throw _privateConstructorUsedError;
  PurchaseProductType get productType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// formatted price with currency
  String get formattedPrice => throw _privateConstructorUsedError;

  /// price without currency in smallest unit of currency
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Duration get freeTrialDuration => throw _privateConstructorUsedError;

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
      {ProductId productId,
      PurchaseProductType productType,
      String name,
      String formattedPrice,
      double price,
      String currency,
      Duration duration,
      String description,
      Duration freeTrialDuration});
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
    Object? duration = null,
    Object? description = null,
    Object? freeTrialDuration = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
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
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      freeTrialDuration: null == freeTrialDuration
          ? _value.freeTrialDuration
          : freeTrialDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
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
      {ProductId productId,
      PurchaseProductType productType,
      String name,
      String formattedPrice,
      double price,
      String currency,
      Duration duration,
      String description,
      Duration freeTrialDuration});
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
    Object? duration = null,
    Object? description = null,
    Object? freeTrialDuration = null,
  }) {
    return _then(_$PurchaseProductDetailsImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as ProductId,
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
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      freeTrialDuration: null == freeTrialDuration
          ? _value.freeTrialDuration
          : freeTrialDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseProductDetailsImpl implements _PurchaseProductDetails {
  const _$PurchaseProductDetailsImpl(
      {required this.productId,
      required this.productType,
      required this.name,
      required this.formattedPrice,
      required this.price,
      required this.currency,
      required this.duration,
      this.description = '',
      this.freeTrialDuration = Duration.zero});

  factory _$PurchaseProductDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseProductDetailsImplFromJson(json);

  @override
  final ProductId productId;
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
  final Duration duration;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final Duration freeTrialDuration;

  @override
  String toString() {
    return 'PurchaseProductDetails(productId: $productId, productType: $productType, name: $name, formattedPrice: $formattedPrice, price: $price, currency: $currency, duration: $duration, description: $description, freeTrialDuration: $freeTrialDuration)';
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
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
      duration,
      description,
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

abstract class _PurchaseProductDetails implements PurchaseProductDetails {
  const factory _PurchaseProductDetails(
      {required final ProductId productId,
      required final PurchaseProductType productType,
      required final String name,
      required final String formattedPrice,
      required final double price,
      required final String currency,
      required final Duration duration,
      final String description,
      final Duration freeTrialDuration}) = _$PurchaseProductDetailsImpl;

  factory _PurchaseProductDetails.fromJson(Map<String, dynamic> json) =
      _$PurchaseProductDetailsImpl.fromJson;

  @override
  ProductId get productId;
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
  Duration get duration;
  @override
  String get description;
  @override
  Duration get freeTrialDuration;

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
  ProductId get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// formatted price with currency
  String get formattedPrice => throw _privateConstructorUsedError;

  /// price without currency in smallest unit of currency
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  PurchaseProductType get purchaseType => throw _privateConstructorUsedError;
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
      String formattedPrice,
      double price,
      String currency,
      DateTime purchaseDate,
      PurchaseProductType purchaseType,
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
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseType: null == purchaseType
          ? _value.purchaseType
          : purchaseType // ignore: cast_nullable_to_non_nullable
              as PurchaseProductType,
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
      String formattedPrice,
      double price,
      String currency,
      DateTime purchaseDate,
      PurchaseProductType purchaseType,
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
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseType: null == purchaseType
          ? _value.purchaseType
          : purchaseType // ignore: cast_nullable_to_non_nullable
              as PurchaseProductType,
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
      required this.formattedPrice,
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

  /// formatted price with currency
  @override
  final String formattedPrice;

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
  final DateTime? expiryDate;

  @override
  String toString() {
    return 'PurchaseDetails(purchaseId: $purchaseId, productId: $productId, name: $name, formattedPrice: $formattedPrice, price: $price, currency: $currency, purchaseDate: $purchaseDate, purchaseType: $purchaseType, expiryDate: $expiryDate)';
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
      formattedPrice, price, currency, purchaseDate, purchaseType, expiryDate);

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
      required final String formattedPrice,
      required final double price,
      required final String currency,
      required final DateTime purchaseDate,
      required final PurchaseProductType purchaseType,
      final DateTime? expiryDate}) = _$PurchaseDetailsImpl;

  factory _PurchaseDetails.fromJson(Map<String, dynamic> json) =
      _$PurchaseDetailsImpl.fromJson;

  @override
  PurchaseId get purchaseId;
  @override
  ProductId get productId;
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
  DateTime get purchaseDate;
  @override
  PurchaseProductType get purchaseType;
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
