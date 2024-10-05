// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) {
  return _AppSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsModel {
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale => throw _privateConstructorUsedError;

  /// Serializes this AppSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsModelCopyWith<AppSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsModelCopyWith<$Res> {
  factory $AppSettingsModelCopyWith(
          AppSettingsModel value, $Res Function(AppSettingsModel) then) =
      _$AppSettingsModelCopyWithImpl<$Res, AppSettingsModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
      Locale? locale});
}

/// @nodoc
class _$AppSettingsModelCopyWithImpl<$Res, $Val extends AppSettingsModel>
    implements $AppSettingsModelCopyWith<$Res> {
  _$AppSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsModelImplCopyWith<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  factory _$$AppSettingsModelImplCopyWith(_$AppSettingsModelImpl value,
          $Res Function(_$AppSettingsModelImpl) then) =
      __$$AppSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
      Locale? locale});
}

/// @nodoc
class __$$AppSettingsModelImplCopyWithImpl<$Res>
    extends _$AppSettingsModelCopyWithImpl<$Res, _$AppSettingsModelImpl>
    implements _$$AppSettingsModelImplCopyWith<$Res> {
  __$$AppSettingsModelImplCopyWithImpl(_$AppSettingsModelImpl _value,
      $Res Function(_$AppSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$AppSettingsModelImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AppSettingsModelImpl extends _AppSettingsModel {
  const _$AppSettingsModelImpl(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
      this.locale})
      : super._();

  factory _$AppSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsModelImplFromJson(json);

  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  final Locale? locale;

  @override
  String toString() {
    return 'AppSettingsModel(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsModelImpl &&
            const DeepCollectionEquality().equals(other.locale, locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(locale));

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      __$$AppSettingsModelImplCopyWithImpl<_$AppSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _AppSettingsModel extends AppSettingsModel {
  const factory _AppSettingsModel(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
      final Locale? locale}) = _$AppSettingsModelImpl;
  const _AppSettingsModel._() : super._();

  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) =
      _$AppSettingsModelImpl.fromJson;

  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BudgetModelId {
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetModelIdCopyWith<BudgetModelId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelIdCopyWith<$Res> {
  factory $BudgetModelIdCopyWith(
          BudgetModelId value, $Res Function(BudgetModelId) then) =
      _$BudgetModelIdCopyWithImpl<$Res, BudgetModelId>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$BudgetModelIdCopyWithImpl<$Res, $Val extends BudgetModelId>
    implements $BudgetModelIdCopyWith<$Res> {
  _$BudgetModelIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetModelIdImplCopyWith<$Res>
    implements $BudgetModelIdCopyWith<$Res> {
  factory _$$BudgetModelIdImplCopyWith(
          _$BudgetModelIdImpl value, $Res Function(_$BudgetModelIdImpl) then) =
      __$$BudgetModelIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$BudgetModelIdImplCopyWithImpl<$Res>
    extends _$BudgetModelIdCopyWithImpl<$Res, _$BudgetModelIdImpl>
    implements _$$BudgetModelIdImplCopyWith<$Res> {
  __$$BudgetModelIdImplCopyWithImpl(
      _$BudgetModelIdImpl _value, $Res Function(_$BudgetModelIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$BudgetModelIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BudgetModelIdImpl extends _BudgetModelId {
  const _$BudgetModelIdImpl({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'BudgetModelId(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetModelIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetModelIdImplCopyWith<_$BudgetModelIdImpl> get copyWith =>
      __$$BudgetModelIdImplCopyWithImpl<_$BudgetModelIdImpl>(this, _$identity);
}

abstract class _BudgetModelId extends BudgetModelId {
  const factory _BudgetModelId({required final String value}) =
      _$BudgetModelIdImpl;
  const _BudgetModelId._() : super._();

  @override
  String get value;

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetModelIdImplCopyWith<_$BudgetModelIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyBudgetModel _$MonthlyBudgetModelFromJson(Map<String, dynamic> json) {
  return _MonthlyBudgetModel.fromJson(json);
}

/// @nodoc
mixin _$MonthlyBudgetModel {
  BudgetModelId get id => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: dateTimeFromMilisecondsSinceEpoch,
      toJson: dateTimeToMilisecondsSinceEpoch)
  DateTime? get nextBudgetDay => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get savings => throw _privateConstructorUsedError;

  /// Serializes this MonthlyBudgetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyBudgetModelCopyWith<MonthlyBudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyBudgetModelCopyWith<$Res> {
  factory $MonthlyBudgetModelCopyWith(
          MonthlyBudgetModel value, $Res Function(MonthlyBudgetModel) then) =
      _$MonthlyBudgetModelCopyWithImpl<$Res, MonthlyBudgetModel>;
  @useResult
  $Res call(
      {BudgetModelId id,
      @JsonKey(
          fromJson: dateTimeFromMilisecondsSinceEpoch,
          toJson: dateTimeToMilisecondsSinceEpoch)
      DateTime? nextBudgetDay,
      double amount,
      double savings});

  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class _$MonthlyBudgetModelCopyWithImpl<$Res, $Val extends MonthlyBudgetModel>
    implements $MonthlyBudgetModelCopyWith<$Res> {
  _$MonthlyBudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nextBudgetDay = freezed,
    Object? amount = null,
    Object? savings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetModelId,
      nextBudgetDay: freezed == nextBudgetDay
          ? _value.nextBudgetDay
          : nextBudgetDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetModelIdCopyWith<$Res> get id {
    return $BudgetModelIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonthlyBudgetModelImplCopyWith<$Res>
    implements $MonthlyBudgetModelCopyWith<$Res> {
  factory _$$MonthlyBudgetModelImplCopyWith(_$MonthlyBudgetModelImpl value,
          $Res Function(_$MonthlyBudgetModelImpl) then) =
      __$$MonthlyBudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BudgetModelId id,
      @JsonKey(
          fromJson: dateTimeFromMilisecondsSinceEpoch,
          toJson: dateTimeToMilisecondsSinceEpoch)
      DateTime? nextBudgetDay,
      double amount,
      double savings});

  @override
  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$MonthlyBudgetModelImplCopyWithImpl<$Res>
    extends _$MonthlyBudgetModelCopyWithImpl<$Res, _$MonthlyBudgetModelImpl>
    implements _$$MonthlyBudgetModelImplCopyWith<$Res> {
  __$$MonthlyBudgetModelImplCopyWithImpl(_$MonthlyBudgetModelImpl _value,
      $Res Function(_$MonthlyBudgetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nextBudgetDay = freezed,
    Object? amount = null,
    Object? savings = null,
  }) {
    return _then(_$MonthlyBudgetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetModelId,
      nextBudgetDay: freezed == nextBudgetDay
          ? _value.nextBudgetDay
          : nextBudgetDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyBudgetModelImpl implements _MonthlyBudgetModel {
  const _$MonthlyBudgetModelImpl(
      {required this.id,
      @JsonKey(
          fromJson: dateTimeFromMilisecondsSinceEpoch,
          toJson: dateTimeToMilisecondsSinceEpoch)
      this.nextBudgetDay,
      this.amount = 0,
      this.savings = 0});

  factory _$MonthlyBudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyBudgetModelImplFromJson(json);

  @override
  final BudgetModelId id;
  @override
  @JsonKey(
      fromJson: dateTimeFromMilisecondsSinceEpoch,
      toJson: dateTimeToMilisecondsSinceEpoch)
  final DateTime? nextBudgetDay;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final double savings;

  @override
  String toString() {
    return 'MonthlyBudgetModel(id: $id, nextBudgetDay: $nextBudgetDay, amount: $amount, savings: $savings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyBudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nextBudgetDay, nextBudgetDay) ||
                other.nextBudgetDay == nextBudgetDay) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.savings, savings) || other.savings == savings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nextBudgetDay, amount, savings);

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyBudgetModelImplCopyWith<_$MonthlyBudgetModelImpl> get copyWith =>
      __$$MonthlyBudgetModelImplCopyWithImpl<_$MonthlyBudgetModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyBudgetModelImplToJson(
      this,
    );
  }
}

abstract class _MonthlyBudgetModel implements MonthlyBudgetModel {
  const factory _MonthlyBudgetModel(
      {required final BudgetModelId id,
      @JsonKey(
          fromJson: dateTimeFromMilisecondsSinceEpoch,
          toJson: dateTimeToMilisecondsSinceEpoch)
      final DateTime? nextBudgetDay,
      final double amount,
      final double savings}) = _$MonthlyBudgetModelImpl;

  factory _MonthlyBudgetModel.fromJson(Map<String, dynamic> json) =
      _$MonthlyBudgetModelImpl.fromJson;

  @override
  BudgetModelId get id;
  @override
  @JsonKey(
      fromJson: dateTimeFromMilisecondsSinceEpoch,
      toJson: dateTimeToMilisecondsSinceEpoch)
  DateTime? get nextBudgetDay;
  @override
  double get amount;
  @override
  double get savings;

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyBudgetModelImplCopyWith<_$MonthlyBudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyBudgetModel _$WeeklyBudgetModelFromJson(Map<String, dynamic> json) {
  return _WeeklyBudgetModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyBudgetModel {
  BudgetModelId get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this WeeklyBudgetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyBudgetModelCopyWith<WeeklyBudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyBudgetModelCopyWith<$Res> {
  factory $WeeklyBudgetModelCopyWith(
          WeeklyBudgetModel value, $Res Function(WeeklyBudgetModel) then) =
      _$WeeklyBudgetModelCopyWithImpl<$Res, WeeklyBudgetModel>;
  @useResult
  $Res call({BudgetModelId id, double amount});

  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class _$WeeklyBudgetModelCopyWithImpl<$Res, $Val extends WeeklyBudgetModel>
    implements $WeeklyBudgetModelCopyWith<$Res> {
  _$WeeklyBudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetModelId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetModelIdCopyWith<$Res> get id {
    return $BudgetModelIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeeklyBudgetModelImplCopyWith<$Res>
    implements $WeeklyBudgetModelCopyWith<$Res> {
  factory _$$WeeklyBudgetModelImplCopyWith(_$WeeklyBudgetModelImpl value,
          $Res Function(_$WeeklyBudgetModelImpl) then) =
      __$$WeeklyBudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BudgetModelId id, double amount});

  @override
  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$WeeklyBudgetModelImplCopyWithImpl<$Res>
    extends _$WeeklyBudgetModelCopyWithImpl<$Res, _$WeeklyBudgetModelImpl>
    implements _$$WeeklyBudgetModelImplCopyWith<$Res> {
  __$$WeeklyBudgetModelImplCopyWithImpl(_$WeeklyBudgetModelImpl _value,
      $Res Function(_$WeeklyBudgetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_$WeeklyBudgetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetModelId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyBudgetModelImpl implements _WeeklyBudgetModel {
  const _$WeeklyBudgetModelImpl({required this.id, this.amount = 0});

  factory _$WeeklyBudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyBudgetModelImplFromJson(json);

  @override
  final BudgetModelId id;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'WeeklyBudgetModel(id: $id, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyBudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount);

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyBudgetModelImplCopyWith<_$WeeklyBudgetModelImpl> get copyWith =>
      __$$WeeklyBudgetModelImplCopyWithImpl<_$WeeklyBudgetModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyBudgetModelImplToJson(
      this,
    );
  }
}

abstract class _WeeklyBudgetModel implements WeeklyBudgetModel {
  const factory _WeeklyBudgetModel(
      {required final BudgetModelId id,
      final double amount}) = _$WeeklyBudgetModelImpl;

  factory _WeeklyBudgetModel.fromJson(Map<String, dynamic> json) =
      _$WeeklyBudgetModelImpl.fromJson;

  @override
  BudgetModelId get id;
  @override
  double get amount;

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyBudgetModelImplCopyWith<_$WeeklyBudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserModelId {
  String get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) local,
    required TResult Function(String value) remote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? local,
    TResult? Function(String value)? remote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? local,
    TResult Function(String value)? remote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserModelLocalId value) local,
    required TResult Function(UserModelRemoteId value) remote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserModelLocalId value)? local,
    TResult? Function(UserModelRemoteId value)? remote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserModelLocalId value)? local,
    TResult Function(UserModelRemoteId value)? remote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelIdCopyWith<UserModelId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelIdCopyWith<$Res> {
  factory $UserModelIdCopyWith(
          UserModelId value, $Res Function(UserModelId) then) =
      _$UserModelIdCopyWithImpl<$Res, UserModelId>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$UserModelIdCopyWithImpl<$Res, $Val extends UserModelId>
    implements $UserModelIdCopyWith<$Res> {
  _$UserModelIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelLocalIdImplCopyWith<$Res>
    implements $UserModelIdCopyWith<$Res> {
  factory _$$UserModelLocalIdImplCopyWith(_$UserModelLocalIdImpl value,
          $Res Function(_$UserModelLocalIdImpl) then) =
      __$$UserModelLocalIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UserModelLocalIdImplCopyWithImpl<$Res>
    extends _$UserModelIdCopyWithImpl<$Res, _$UserModelLocalIdImpl>
    implements _$$UserModelLocalIdImplCopyWith<$Res> {
  __$$UserModelLocalIdImplCopyWithImpl(_$UserModelLocalIdImpl _value,
      $Res Function(_$UserModelLocalIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UserModelLocalIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserModelLocalIdImpl extends UserModelLocalId {
  const _$UserModelLocalIdImpl({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'UserModelId.local(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelLocalIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelLocalIdImplCopyWith<_$UserModelLocalIdImpl> get copyWith =>
      __$$UserModelLocalIdImplCopyWithImpl<_$UserModelLocalIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) local,
    required TResult Function(String value) remote,
  }) {
    return local(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? local,
    TResult? Function(String value)? remote,
  }) {
    return local?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? local,
    TResult Function(String value)? remote,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserModelLocalId value) local,
    required TResult Function(UserModelRemoteId value) remote,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserModelLocalId value)? local,
    TResult? Function(UserModelRemoteId value)? remote,
  }) {
    return local?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserModelLocalId value)? local,
    TResult Function(UserModelRemoteId value)? remote,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }
}

abstract class UserModelLocalId extends UserModelId {
  const factory UserModelLocalId({required final String value}) =
      _$UserModelLocalIdImpl;
  const UserModelLocalId._() : super._();

  @override
  String get value;

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelLocalIdImplCopyWith<_$UserModelLocalIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserModelRemoteIdImplCopyWith<$Res>
    implements $UserModelIdCopyWith<$Res> {
  factory _$$UserModelRemoteIdImplCopyWith(_$UserModelRemoteIdImpl value,
          $Res Function(_$UserModelRemoteIdImpl) then) =
      __$$UserModelRemoteIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UserModelRemoteIdImplCopyWithImpl<$Res>
    extends _$UserModelIdCopyWithImpl<$Res, _$UserModelRemoteIdImpl>
    implements _$$UserModelRemoteIdImplCopyWith<$Res> {
  __$$UserModelRemoteIdImplCopyWithImpl(_$UserModelRemoteIdImpl _value,
      $Res Function(_$UserModelRemoteIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UserModelRemoteIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserModelRemoteIdImpl extends UserModelRemoteId {
  const _$UserModelRemoteIdImpl({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'UserModelId.remote(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelRemoteIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelRemoteIdImplCopyWith<_$UserModelRemoteIdImpl> get copyWith =>
      __$$UserModelRemoteIdImplCopyWithImpl<_$UserModelRemoteIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) local,
    required TResult Function(String value) remote,
  }) {
    return remote(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? local,
    TResult? Function(String value)? remote,
  }) {
    return remote?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? local,
    TResult Function(String value)? remote,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserModelLocalId value) local,
    required TResult Function(UserModelRemoteId value) remote,
  }) {
    return remote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserModelLocalId value)? local,
    TResult? Function(UserModelRemoteId value)? remote,
  }) {
    return remote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserModelLocalId value)? local,
    TResult Function(UserModelRemoteId value)? remote,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(this);
    }
    return orElse();
  }
}

abstract class UserModelRemoteId extends UserModelId {
  const factory UserModelRemoteId({required final String value}) =
      _$UserModelRemoteIdImpl;
  const UserModelRemoteId._() : super._();

  @override
  String get value;

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelRemoteIdImplCopyWith<_$UserModelRemoteIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(
      fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
  UserModelLocalId get localId => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
  UserModelRemoteId get remoteId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  SubscriptionModel get subscription => throw _privateConstructorUsedError;
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
      UserModelLocalId localId,
      @JsonKey(
          fromJson: UserModelId.remoteFromJson,
          toJson: UserModelId.toStringJson)
      UserModelRemoteId remoteId,
      DateTime createdAt,
      DateTime updatedAt,
      SubscriptionModel subscription,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
      Locale? locale});

  $SubscriptionModelCopyWith<$Res> get subscription;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? remoteId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? subscription = null,
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as UserModelLocalId,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as UserModelRemoteId,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ) as $Val);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<$Res> get subscription {
    return $SubscriptionModelCopyWith<$Res>(_value.subscription, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
      UserModelLocalId localId,
      @JsonKey(
          fromJson: UserModelId.remoteFromJson,
          toJson: UserModelId.toStringJson)
      UserModelRemoteId remoteId,
      DateTime createdAt,
      DateTime updatedAt,
      SubscriptionModel subscription,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
      Locale? locale});

  @override
  $SubscriptionModelCopyWith<$Res> get subscription;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? remoteId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? subscription = null,
    Object? locale = freezed,
  }) {
    return _then(_$UserModelImpl(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as UserModelLocalId,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as UserModelRemoteId,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {@JsonKey(
          fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
      required this.localId,
      @JsonKey(
          fromJson: UserModelId.remoteFromJson,
          toJson: UserModelId.toStringJson)
      required this.remoteId,
      required this.createdAt,
      required this.updatedAt,
      required this.subscription,
      @JsonKey(fromJson: localeFromString, toJson: localeToString) this.locale})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(
      fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
  final UserModelLocalId localId;
  @override
  @JsonKey(
      fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
  final UserModelRemoteId remoteId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final SubscriptionModel subscription;
  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  final Locale? locale;

  @override
  String toString() {
    return 'UserModel(localId: $localId, remoteId: $remoteId, createdAt: $createdAt, updatedAt: $updatedAt, subscription: $subscription, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            const DeepCollectionEquality().equals(other.localId, localId) &&
            const DeepCollectionEquality().equals(other.remoteId, remoteId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            const DeepCollectionEquality().equals(other.locale, locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(localId),
      const DeepCollectionEquality().hash(remoteId),
      createdAt,
      updatedAt,
      subscription,
      const DeepCollectionEquality().hash(locale));

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {@JsonKey(
          fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
      required final UserModelLocalId localId,
      @JsonKey(
          fromJson: UserModelId.remoteFromJson,
          toJson: UserModelId.toStringJson)
      required final UserModelRemoteId remoteId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final SubscriptionModel subscription,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
      final Locale? locale}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(
      fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
  UserModelLocalId get localId;
  @override
  @JsonKey(
      fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
  UserModelRemoteId get remoteId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  SubscriptionModel get subscription;
  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) {
  return _SubscriptionModel.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionModel {
  int get paidDaysLeft => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionModelCopyWith<SubscriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionModelCopyWith<$Res> {
  factory $SubscriptionModelCopyWith(
          SubscriptionModel value, $Res Function(SubscriptionModel) then) =
      _$SubscriptionModelCopyWithImpl<$Res, SubscriptionModel>;
  @useResult
  $Res call({int paidDaysLeft, DateTime? updatedAt});
}

/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res, $Val extends SubscriptionModel>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidDaysLeft = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      paidDaysLeft: null == paidDaysLeft
          ? _value.paidDaysLeft
          : paidDaysLeft // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionModelImplCopyWith<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  factory _$$SubscriptionModelImplCopyWith(_$SubscriptionModelImpl value,
          $Res Function(_$SubscriptionModelImpl) then) =
      __$$SubscriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int paidDaysLeft, DateTime? updatedAt});
}

/// @nodoc
class __$$SubscriptionModelImplCopyWithImpl<$Res>
    extends _$SubscriptionModelCopyWithImpl<$Res, _$SubscriptionModelImpl>
    implements _$$SubscriptionModelImplCopyWith<$Res> {
  __$$SubscriptionModelImplCopyWithImpl(_$SubscriptionModelImpl _value,
      $Res Function(_$SubscriptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidDaysLeft = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SubscriptionModelImpl(
      paidDaysLeft: null == paidDaysLeft
          ? _value.paidDaysLeft
          : paidDaysLeft // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SubscriptionModelImpl implements _SubscriptionModel {
  const _$SubscriptionModelImpl({this.paidDaysLeft = 0, this.updatedAt});

  factory _$SubscriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionModelImplFromJson(json);

  @override
  @JsonKey()
  final int paidDaysLeft;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SubscriptionModel(paidDaysLeft: $paidDaysLeft, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionModelImpl &&
            (identical(other.paidDaysLeft, paidDaysLeft) ||
                other.paidDaysLeft == paidDaysLeft) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paidDaysLeft, updatedAt);

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionModelImplCopyWith<_$SubscriptionModelImpl> get copyWith =>
      __$$SubscriptionModelImplCopyWithImpl<_$SubscriptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionModelImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionModel implements SubscriptionModel {
  const factory _SubscriptionModel(
      {final int paidDaysLeft,
      final DateTime? updatedAt}) = _$SubscriptionModelImpl;

  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) =
      _$SubscriptionModelImpl.fromJson;

  @override
  int get paidDaysLeft;
  @override
  DateTime? get updatedAt;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionModelImplCopyWith<_$SubscriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPermissionsModel _$UserPermissionsModelFromJson(Map<String, dynamic> json) {
  return _UserPermissionsModel.fromJson(json);
}

/// @nodoc
mixin _$UserPermissionsModel {
  bool get shouldBeSynced => throw _privateConstructorUsedError;
  int get tagLimit => throw _privateConstructorUsedError;

  /// Serializes this UserPermissionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPermissionsModelCopyWith<UserPermissionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPermissionsModelCopyWith<$Res> {
  factory $UserPermissionsModelCopyWith(UserPermissionsModel value,
          $Res Function(UserPermissionsModel) then) =
      _$UserPermissionsModelCopyWithImpl<$Res, UserPermissionsModel>;
  @useResult
  $Res call({bool shouldBeSynced, int tagLimit});
}

/// @nodoc
class _$UserPermissionsModelCopyWithImpl<$Res,
        $Val extends UserPermissionsModel>
    implements $UserPermissionsModelCopyWith<$Res> {
  _$UserPermissionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shouldBeSynced = null,
    Object? tagLimit = null,
  }) {
    return _then(_value.copyWith(
      shouldBeSynced: null == shouldBeSynced
          ? _value.shouldBeSynced
          : shouldBeSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      tagLimit: null == tagLimit
          ? _value.tagLimit
          : tagLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPermissionsModelImplCopyWith<$Res>
    implements $UserPermissionsModelCopyWith<$Res> {
  factory _$$UserPermissionsModelImplCopyWith(_$UserPermissionsModelImpl value,
          $Res Function(_$UserPermissionsModelImpl) then) =
      __$$UserPermissionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool shouldBeSynced, int tagLimit});
}

/// @nodoc
class __$$UserPermissionsModelImplCopyWithImpl<$Res>
    extends _$UserPermissionsModelCopyWithImpl<$Res, _$UserPermissionsModelImpl>
    implements _$$UserPermissionsModelImplCopyWith<$Res> {
  __$$UserPermissionsModelImplCopyWithImpl(_$UserPermissionsModelImpl _value,
      $Res Function(_$UserPermissionsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shouldBeSynced = null,
    Object? tagLimit = null,
  }) {
    return _then(_$UserPermissionsModelImpl(
      shouldBeSynced: null == shouldBeSynced
          ? _value.shouldBeSynced
          : shouldBeSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      tagLimit: null == tagLimit
          ? _value.tagLimit
          : tagLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UserPermissionsModelImpl implements _UserPermissionsModel {
  const _$UserPermissionsModelImpl(
      {this.shouldBeSynced = false, this.tagLimit = 5});

  factory _$UserPermissionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPermissionsModelImplFromJson(json);

  @override
  @JsonKey()
  final bool shouldBeSynced;
  @override
  @JsonKey()
  final int tagLimit;

  @override
  String toString() {
    return 'UserPermissionsModel(shouldBeSynced: $shouldBeSynced, tagLimit: $tagLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPermissionsModelImpl &&
            (identical(other.shouldBeSynced, shouldBeSynced) ||
                other.shouldBeSynced == shouldBeSynced) &&
            (identical(other.tagLimit, tagLimit) ||
                other.tagLimit == tagLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shouldBeSynced, tagLimit);

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPermissionsModelImplCopyWith<_$UserPermissionsModelImpl>
      get copyWith =>
          __$$UserPermissionsModelImplCopyWithImpl<_$UserPermissionsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPermissionsModelImplToJson(
      this,
    );
  }
}

abstract class _UserPermissionsModel implements UserPermissionsModel {
  const factory _UserPermissionsModel(
      {final bool shouldBeSynced,
      final int tagLimit}) = _$UserPermissionsModelImpl;

  factory _UserPermissionsModel.fromJson(Map<String, dynamic> json) =
      _$UserPermissionsModelImpl.fromJson;

  @override
  bool get shouldBeSynced;
  @override
  int get tagLimit;

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPermissionsModelImplCopyWith<_$UserPermissionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
