// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expensess_prediction_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return _Budget.fromJson(json);
}

/// @nodoc
mixin _$Budget {
  DateTime get date => throw _privateConstructorUsedError;
  BudgetId get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this Budget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetCopyWith<Budget> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCopyWith<$Res> {
  factory $BudgetCopyWith(Budget value, $Res Function(Budget) then) =
      _$BudgetCopyWithImpl<$Res, Budget>;
  @useResult
  $Res call({DateTime date, BudgetId id, double amount});
}

/// @nodoc
class _$BudgetCopyWithImpl<$Res, $Val extends Budget>
    implements $BudgetCopyWith<$Res> {
  _$BudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetImplCopyWith<$Res> implements $BudgetCopyWith<$Res> {
  factory _$$BudgetImplCopyWith(
          _$BudgetImpl value, $Res Function(_$BudgetImpl) then) =
      __$$BudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, BudgetId id, double amount});
}

/// @nodoc
class __$$BudgetImplCopyWithImpl<$Res>
    extends _$BudgetCopyWithImpl<$Res, _$BudgetImpl>
    implements _$$BudgetImplCopyWith<$Res> {
  __$$BudgetImplCopyWithImpl(
      _$BudgetImpl _value, $Res Function(_$BudgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_$BudgetImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetImpl implements _Budget {
  const _$BudgetImpl(
      {required this.date, this.id = BudgetId.empty, this.amount = 0});

  factory _$BudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final BudgetId id;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'Budget(date: $date, id: $id, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, id, amount);

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      __$$BudgetImplCopyWithImpl<_$BudgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetImplToJson(
      this,
    );
  }
}

abstract class _Budget implements Budget {
  const factory _Budget(
      {required final DateTime date,
      final BudgetId id,
      final double amount}) = _$BudgetImpl;

  factory _Budget.fromJson(Map<String, dynamic> json) = _$BudgetImpl.fromJson;

  @override
  DateTime get date;
  @override
  BudgetId get id;
  @override
  double get amount;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return _Expense.fromJson(json);
}

/// @nodoc
mixin _$Expense {
  DateTime get date => throw _privateConstructorUsedError;
  TransactionId get id => throw _privateConstructorUsedError;
  ExpenseCategoryId get category => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  Period? get period => throw _privateConstructorUsedError;

  /// Serializes this Expense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res, Expense>;
  @useResult
  $Res call(
      {DateTime date,
      TransactionId id,
      ExpenseCategoryId category,
      double amount,
      Period? period});
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res, $Val extends Expense>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? id = null,
    Object? category = null,
    Object? amount = null,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TransactionId,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategoryId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseImplCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$$ExpenseImplCopyWith(
          _$ExpenseImpl value, $Res Function(_$ExpenseImpl) then) =
      __$$ExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      TransactionId id,
      ExpenseCategoryId category,
      double amount,
      Period? period});
}

/// @nodoc
class __$$ExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseCopyWithImpl<$Res, _$ExpenseImpl>
    implements _$$ExpenseImplCopyWith<$Res> {
  __$$ExpenseImplCopyWithImpl(
      _$ExpenseImpl _value, $Res Function(_$ExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? id = null,
    Object? category = null,
    Object? amount = null,
    Object? period = freezed,
  }) {
    return _then(_$ExpenseImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TransactionId,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategoryId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseImpl extends _Expense {
  const _$ExpenseImpl(
      {required this.date,
      this.id = TransactionId.empty,
      this.category = ExpenseCategoryId.empty,
      this.amount = 0,
      this.period})
      : super._();

  factory _$ExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final TransactionId id;
  @override
  @JsonKey()
  final ExpenseCategoryId category;
  @override
  @JsonKey()
  final double amount;
  @override
  final Period? period;

  @override
  String toString() {
    return 'Expense(date: $date, id: $id, category: $category, amount: $amount, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, id, category, amount, period);

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      __$$ExpenseImplCopyWithImpl<_$ExpenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseImplToJson(
      this,
    );
  }
}

abstract class _Expense extends Expense {
  const factory _Expense(
      {required final DateTime date,
      final TransactionId id,
      final ExpenseCategoryId category,
      final double amount,
      final Period? period}) = _$ExpenseImpl;
  const _Expense._() : super._();

  factory _Expense.fromJson(Map<String, dynamic> json) = _$ExpenseImpl.fromJson;

  @override
  DateTime get date;
  @override
  TransactionId get id;
  @override
  ExpenseCategoryId get category;
  @override
  double get amount;
  @override
  Period? get period;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IncomeInfo _$IncomeInfoFromJson(Map<String, dynamic> json) {
  return _IncomeInfo.fromJson(json);
}

/// @nodoc
mixin _$IncomeInfo {
  DateTime get date => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  TransactionId get id => throw _privateConstructorUsedError;
  IncomeCategoryId get category => throw _privateConstructorUsedError;
  Period? get period => throw _privateConstructorUsedError;

  /// Serializes this IncomeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IncomeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IncomeInfoCopyWith<IncomeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeInfoCopyWith<$Res> {
  factory $IncomeInfoCopyWith(
          IncomeInfo value, $Res Function(IncomeInfo) then) =
      _$IncomeInfoCopyWithImpl<$Res, IncomeInfo>;
  @useResult
  $Res call(
      {DateTime date,
      double amount,
      TransactionId id,
      IncomeCategoryId category,
      Period? period});
}

/// @nodoc
class _$IncomeInfoCopyWithImpl<$Res, $Val extends IncomeInfo>
    implements $IncomeInfoCopyWith<$Res> {
  _$IncomeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncomeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? id = null,
    Object? category = null,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TransactionId,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as IncomeCategoryId,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeInfoImplCopyWith<$Res>
    implements $IncomeInfoCopyWith<$Res> {
  factory _$$IncomeInfoImplCopyWith(
          _$IncomeInfoImpl value, $Res Function(_$IncomeInfoImpl) then) =
      __$$IncomeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double amount,
      TransactionId id,
      IncomeCategoryId category,
      Period? period});
}

/// @nodoc
class __$$IncomeInfoImplCopyWithImpl<$Res>
    extends _$IncomeInfoCopyWithImpl<$Res, _$IncomeInfoImpl>
    implements _$$IncomeInfoImplCopyWith<$Res> {
  __$$IncomeInfoImplCopyWithImpl(
      _$IncomeInfoImpl _value, $Res Function(_$IncomeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of IncomeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? id = null,
    Object? category = null,
    Object? period = freezed,
  }) {
    return _then(_$IncomeInfoImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TransactionId,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as IncomeCategoryId,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeInfoImpl extends _IncomeInfo {
  const _$IncomeInfoImpl(
      {required this.date,
      this.amount = 0,
      this.id = TransactionId.empty,
      this.category = IncomeCategoryId.empty,
      this.period})
      : super._();

  factory _$IncomeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeInfoImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final TransactionId id;
  @override
  @JsonKey()
  final IncomeCategoryId category;
  @override
  final Period? period;

  @override
  String toString() {
    return 'IncomeInfo(date: $date, amount: $amount, id: $id, category: $category, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeInfoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, amount, id, category, period);

  /// Create a copy of IncomeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeInfoImplCopyWith<_$IncomeInfoImpl> get copyWith =>
      __$$IncomeInfoImplCopyWithImpl<_$IncomeInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeInfoImplToJson(
      this,
    );
  }
}

abstract class _IncomeInfo extends IncomeInfo {
  const factory _IncomeInfo(
      {required final DateTime date,
      final double amount,
      final TransactionId id,
      final IncomeCategoryId category,
      final Period? period}) = _$IncomeInfoImpl;
  const _IncomeInfo._() : super._();

  factory _IncomeInfo.fromJson(Map<String, dynamic> json) =
      _$IncomeInfoImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get amount;
  @override
  TransactionId get id;
  @override
  IncomeCategoryId get category;
  @override
  Period? get period;

  /// Create a copy of IncomeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomeInfoImplCopyWith<_$IncomeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
