import 'package:freezed_annotation/freezed_annotation.dart';

part 'expensess_prediction_models.freezed.dart';
part 'expensess_prediction_models.g.dart';

enum Period { daily, weekly, monthly, yearly }

enum PredictionType { positive, negative, neutral }

@freezed
class RegularExpense with _$RegularExpense {
  const factory RegularExpense({
    required final double amount,
    required final String category,
    required final Period period,
  }) = _RegularExpense;

  factory RegularExpense.fromJson(final Map<String, dynamic> json) =>
      _$RegularExpenseFromJson(json);
}

@freezed
class Budget with _$Budget {
  const factory Budget({
    required final double amount,
    required final DateTime date,
  }) = _Budget;

  factory Budget.fromJson(final Map<String, dynamic> json) =>
      _$BudgetFromJson(json);
}

@freezed
class Expense with _$Expense {
  const factory Expense({
    required final double amount,
    required final DateTime date,
    final String? category,
  }) = _Expense;

  factory Expense.fromJson(final Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}

@freezed
class SalaryInfo with _$SalaryInfo {
  const factory SalaryInfo({
    required final double amount,
    required final DateTime date,
  }) = _SalaryInfo;

  factory SalaryInfo.fromJson(final Map<String, dynamic> json) =>
      _$SalaryInfoFromJson(json);
}
