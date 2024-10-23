import 'package:flutter/foundation.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';
import 'package:mobile_app/ui_prediction/wip/expenses_prediction_service.dart';

class ExpensesPredictionNotifier extends ChangeNotifier {
  ExpensesPredictionNotifier(this._service);

  final ExpensesPredictionService _service;

  List<Expense> regularExpenses = [];
  List<Budget> budgets = [];
  List<Expense> expenses = [];
  Income? salaryInfo;
  double averageDailyBudget = 0;
  double averageDailyExpense = 0;
  PredictionType budgetPrediction = PredictionType.neutral;
  PredictionType expensesPrediction = PredictionType.neutral;
  Period currentPeriod = Period.daily;
  void addRegularExpense(final Expense expense) {
    regularExpenses.add(expense);
    _recalculate();
  }

  void removeRegularExpense(final Expense expense) {
    regularExpenses.remove(expense);
    _recalculate();
  }

  void updateRegularExpenses(final List<Expense> newExpenses) {
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

  void updateSalaryInfo(final Income newSalaryInfo) {
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
