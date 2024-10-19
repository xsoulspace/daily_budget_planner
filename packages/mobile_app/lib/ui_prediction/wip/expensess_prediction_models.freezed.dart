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

RegularExpense _$RegularExpenseFromJson(Map<String, dynamic> json) {
  return _RegularExpense.fromJson(json);
}

/// @nodoc
mixin _$RegularExpense {
  double get amount => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  Period get period => throw _privateConstructorUsedError;

  /// Serializes this RegularExpense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegularExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegularExpenseCopyWith<RegularExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegularExpenseCopyWith<$Res> {
  factory $RegularExpenseCopyWith(
          RegularExpense value, $Res Function(RegularExpense) then) =
      _$RegularExpenseCopyWithImpl<$Res, RegularExpense>;
  @useResult
  $Res call({double amount, String category, Period period});
}

/// @nodoc
class _$RegularExpenseCopyWithImpl<$Res, $Val extends RegularExpense>
    implements $RegularExpenseCopyWith<$Res> {
  _$RegularExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegularExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? category = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegularExpenseImplCopyWith<$Res>
    implements $RegularExpenseCopyWith<$Res> {
  factory _$$RegularExpenseImplCopyWith(_$RegularExpenseImpl value,
          $Res Function(_$RegularExpenseImpl) then) =
      __$$RegularExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String category, Period period});
}

/// @nodoc
class __$$RegularExpenseImplCopyWithImpl<$Res>
    extends _$RegularExpenseCopyWithImpl<$Res, _$RegularExpenseImpl>
    implements _$$RegularExpenseImplCopyWith<$Res> {
  __$$RegularExpenseImplCopyWithImpl(
      _$RegularExpenseImpl _value, $Res Function(_$RegularExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegularExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? category = null,
    Object? period = null,
  }) {
    return _then(_$RegularExpenseImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegularExpenseImpl implements _RegularExpense {
  const _$RegularExpenseImpl(
      {required this.amount, required this.category, required this.period});

  factory _$RegularExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegularExpenseImplFromJson(json);

  @override
  final double amount;
  @override
  final String category;
  @override
  final Period period;

  @override
  String toString() {
    return 'RegularExpense(amount: $amount, category: $category, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegularExpenseImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, category, period);

  /// Create a copy of RegularExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegularExpenseImplCopyWith<_$RegularExpenseImpl> get copyWith =>
      __$$RegularExpenseImplCopyWithImpl<_$RegularExpenseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegularExpenseImplToJson(
      this,
    );
  }
}

abstract class _RegularExpense implements RegularExpense {
  const factory _RegularExpense(
      {required final double amount,
      required final String category,
      required final Period period}) = _$RegularExpenseImpl;

  factory _RegularExpense.fromJson(Map<String, dynamic> json) =
      _$RegularExpenseImpl.fromJson;

  @override
  double get amount;
  @override
  String get category;
  @override
  Period get period;

  /// Create a copy of RegularExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegularExpenseImplCopyWith<_$RegularExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return _Budget.fromJson(json);
}

/// @nodoc
mixin _$Budget {
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

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
  $Res call({double amount, DateTime date});
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
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  $Res call({double amount, DateTime date});
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
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$BudgetImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetImpl implements _Budget {
  const _$BudgetImpl({required this.amount, required this.date});

  factory _$BudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetImplFromJson(json);

  @override
  final double amount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Budget(amount: $amount, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, date);

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
      {required final double amount,
      required final DateTime date}) = _$BudgetImpl;

  factory _Budget.fromJson(Map<String, dynamic> json) = _$BudgetImpl.fromJson;

  @override
  double get amount;
  @override
  DateTime get date;

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
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

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
  $Res call({double amount, DateTime date, String? category});
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
    Object? amount = null,
    Object? date = null,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({double amount, DateTime date, String? category});
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
    Object? amount = null,
    Object? date = null,
    Object? category = freezed,
  }) {
    return _then(_$ExpenseImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseImpl implements _Expense {
  const _$ExpenseImpl(
      {required this.amount, required this.date, this.category});

  factory _$ExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseImplFromJson(json);

  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final String? category;

  @override
  String toString() {
    return 'Expense(amount: $amount, date: $date, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, date, category);

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

abstract class _Expense implements Expense {
  const factory _Expense(
      {required final double amount,
      required final DateTime date,
      final String? category}) = _$ExpenseImpl;

  factory _Expense.fromJson(Map<String, dynamic> json) = _$ExpenseImpl.fromJson;

  @override
  double get amount;
  @override
  DateTime get date;
  @override
  String? get category;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalaryInfo _$SalaryInfoFromJson(Map<String, dynamic> json) {
  return _SalaryInfo.fromJson(json);
}

/// @nodoc
mixin _$SalaryInfo {
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this SalaryInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalaryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalaryInfoCopyWith<SalaryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryInfoCopyWith<$Res> {
  factory $SalaryInfoCopyWith(
          SalaryInfo value, $Res Function(SalaryInfo) then) =
      _$SalaryInfoCopyWithImpl<$Res, SalaryInfo>;
  @useResult
  $Res call({double amount, DateTime date});
}

/// @nodoc
class _$SalaryInfoCopyWithImpl<$Res, $Val extends SalaryInfo>
    implements $SalaryInfoCopyWith<$Res> {
  _$SalaryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalaryInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryInfoImplCopyWith<$Res>
    implements $SalaryInfoCopyWith<$Res> {
  factory _$$SalaryInfoImplCopyWith(
          _$SalaryInfoImpl value, $Res Function(_$SalaryInfoImpl) then) =
      __$$SalaryInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, DateTime date});
}

/// @nodoc
class __$$SalaryInfoImplCopyWithImpl<$Res>
    extends _$SalaryInfoCopyWithImpl<$Res, _$SalaryInfoImpl>
    implements _$$SalaryInfoImplCopyWith<$Res> {
  __$$SalaryInfoImplCopyWithImpl(
      _$SalaryInfoImpl _value, $Res Function(_$SalaryInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalaryInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$SalaryInfoImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryInfoImpl implements _SalaryInfo {
  const _$SalaryInfoImpl({required this.amount, required this.date});

  factory _$SalaryInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryInfoImplFromJson(json);

  @override
  final double amount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'SalaryInfo(amount: $amount, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryInfoImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, date);

  /// Create a copy of SalaryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryInfoImplCopyWith<_$SalaryInfoImpl> get copyWith =>
      __$$SalaryInfoImplCopyWithImpl<_$SalaryInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryInfoImplToJson(
      this,
    );
  }
}

abstract class _SalaryInfo implements SalaryInfo {
  const factory _SalaryInfo(
      {required final double amount,
      required final DateTime date}) = _$SalaryInfoImpl;

  factory _SalaryInfo.fromJson(Map<String, dynamic> json) =
      _$SalaryInfoImpl.fromJson;

  @override
  double get amount;
  @override
  DateTime get date;

  /// Create a copy of SalaryInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalaryInfoImplCopyWith<_$SalaryInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
