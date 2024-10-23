// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_prediction_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UiPredictionState {
  List<Expense> get expenses => throw _privateConstructorUsedError;
  List<Budget> get budgets => throw _privateConstructorUsedError;
  List<Income> get incomes => throw _privateConstructorUsedError;
  double get expensesSum => throw _privateConstructorUsedError;
  double get regularExpensesSum => throw _privateConstructorUsedError;
  double get incomesSum => throw _privateConstructorUsedError;
  double get regularIncomesSum => throw _privateConstructorUsedError;

  /// is difference between regularIncomesSum + regularExpensesSum,
  /// divided by quantity of days left in the period setted in
  /// the income date.
  double get dailyBudget => throw _privateConstructorUsedError;

  /// date of the income, when most of regular incomes are expected.
  DateTime? get incomeDate => throw _privateConstructorUsedError;

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UiPredictionStateCopyWith<UiPredictionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiPredictionStateCopyWith<$Res> {
  factory $UiPredictionStateCopyWith(
          UiPredictionState value, $Res Function(UiPredictionState) then) =
      _$UiPredictionStateCopyWithImpl<$Res, UiPredictionState>;
  @useResult
  $Res call(
      {List<Expense> expenses,
      List<Budget> budgets,
      List<Income> incomes,
      double expensesSum,
      double regularExpensesSum,
      double incomesSum,
      double regularIncomesSum,
      double dailyBudget,
      DateTime? incomeDate});
}

/// @nodoc
class _$UiPredictionStateCopyWithImpl<$Res, $Val extends UiPredictionState>
    implements $UiPredictionStateCopyWith<$Res> {
  _$UiPredictionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? budgets = null,
    Object? incomes = null,
    Object? expensesSum = null,
    Object? regularExpensesSum = null,
    Object? incomesSum = null,
    Object? regularIncomesSum = null,
    Object? dailyBudget = null,
    Object? incomeDate = freezed,
  }) {
    return _then(_value.copyWith(
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      budgets: null == budgets
          ? _value.budgets
          : budgets // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      incomes: null == incomes
          ? _value.incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<Income>,
      expensesSum: null == expensesSum
          ? _value.expensesSum
          : expensesSum // ignore: cast_nullable_to_non_nullable
              as double,
      regularExpensesSum: null == regularExpensesSum
          ? _value.regularExpensesSum
          : regularExpensesSum // ignore: cast_nullable_to_non_nullable
              as double,
      incomesSum: null == incomesSum
          ? _value.incomesSum
          : incomesSum // ignore: cast_nullable_to_non_nullable
              as double,
      regularIncomesSum: null == regularIncomesSum
          ? _value.regularIncomesSum
          : regularIncomesSum // ignore: cast_nullable_to_non_nullable
              as double,
      dailyBudget: null == dailyBudget
          ? _value.dailyBudget
          : dailyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      incomeDate: freezed == incomeDate
          ? _value.incomeDate
          : incomeDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UiPredictionStateImplCopyWith<$Res>
    implements $UiPredictionStateCopyWith<$Res> {
  factory _$$UiPredictionStateImplCopyWith(_$UiPredictionStateImpl value,
          $Res Function(_$UiPredictionStateImpl) then) =
      __$$UiPredictionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Expense> expenses,
      List<Budget> budgets,
      List<Income> incomes,
      double expensesSum,
      double regularExpensesSum,
      double incomesSum,
      double regularIncomesSum,
      double dailyBudget,
      DateTime? incomeDate});
}

/// @nodoc
class __$$UiPredictionStateImplCopyWithImpl<$Res>
    extends _$UiPredictionStateCopyWithImpl<$Res, _$UiPredictionStateImpl>
    implements _$$UiPredictionStateImplCopyWith<$Res> {
  __$$UiPredictionStateImplCopyWithImpl(_$UiPredictionStateImpl _value,
      $Res Function(_$UiPredictionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? budgets = null,
    Object? incomes = null,
    Object? expensesSum = null,
    Object? regularExpensesSum = null,
    Object? incomesSum = null,
    Object? regularIncomesSum = null,
    Object? dailyBudget = null,
    Object? incomeDate = freezed,
  }) {
    return _then(_$UiPredictionStateImpl(
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      budgets: null == budgets
          ? _value._budgets
          : budgets // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      incomes: null == incomes
          ? _value._incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<Income>,
      expensesSum: null == expensesSum
          ? _value.expensesSum
          : expensesSum // ignore: cast_nullable_to_non_nullable
              as double,
      regularExpensesSum: null == regularExpensesSum
          ? _value.regularExpensesSum
          : regularExpensesSum // ignore: cast_nullable_to_non_nullable
              as double,
      incomesSum: null == incomesSum
          ? _value.incomesSum
          : incomesSum // ignore: cast_nullable_to_non_nullable
              as double,
      regularIncomesSum: null == regularIncomesSum
          ? _value.regularIncomesSum
          : regularIncomesSum // ignore: cast_nullable_to_non_nullable
              as double,
      dailyBudget: null == dailyBudget
          ? _value.dailyBudget
          : dailyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      incomeDate: freezed == incomeDate
          ? _value.incomeDate
          : incomeDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$UiPredictionStateImpl implements _UiPredictionState {
  const _$UiPredictionStateImpl(
      {final List<Expense> expenses = const [],
      final List<Budget> budgets = const [],
      final List<Income> incomes = const [],
      this.expensesSum = 0,
      this.regularExpensesSum = 0,
      this.incomesSum = 0,
      this.regularIncomesSum = 0,
      this.dailyBudget = 0,
      this.incomeDate})
      : _expenses = expenses,
        _budgets = budgets,
        _incomes = incomes;

  final List<Expense> _expenses;
  @override
  @JsonKey()
  List<Expense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<Budget> _budgets;
  @override
  @JsonKey()
  List<Budget> get budgets {
    if (_budgets is EqualUnmodifiableListView) return _budgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgets);
  }

  final List<Income> _incomes;
  @override
  @JsonKey()
  List<Income> get incomes {
    if (_incomes is EqualUnmodifiableListView) return _incomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomes);
  }

  @override
  @JsonKey()
  final double expensesSum;
  @override
  @JsonKey()
  final double regularExpensesSum;
  @override
  @JsonKey()
  final double incomesSum;
  @override
  @JsonKey()
  final double regularIncomesSum;

  /// is difference between regularIncomesSum + regularExpensesSum,
  /// divided by quantity of days left in the period setted in
  /// the income date.
  @override
  @JsonKey()
  final double dailyBudget;

  /// date of the income, when most of regular incomes are expected.
  @override
  final DateTime? incomeDate;

  @override
  String toString() {
    return 'UiPredictionState(expenses: $expenses, budgets: $budgets, incomes: $incomes, expensesSum: $expensesSum, regularExpensesSum: $regularExpensesSum, incomesSum: $incomesSum, regularIncomesSum: $regularIncomesSum, dailyBudget: $dailyBudget, incomeDate: $incomeDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiPredictionStateImpl &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._budgets, _budgets) &&
            const DeepCollectionEquality().equals(other._incomes, _incomes) &&
            (identical(other.expensesSum, expensesSum) ||
                other.expensesSum == expensesSum) &&
            (identical(other.regularExpensesSum, regularExpensesSum) ||
                other.regularExpensesSum == regularExpensesSum) &&
            (identical(other.incomesSum, incomesSum) ||
                other.incomesSum == incomesSum) &&
            (identical(other.regularIncomesSum, regularIncomesSum) ||
                other.regularIncomesSum == regularIncomesSum) &&
            (identical(other.dailyBudget, dailyBudget) ||
                other.dailyBudget == dailyBudget) &&
            (identical(other.incomeDate, incomeDate) ||
                other.incomeDate == incomeDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_budgets),
      const DeepCollectionEquality().hash(_incomes),
      expensesSum,
      regularExpensesSum,
      incomesSum,
      regularIncomesSum,
      dailyBudget,
      incomeDate);

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UiPredictionStateImplCopyWith<_$UiPredictionStateImpl> get copyWith =>
      __$$UiPredictionStateImplCopyWithImpl<_$UiPredictionStateImpl>(
          this, _$identity);
}

abstract class _UiPredictionState implements UiPredictionState {
  const factory _UiPredictionState(
      {final List<Expense> expenses,
      final List<Budget> budgets,
      final List<Income> incomes,
      final double expensesSum,
      final double regularExpensesSum,
      final double incomesSum,
      final double regularIncomesSum,
      final double dailyBudget,
      final DateTime? incomeDate}) = _$UiPredictionStateImpl;

  @override
  List<Expense> get expenses;
  @override
  List<Budget> get budgets;
  @override
  List<Income> get incomes;
  @override
  double get expensesSum;
  @override
  double get regularExpensesSum;
  @override
  double get incomesSum;
  @override
  double get regularIncomesSum;

  /// is difference between regularIncomesSum + regularExpensesSum,
  /// divided by quantity of days left in the period setted in
  /// the income date.
  @override
  double get dailyBudget;

  /// date of the income, when most of regular incomes are expected.
  @override
  DateTime? get incomeDate;

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UiPredictionStateImplCopyWith<_$UiPredictionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
