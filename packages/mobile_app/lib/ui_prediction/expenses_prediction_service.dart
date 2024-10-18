import 'package:mobile_app/ui_prediction/expensess_prediction_models.dart';

class ExpensesPredictionService {
  double calculateAverageDailyBudget(
    final List<Budget> budgets,
    final Period period,
  ) {
    if (budgets.isEmpty) return 0;
    final double totalBudget =
        budgets.fold(0, (final sum, final budget) => sum + budget.amount);
    final days = _getDaysInPeriod(period);
    return totalBudget / days;
  }

  double calculateAverageDailyExpense(
    final List<Expense> expenses,
    final Period period,
  ) {
    if (expenses.isEmpty) return 0;
    final double totalExpense =
        expenses.fold(0, (final sum, final expense) => sum + expense.amount);
    final days = _getDaysInPeriod(period);
    return totalExpense / days;
  }

  PredictionType predictBudgetTrend(
    final List<Budget> budgets,
    final Period period,
  ) {
    if (budgets.length < 2) return PredictionType.neutral;
    final recentBudgets = _getRecentData(
      data: budgets,
      period: period,
      datetimeFromItem: (final b) => b.date,
    );
    return _calculateTrend(recentBudgets.map((final b) => b.amount).toList());
  }

  PredictionType predictExpensesTrend(
    final List<Expense> expenses,
    final Period period,
  ) {
    if (expenses.length < 2) return PredictionType.neutral;
    final recentExpenses = _getRecentData(
      data: expenses,
      period: period,
      datetimeFromItem: (final e) => e.date,
    );
    return _calculateTrend(recentExpenses.map((final e) => e.amount).toList());
  }

  int _getDaysInPeriod(final Period period) {
    switch (period) {
      case Period.daily:
        return 1;
      case Period.weekly:
        return 7;
      case Period.monthly:
        return 30;
      case Period.yearly:
        return 365;
    }
  }

  List<T> _getRecentData<T>({
    required final Iterable<T> data,
    required final Period period,
    required final DateTime Function(T) datetimeFromItem,
  }) {
    final now = DateTime.now();
    final periodStart = now.subtract(Duration(days: _getDaysInPeriod(period)));
    return data
        .where((final item) => datetimeFromItem(item).isAfter(periodStart))
        .toList();
  }

  PredictionType _calculateTrend(final List<double> values) {
    if (values.length < 2) return PredictionType.neutral;
    final diff = values.last - values.first;
    if (diff > 0) return PredictionType.positive;
    if (diff < 0) return PredictionType.negative;
    return PredictionType.neutral;
  }
}
