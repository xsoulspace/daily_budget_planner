import 'package:flutter/foundation.dart';
import 'package:mobile_app/ui_prediction/wip/expenses_prediction_service.dart';
import 'package:mobile_app/ui_prediction/wip/expensess_prediction_models.dart';

class ExpensesPredictionNotifier extends ChangeNotifier {
  ExpensesPredictionNotifier(this._service);

  final ExpensesPredictionService _service;

  List<RegularExpense> regularExpenses = [];
  List<Budget> budgets = [];
  List<Expense> expenses = [];
  SalaryInfo? salaryInfo;
  double averageDailyBudget = 0;
  double averageDailyExpense = 0;
  PredictionType budgetPrediction = PredictionType.neutral;
  PredictionType expensesPrediction = PredictionType.neutral;
  Period currentPeriod = Period.daily;
  void addRegularExpense(final RegularExpense expense) {
    regularExpenses.add(expense);
    _recalculate();
  }

  void removeRegularExpense(final RegularExpense expense) {
    regularExpenses.remove(expense);
    _recalculate();
  }

  void updateRegularExpenses(final List<RegularExpense> newExpenses) {
    regularExpenses = newExpenses;
    _recalculate();
  }

  void updateBudgets(final List<Budget> newBudgets) {
    budgets = newBudgets;
    _recalculate();
  }

  void updateExpenses(final List<Expense> newExpenses) {
    expenses = newExpenses;
    _recalculate();
  }

  void updateSalaryInfo(final SalaryInfo newSalaryInfo) {
    salaryInfo = newSalaryInfo;
    _recalculate();
  }

  void changePeriod(final Period newPeriod) {
    currentPeriod = newPeriod;
    _recalculate();
  }

  void _recalculate() {
    _calculateAverages();
    _predictTrends();
    notifyListeners();
  }

  void _calculateAverages() {
    averageDailyBudget =
        _service.calculateAverageDailyBudget(budgets, currentPeriod);
    averageDailyExpense =
        _service.calculateAverageDailyExpense(expenses, currentPeriod);
  }

  void _predictTrends() {
    budgetPrediction = _service.predictBudgetTrend(budgets, currentPeriod);
    expensesPrediction = _service.predictExpensesTrend(expenses, currentPeriod);
  }
}
