import 'package:freezed_annotation/freezed_annotation.dart';

part 'expensess_prediction_models.freezed.dart';
part 'expensess_prediction_models.g.dart';

enum Period { daily, weekly, monthly, yearly }

enum PredictionType { positive, negative, neutral }

extension type const BudgetId(String value) {
  factory BudgetId.fromJson(final String value) => BudgetId(value);
  static const empty = BudgetId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

extension type const TransactionId(String value) {
  factory TransactionId.fromJson(final String value) => TransactionId(value);
  static const empty = TransactionId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

extension type const ExpenseCategoryId(String value) {
  factory ExpenseCategoryId.fromJson(final String value) =>
      ExpenseCategoryId(value);
  static const empty = ExpenseCategoryId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

extension type const IncomeCategoryId(String value) {
  factory IncomeCategoryId.fromJson(final String value) =>
      IncomeCategoryId(value);
  static const empty = IncomeCategoryId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

@freezed
class Budget with _$Budget {
  const factory Budget({
    required final DateTime date,
    @Default(BudgetId.empty) final BudgetId id,
    @Default(0) final double amount,
  }) = _Budget;

  factory Budget.fromJson(final Map<String, dynamic> json) =>
      _$BudgetFromJson(json);

  static final empty = Budget(
    date: DateTime.now(),
  );
}

@freezed
class Expense with _$Expense {
  const factory Expense({
    required final DateTime date,
    @Default(TransactionId.empty) final TransactionId id,
    @Default(ExpenseCategoryId.empty) final ExpenseCategoryId category,
    @Default(0) final double amount,
    final Period? period,
  }) = _Expense;

  factory Expense.fromJson(final Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
  const Expense._();
  bool get isRegular => period != null;
}

@freezed
class IncomeInfo with _$IncomeInfo {
  const factory IncomeInfo({
    required final DateTime date,
    @Default(0) final double amount,
    @Default(TransactionId.empty) final TransactionId id,
    @Default(IncomeCategoryId.empty) final IncomeCategoryId category,
    final Period? period,
  }) = _IncomeInfo;

  factory IncomeInfo.fromJson(final Map<String, dynamic> json) =>
      _$IncomeInfoFromJson(json);
  const IncomeInfo._();
  bool get isRegular => period != null;
}
