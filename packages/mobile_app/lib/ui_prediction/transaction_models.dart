import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_models.freezed.dart';
part 'transaction_models.g.dart';

enum Period { daily, weekly, monthly, yearly }

enum PredictionType { positive, negative, neutral }

extension type const BudgetId(String value) {
  factory BudgetId.fromJson(final String value) => BudgetId(value);
  static const empty = BudgetId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

enum TransactionType {
  @JsonValue('expense')
  expense,
  @JsonValue('income')
  income;
}

extension type const TransactionId(String value) {
  factory TransactionId.fromJson(final String value) => TransactionId(value);
  static const empty = TransactionId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

extension type const TransactionCategoryId(String value) {
  factory TransactionCategoryId.fromJson(final String value) =>
      TransactionCategoryId(value);
  static const empty = TransactionCategoryId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

enum TransactionPeriodType {
  /// every 25th day of the month
  bySpecificDate,

  /// every week on monday, everyday
  ///
  /// take inspiration from clock.
  byDayOfWeek,

  /// every 3th working day of the end of the month
  /// or every 3th working day of the quarter
  byComputedDate,
}

extension type const IncomeCategoryId(String value) {
  factory IncomeCategoryId.fromJson(final String value) =>
      IncomeCategoryId(value);
  static const empty = IncomeCategoryId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

extension type const CurrencyType(String value) {
  factory CurrencyType.fromJson(final String value) => CurrencyType(value);
  static const empty = CurrencyType('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

@freezed
class Budget with _$Budget {
  const factory Budget({
    required final DateTime date,
    @Default(BudgetId.empty) final BudgetId id,

    /// in smallest currency unit
    @Default(0) final double amount,
    @Default(CurrencyType.empty) final CurrencyType currency,
  }) = _Budget;

  factory Budget.fromJson(final Map<String, dynamic> json) =>
      _$BudgetFromJson(json);

  static final empty = Budget(
    date: DateTime.now(),
  );
}

@Freezed()
sealed class Transaction with _$Transaction {
  const factory Transaction({
    required final DateTime date,
    @Default(TransactionId.empty) final TransactionId id,
    @Default(TransactionCategoryId.empty) final TransactionCategoryId category,
    @Default('') final String description,

    /// in smallest currency unit
    @Default(0) final double amount,
    @Default(CurrencyType.empty) final CurrencyType currency,
    @Default(TransactionType.expense) final TransactionType type,
    final TransactionPeriodType? periodType,
    final Period? period,
  }) = _Transaction;

  const Transaction._();

  factory Transaction.fromJson(final Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  bool get isExpense => type == TransactionType.expense;
  bool get isIncome => type == TransactionType.income;
  bool get isRegular => period != null;
  double get value => amount;
}
