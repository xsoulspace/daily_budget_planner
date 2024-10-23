// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../transaction_models.dart';

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

  /// in smallest currency unit
  double get amount => throw _privateConstructorUsedError;
  CurrencyType get currency => throw _privateConstructorUsedError;

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
  $Res call({DateTime date, BudgetId id, double amount, CurrencyType currency});
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
    Object? currency = null,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
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
  $Res call({DateTime date, BudgetId id, double amount, CurrencyType currency});
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
    Object? currency = null,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetImpl implements _Budget {
  const _$BudgetImpl(
      {required this.date,
      this.id = BudgetId.empty,
      this.amount = 0,
      this.currency = CurrencyType.empty});

  factory _$BudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final BudgetId id;

  /// in smallest currency unit
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final CurrencyType currency;

  @override
  String toString() {
    return 'Budget(date: $date, id: $id, amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, id, amount, currency);

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
      final double amount,
      final CurrencyType currency}) = _$BudgetImpl;

  factory _Budget.fromJson(Map<String, dynamic> json) = _$BudgetImpl.fromJson;

  @override
  DateTime get date;
  @override
  BudgetId get id;

  /// in smallest currency unit
  @override
  double get amount;
  @override
  CurrencyType get currency;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'expense':
      return Expense.fromJson(json);
    case 'income':
      return Income.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Transaction',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Transaction {
  DateTime get date => throw _privateConstructorUsedError;
  TransactionId get id => throw _privateConstructorUsedError;
  Object? get category => throw _privateConstructorUsedError;

  /// in smallest currency unit
  double get amount => throw _privateConstructorUsedError;
  CurrencyType get currency => throw _privateConstructorUsedError;
  TransactionPeriodType? get periodType => throw _privateConstructorUsedError;
  Period? get period => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)
        expense,
    required TResult Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)
        income,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        expense,
    TResult? Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        income,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        expense,
    TResult Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        income,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expense value) expense,
    required TResult Function(Income value) income,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Expense value)? expense,
    TResult? Function(Income value)? income,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expense value)? expense,
    TResult Function(Income value)? income,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {DateTime date,
      TransactionId id,
      double amount,
      CurrencyType currency,
      TransactionPeriodType? periodType,
      Period? period});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? id = null,
    Object? amount = null,
    Object? currency = null,
    Object? periodType = freezed,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
      periodType: freezed == periodType
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as TransactionPeriodType?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$ExpenseImplCopyWith(
          _$ExpenseImpl value, $Res Function(_$ExpenseImpl) then) =
      __$$ExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      TransactionId id,
      TransactionCategoryId category,
      double amount,
      CurrencyType currency,
      TransactionPeriodType? periodType,
      Period? period});
}

/// @nodoc
class __$$ExpenseImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$ExpenseImpl>
    implements _$$ExpenseImplCopyWith<$Res> {
  __$$ExpenseImplCopyWithImpl(
      _$ExpenseImpl _value, $Res Function(_$ExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? id = null,
    Object? category = null,
    Object? amount = null,
    Object? currency = null,
    Object? periodType = freezed,
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
              as TransactionCategoryId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
      periodType: freezed == periodType
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as TransactionPeriodType?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseImpl extends Expense {
  const _$ExpenseImpl(
      {required this.date,
      this.id = TransactionId.empty,
      this.category = TransactionCategoryId.empty,
      this.amount = 0,
      this.currency = CurrencyType.empty,
      this.periodType,
      this.period,
      final String? $type})
      : $type = $type ?? 'expense',
        super._();

  factory _$ExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final TransactionId id;
  @override
  @JsonKey()
  final TransactionCategoryId category;

  /// in smallest currency unit
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final CurrencyType currency;
  @override
  final TransactionPeriodType? periodType;
  @override
  final Period? period;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Transaction.expense(date: $date, id: $id, category: $category, amount: $amount, currency: $currency, periodType: $periodType, period: $period)';
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
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.periodType, periodType) ||
                other.periodType == periodType) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, id, category, amount, currency, periodType, period);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      __$$ExpenseImplCopyWithImpl<_$ExpenseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)
        expense,
    required TResult Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)
        income,
  }) {
    return expense(date, id, category, amount, currency, periodType, period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        expense,
    TResult? Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        income,
  }) {
    return expense?.call(
        date, id, category, amount, currency, periodType, period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        expense,
    TResult Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        income,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense(date, id, category, amount, currency, periodType, period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expense value) expense,
    required TResult Function(Income value) income,
  }) {
    return expense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Expense value)? expense,
    TResult? Function(Income value)? income,
  }) {
    return expense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expense value)? expense,
    TResult Function(Income value)? income,
    required TResult orElse(),
  }) {
    if (expense != null) {
      return expense(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseImplToJson(
      this,
    );
  }
}

abstract class Expense extends Transaction {
  const factory Expense(
      {required final DateTime date,
      final TransactionId id,
      final TransactionCategoryId category,
      final double amount,
      final CurrencyType currency,
      final TransactionPeriodType? periodType,
      final Period? period}) = _$ExpenseImpl;
  const Expense._() : super._();

  factory Expense.fromJson(Map<String, dynamic> json) = _$ExpenseImpl.fromJson;

  @override
  DateTime get date;
  @override
  TransactionId get id;
  @override
  TransactionCategoryId get category;

  /// in smallest currency unit
  @override
  double get amount;
  @override
  CurrencyType get currency;
  @override
  TransactionPeriodType? get periodType;
  @override
  Period? get period;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncomeImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$IncomeImplCopyWith(
          _$IncomeImpl value, $Res Function(_$IncomeImpl) then) =
      __$$IncomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double amount,
      TransactionId id,
      IncomeCategoryId category,
      CurrencyType currency,
      TransactionPeriodType? periodType,
      Period? period});
}

/// @nodoc
class __$$IncomeImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$IncomeImpl>
    implements _$$IncomeImplCopyWith<$Res> {
  __$$IncomeImplCopyWithImpl(
      _$IncomeImpl _value, $Res Function(_$IncomeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? id = null,
    Object? category = null,
    Object? currency = null,
    Object? periodType = freezed,
    Object? period = freezed,
  }) {
    return _then(_$IncomeImpl(
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
      periodType: freezed == periodType
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as TransactionPeriodType?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeImpl extends Income {
  const _$IncomeImpl(
      {required this.date,
      this.amount = 0,
      this.id = TransactionId.empty,
      this.category = IncomeCategoryId.empty,
      this.currency = CurrencyType.empty,
      this.periodType,
      this.period,
      final String? $type})
      : $type = $type ?? 'income',
        super._();

  factory _$IncomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeImplFromJson(json);

  @override
  final DateTime date;

  /// in smallest currency unit
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
  @JsonKey()
  final CurrencyType currency;
  @override
  final TransactionPeriodType? periodType;
  @override
  final Period? period;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Transaction.income(date: $date, amount: $amount, id: $id, category: $category, currency: $currency, periodType: $periodType, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.periodType, periodType) ||
                other.periodType == periodType) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, amount, id, category, currency, periodType, period);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeImplCopyWith<_$IncomeImpl> get copyWith =>
      __$$IncomeImplCopyWithImpl<_$IncomeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)
        expense,
    required TResult Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)
        income,
  }) {
    return income(date, amount, id, category, currency, periodType, period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        expense,
    TResult? Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        income,
  }) {
    return income?.call(
        date, amount, id, category, currency, periodType, period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime date,
            TransactionId id,
            TransactionCategoryId category,
            double amount,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        expense,
    TResult Function(
            DateTime date,
            double amount,
            TransactionId id,
            IncomeCategoryId category,
            CurrencyType currency,
            TransactionPeriodType? periodType,
            Period? period)?
        income,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(date, amount, id, category, currency, periodType, period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expense value) expense,
    required TResult Function(Income value) income,
  }) {
    return income(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Expense value)? expense,
    TResult? Function(Income value)? income,
  }) {
    return income?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expense value)? expense,
    TResult Function(Income value)? income,
    required TResult orElse(),
  }) {
    if (income != null) {
      return income(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeImplToJson(
      this,
    );
  }
}

abstract class Income extends Transaction {
  const factory Income(
      {required final DateTime date,
      final double amount,
      final TransactionId id,
      final IncomeCategoryId category,
      final CurrencyType currency,
      final TransactionPeriodType? periodType,
      final Period? period}) = _$IncomeImpl;
  const Income._() : super._();

  factory Income.fromJson(Map<String, dynamic> json) = _$IncomeImpl.fromJson;

  @override
  DateTime get date;

  /// in smallest currency unit
  @override
  double get amount;
  @override
  TransactionId get id;
  @override
  IncomeCategoryId get category;
  @override
  CurrencyType get currency;
  @override
  TransactionPeriodType? get periodType;
  @override
  Period? get period;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomeImplCopyWith<_$IncomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
