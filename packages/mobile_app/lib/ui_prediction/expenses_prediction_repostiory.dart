import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/expensess_prediction_models.dart';

class ExpensesPredictionRepository with HasLocalApis {
  static const _regularExpensesKey = 'regular_expenses';
  static const _budgetsKey = 'budgets';
  static const _expensesKey = 'expenses';
  static const _salaryInfoKey = 'salary_info';

  Future<void> saveRegularExpenses(final List<RegularExpense> expenses) async {
    await localDb.setItemsList(
      key: _regularExpensesKey,
      value: expenses,
      toJson: (final e) => e.toJson(),
    );
  }

  Future<List<RegularExpense>> loadRegularExpenses() async {
    final iterable = await localDb.getItemsIterable(
      key: _regularExpensesKey,
      fromJson: RegularExpense.fromJson,
    );
    return iterable.toList();
  }

  Future<void> saveBudgets(final List<Budget> budgets) async {
    await localDb.setItemsList(
      key: _budgetsKey,
      value: budgets,
      toJson: (final b) => b.toJson(),
    );
  }

  Future<List<Budget>> loadBudgets() async {
    final iterable = await localDb.getItemsIterable(
      key: _budgetsKey,
      fromJson: Budget.fromJson,
    );
    return iterable.toList();
  }

  Future<void> saveExpenses(final List<Expense> expenses) async {
    await localDb.setItemsList(
      key: _expensesKey,
      value: expenses,
      toJson: (final e) => e.toJson(),
    );
  }

  Future<List<Expense>> loadExpenses() async {
    final iterable = await localDb.getItemsIterable(
      key: _expensesKey,
      fromJson: Expense.fromJson,
    );
    return iterable.toList();
  }

  Future<void> saveSalaryInfo(final SalaryInfo salaryInfo) async {
    await localDb.setItem(
      key: _salaryInfoKey,
      value: salaryInfo,
      toJson: (final s) => s.toJson(),
    );
  }

  Future<SalaryInfo?> loadSalaryInfo() async => localDb.getItem(
        key: _salaryInfoKey,
        fromJson: SalaryInfo.fromJson,
        defaultValue: null,
      );
}
