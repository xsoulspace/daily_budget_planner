// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) {
  return _AppSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsModel {
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_AppSettingsModelCopyWith<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  factory _$$_AppSettingsModelCopyWith(
          _$_AppSettingsModel value, $Res Function(_$_AppSettingsModel) then) =
      __$$_AppSettingsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
          Locale? locale});
}

/// @nodoc
class __$$_AppSettingsModelCopyWithImpl<$Res>
    extends _$AppSettingsModelCopyWithImpl<$Res, _$_AppSettingsModel>
    implements _$$_AppSettingsModelCopyWith<$Res> {
  __$$_AppSettingsModelCopyWithImpl(
      _$_AppSettingsModel _value, $Res Function(_$_AppSettingsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$_AppSettingsModel(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AppSettingsModel extends _AppSettingsModel {
  const _$_AppSettingsModel(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
          this.locale})
      : super._();

  factory _$_AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppSettingsModelFromJson(json);

  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  final Locale? locale;

  @override
  String toString() {
    return 'AppSettingsModel(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppSettingsModel &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppSettingsModelCopyWith<_$_AppSettingsModel> get copyWith =>
      __$$_AppSettingsModelCopyWithImpl<_$_AppSettingsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppSettingsModelToJson(
      this,
    );
  }
}

abstract class _AppSettingsModel extends AppSettingsModel {
  const factory _AppSettingsModel(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
          final Locale? locale}) = _$_AppSettingsModel;
  const _AppSettingsModel._() : super._();

  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) =
      _$_AppSettingsModel.fromJson;

  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale;
  @override
  @JsonKey(ignore: true)
  _$$_AppSettingsModelCopyWith<_$_AppSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BudgetModelId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
abstract class _$$_BudgetModelIdCopyWith<$Res>
    implements $BudgetModelIdCopyWith<$Res> {
  factory _$$_BudgetModelIdCopyWith(
          _$_BudgetModelId value, $Res Function(_$_BudgetModelId) then) =
      __$$_BudgetModelIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_BudgetModelIdCopyWithImpl<$Res>
    extends _$BudgetModelIdCopyWithImpl<$Res, _$_BudgetModelId>
    implements _$$_BudgetModelIdCopyWith<$Res> {
  __$$_BudgetModelIdCopyWithImpl(
      _$_BudgetModelId _value, $Res Function(_$_BudgetModelId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_BudgetModelId(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BudgetModelId extends _BudgetModelId {
  const _$_BudgetModelId({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'BudgetModelId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetModelId &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetModelIdCopyWith<_$_BudgetModelId> get copyWith =>
      __$$_BudgetModelIdCopyWithImpl<_$_BudgetModelId>(this, _$identity);
}

abstract class _BudgetModelId extends BudgetModelId {
  const factory _BudgetModelId({required final String value}) =
      _$_BudgetModelId;
  const _BudgetModelId._() : super._();

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetModelIdCopyWith<_$_BudgetModelId> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(fromJson: dateTimeFromMilisecondsSinceEpoch, toJson: dateTimeToMilisecondsSinceEpoch)
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

  @override
  @pragma('vm:prefer-inline')
  $BudgetModelIdCopyWith<$Res> get id {
    return $BudgetModelIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MonthlyBudgetModelCopyWith<$Res>
    implements $MonthlyBudgetModelCopyWith<$Res> {
  factory _$$_MonthlyBudgetModelCopyWith(_$_MonthlyBudgetModel value,
          $Res Function(_$_MonthlyBudgetModel) then) =
      __$$_MonthlyBudgetModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BudgetModelId id,
      @JsonKey(fromJson: dateTimeFromMilisecondsSinceEpoch, toJson: dateTimeToMilisecondsSinceEpoch)
          DateTime? nextBudgetDay,
      double amount,
      double savings});

  @override
  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_MonthlyBudgetModelCopyWithImpl<$Res>
    extends _$MonthlyBudgetModelCopyWithImpl<$Res, _$_MonthlyBudgetModel>
    implements _$$_MonthlyBudgetModelCopyWith<$Res> {
  __$$_MonthlyBudgetModelCopyWithImpl(
      _$_MonthlyBudgetModel _value, $Res Function(_$_MonthlyBudgetModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nextBudgetDay = freezed,
    Object? amount = null,
    Object? savings = null,
  }) {
    return _then(_$_MonthlyBudgetModel(
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
class _$_MonthlyBudgetModel implements _MonthlyBudgetModel {
  const _$_MonthlyBudgetModel(
      {required this.id,
      @JsonKey(fromJson: dateTimeFromMilisecondsSinceEpoch, toJson: dateTimeToMilisecondsSinceEpoch)
          this.nextBudgetDay,
      this.amount = 0,
      this.savings = 0});

  factory _$_MonthlyBudgetModel.fromJson(Map<String, dynamic> json) =>
      _$$_MonthlyBudgetModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MonthlyBudgetModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nextBudgetDay, nextBudgetDay) ||
                other.nextBudgetDay == nextBudgetDay) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.savings, savings) || other.savings == savings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nextBudgetDay, amount, savings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MonthlyBudgetModelCopyWith<_$_MonthlyBudgetModel> get copyWith =>
      __$$_MonthlyBudgetModelCopyWithImpl<_$_MonthlyBudgetModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MonthlyBudgetModelToJson(
      this,
    );
  }
}

abstract class _MonthlyBudgetModel implements MonthlyBudgetModel {
  const factory _MonthlyBudgetModel(
      {required final BudgetModelId id,
      @JsonKey(fromJson: dateTimeFromMilisecondsSinceEpoch, toJson: dateTimeToMilisecondsSinceEpoch)
          final DateTime? nextBudgetDay,
      final double amount,
      final double savings}) = _$_MonthlyBudgetModel;

  factory _MonthlyBudgetModel.fromJson(Map<String, dynamic> json) =
      _$_MonthlyBudgetModel.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_MonthlyBudgetModelCopyWith<_$_MonthlyBudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyBudgetModel _$WeeklyBudgetModelFromJson(Map<String, dynamic> json) {
  return _WeeklyBudgetModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyBudgetModel {
  BudgetModelId get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @override
  @pragma('vm:prefer-inline')
  $BudgetModelIdCopyWith<$Res> get id {
    return $BudgetModelIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeeklyBudgetModelCopyWith<$Res>
    implements $WeeklyBudgetModelCopyWith<$Res> {
  factory _$$_WeeklyBudgetModelCopyWith(_$_WeeklyBudgetModel value,
          $Res Function(_$_WeeklyBudgetModel) then) =
      __$$_WeeklyBudgetModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BudgetModelId id, double amount});

  @override
  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_WeeklyBudgetModelCopyWithImpl<$Res>
    extends _$WeeklyBudgetModelCopyWithImpl<$Res, _$_WeeklyBudgetModel>
    implements _$$_WeeklyBudgetModelCopyWith<$Res> {
  __$$_WeeklyBudgetModelCopyWithImpl(
      _$_WeeklyBudgetModel _value, $Res Function(_$_WeeklyBudgetModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_$_WeeklyBudgetModel(
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
class _$_WeeklyBudgetModel implements _WeeklyBudgetModel {
  const _$_WeeklyBudgetModel({required this.id, this.amount = 0});

  factory _$_WeeklyBudgetModel.fromJson(Map<String, dynamic> json) =>
      _$$_WeeklyBudgetModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeeklyBudgetModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeeklyBudgetModelCopyWith<_$_WeeklyBudgetModel> get copyWith =>
      __$$_WeeklyBudgetModelCopyWithImpl<_$_WeeklyBudgetModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeeklyBudgetModelToJson(
      this,
    );
  }
}

abstract class _WeeklyBudgetModel implements WeeklyBudgetModel {
  const factory _WeeklyBudgetModel(
      {required final BudgetModelId id,
      final double amount}) = _$_WeeklyBudgetModel;

  factory _WeeklyBudgetModel.fromJson(Map<String, dynamic> json) =
      _$_WeeklyBudgetModel.fromJson;

  @override
  BudgetModelId get id;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_WeeklyBudgetModelCopyWith<_$_WeeklyBudgetModel> get copyWith =>
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

  @JsonKey(ignore: true)
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
abstract class _$$UserModelLocalIdCopyWith<$Res>
    implements $UserModelIdCopyWith<$Res> {
  factory _$$UserModelLocalIdCopyWith(
          _$UserModelLocalId value, $Res Function(_$UserModelLocalId) then) =
      __$$UserModelLocalIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UserModelLocalIdCopyWithImpl<$Res>
    extends _$UserModelIdCopyWithImpl<$Res, _$UserModelLocalId>
    implements _$$UserModelLocalIdCopyWith<$Res> {
  __$$UserModelLocalIdCopyWithImpl(
      _$UserModelLocalId _value, $Res Function(_$UserModelLocalId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UserModelLocalId(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserModelLocalId extends UserModelLocalId {
  const _$UserModelLocalId({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'UserModelId.local(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelLocalId &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelLocalIdCopyWith<_$UserModelLocalId> get copyWith =>
      __$$UserModelLocalIdCopyWithImpl<_$UserModelLocalId>(this, _$identity);

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
      _$UserModelLocalId;
  const UserModelLocalId._() : super._();

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$UserModelLocalIdCopyWith<_$UserModelLocalId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserModelRemoteIdCopyWith<$Res>
    implements $UserModelIdCopyWith<$Res> {
  factory _$$UserModelRemoteIdCopyWith(
          _$UserModelRemoteId value, $Res Function(_$UserModelRemoteId) then) =
      __$$UserModelRemoteIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UserModelRemoteIdCopyWithImpl<$Res>
    extends _$UserModelIdCopyWithImpl<$Res, _$UserModelRemoteId>
    implements _$$UserModelRemoteIdCopyWith<$Res> {
  __$$UserModelRemoteIdCopyWithImpl(
      _$UserModelRemoteId _value, $Res Function(_$UserModelRemoteId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UserModelRemoteId(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserModelRemoteId extends UserModelRemoteId {
  const _$UserModelRemoteId({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'UserModelId.remote(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelRemoteId &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelRemoteIdCopyWith<_$UserModelRemoteId> get copyWith =>
      __$$UserModelRemoteIdCopyWithImpl<_$UserModelRemoteId>(this, _$identity);

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
      _$UserModelRemoteId;
  const UserModelRemoteId._() : super._();

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$UserModelRemoteIdCopyWith<_$UserModelRemoteId> get copyWith =>
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
          UserModelLocalId localId,
      @JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
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

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<$Res> get subscription {
    return $SubscriptionModelCopyWith<$Res>(_value.subscription, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
          UserModelLocalId localId,
      @JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
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
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

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
    return _then(_$_UserModel(
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
class _$_UserModel extends _UserModel {
  const _$_UserModel(
      {@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
          required this.localId,
      @JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
          required this.remoteId,
      required this.createdAt,
      required this.updatedAt,
      required this.subscription,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
          this.locale})
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            const DeepCollectionEquality().equals(other.localId, localId) &&
            const DeepCollectionEquality().equals(other.remoteId, remoteId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(localId),
      const DeepCollectionEquality().hash(remoteId),
      createdAt,
      updatedAt,
      subscription,
      locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {@JsonKey(fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
          required final UserModelLocalId localId,
      @JsonKey(fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
          required final UserModelRemoteId remoteId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final SubscriptionModel subscription,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
          final Locale? locale}) = _$_UserModel;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) {
  return _SubscriptionModel.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionModel {
  int get paidDaysLeft => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_SubscriptionModelCopyWith<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  factory _$$_SubscriptionModelCopyWith(_$_SubscriptionModel value,
          $Res Function(_$_SubscriptionModel) then) =
      __$$_SubscriptionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int paidDaysLeft, DateTime? updatedAt});
}

/// @nodoc
class __$$_SubscriptionModelCopyWithImpl<$Res>
    extends _$SubscriptionModelCopyWithImpl<$Res, _$_SubscriptionModel>
    implements _$$_SubscriptionModelCopyWith<$Res> {
  __$$_SubscriptionModelCopyWithImpl(
      _$_SubscriptionModel _value, $Res Function(_$_SubscriptionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidDaysLeft = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_SubscriptionModel(
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
class _$_SubscriptionModel implements _SubscriptionModel {
  const _$_SubscriptionModel({this.paidDaysLeft = 0, this.updatedAt});

  factory _$_SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriptionModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubscriptionModel &&
            (identical(other.paidDaysLeft, paidDaysLeft) ||
                other.paidDaysLeft == paidDaysLeft) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paidDaysLeft, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscriptionModelCopyWith<_$_SubscriptionModel> get copyWith =>
      __$$_SubscriptionModelCopyWithImpl<_$_SubscriptionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriptionModelToJson(
      this,
    );
  }
}

abstract class _SubscriptionModel implements SubscriptionModel {
  const factory _SubscriptionModel(
      {final int paidDaysLeft,
      final DateTime? updatedAt}) = _$_SubscriptionModel;

  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) =
      _$_SubscriptionModel.fromJson;

  @override
  int get paidDaysLeft;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionModelCopyWith<_$_SubscriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPermissionsModel _$UserPermissionsModelFromJson(Map<String, dynamic> json) {
  return _UserPermissionsModel.fromJson(json);
}

/// @nodoc
mixin _$UserPermissionsModel {
  bool get shouldBeSynced => throw _privateConstructorUsedError;
  int get tagLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_UserPermissionsModelCopyWith<$Res>
    implements $UserPermissionsModelCopyWith<$Res> {
  factory _$$_UserPermissionsModelCopyWith(_$_UserPermissionsModel value,
          $Res Function(_$_UserPermissionsModel) then) =
      __$$_UserPermissionsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool shouldBeSynced, int tagLimit});
}

/// @nodoc
class __$$_UserPermissionsModelCopyWithImpl<$Res>
    extends _$UserPermissionsModelCopyWithImpl<$Res, _$_UserPermissionsModel>
    implements _$$_UserPermissionsModelCopyWith<$Res> {
  __$$_UserPermissionsModelCopyWithImpl(_$_UserPermissionsModel _value,
      $Res Function(_$_UserPermissionsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shouldBeSynced = null,
    Object? tagLimit = null,
  }) {
    return _then(_$_UserPermissionsModel(
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
class _$_UserPermissionsModel implements _UserPermissionsModel {
  const _$_UserPermissionsModel(
      {this.shouldBeSynced = false, this.tagLimit = 5});

  factory _$_UserPermissionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserPermissionsModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPermissionsModel &&
            (identical(other.shouldBeSynced, shouldBeSynced) ||
                other.shouldBeSynced == shouldBeSynced) &&
            (identical(other.tagLimit, tagLimit) ||
                other.tagLimit == tagLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shouldBeSynced, tagLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPermissionsModelCopyWith<_$_UserPermissionsModel> get copyWith =>
      __$$_UserPermissionsModelCopyWithImpl<_$_UserPermissionsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPermissionsModelToJson(
      this,
    );
  }
}

abstract class _UserPermissionsModel implements UserPermissionsModel {
  const factory _UserPermissionsModel(
      {final bool shouldBeSynced,
      final int tagLimit}) = _$_UserPermissionsModel;

  factory _UserPermissionsModel.fromJson(Map<String, dynamic> json) =
      _$_UserPermissionsModel.fromJson;

  @override
  bool get shouldBeSynced;
  @override
  int get tagLimit;
  @override
  @JsonKey(ignore: true)
  _$$_UserPermissionsModelCopyWith<_$_UserPermissionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
