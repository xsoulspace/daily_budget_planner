import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/wip/expensess_prediction_models.dart';

part 'ui_prediction_notifier.freezed.dart';

@freezed
class UiPredictionState with _$UiPredictionState {
  const factory UiPredictionState({
    @Default([]) final List<Expense> expenses,
    @Default([]) final List<Budget> budgets,
    @Default([]) final List<IncomeInfo> incomes,
    @Default(0) final double expensesSum,
    @Default(0) final double regularExpensesSum,
    @Default(0) final double incomesSum,
    @Default(0) final double regularIncomesSum,

    /// is difference between regularIncomesSum + regularExpensesSum,
    /// divided by quantity of days left in the period setted in
    /// the income date.
    @Default(0) final double dailyBudget,

    /// date of the income, when most of regular incomes are expected.
    final DateTime? incomeDate,
  }) = _UiPredictionState;
}

class UiPredictionNotifier extends ValueNotifier<UiPredictionState>
    with HasLocalApis {
  UiPredictionNotifier() : super(const UiPredictionState());

  Future<void> onLoad() async {
    value = UiPredictionState();
    _recalculateExpenses();
    _recalculateIncomes();
  }

  // TODO(arenukvern): make dependent from period
  double getExpensePredictionFor(final DateTime date) => 0;
  // TODO(arenukvern): make dependent from period
  double getExpenseFor(final DateTime date) => calculateTotalExpense(
        date,
        date.add(1.days),
      );

  /// Calculates the total expense as the difference between all budgets
  /// for the given dates.
  ///
  /// [startDate] and [endDate] are used to filter the budgets within the
  /// specified period.
  /// The total expense is calculated by summing up the amounts of all
  /// budgets within this period.
  ///
  /// Returns the total expense as a double value.
  double calculateTotalExpense(
    final DateTime startDate,
    final DateTime endDate,
  ) {
    final budgetsInPeriod = value.budgets
        .where(
          (final budget) =>
              budget.date.isAfter(startDate) && budget.date.isBefore(endDate),
        )
        .toList();

    return budgetsInPeriod.fold(
      0,
      (final sum, final budget) => sum + budget.amount,
    );
  }

  Budget get recentBudget {
    if (value.budgets.isEmpty) return Budget.empty;
    return value.budgets.first;
  }

  Future<void> upsertBudget(
    final Budget budget, {
    final bool isNew = false,
  }) async {
    final budgetIndex =
        value.budgets.indexWhere((final b) => b.id == budget.id);
    if (budgetIndex == -1) {
      value = value.copyWith(budgets: [...value.budgets, budget]);
    } else {
      final newBudgets = [...value.budgets]..[budgetIndex] = budget;
      value = value.copyWith(budgets: newBudgets);
    }
    // await budgetLocalApi.upsertBudget(budget);
  }

  Future<void> upsertExpense(final Expense expense) async {
    // await expensesLocalApi.upsertRegularExpense(expense);
    final expenseIndex =
        value.expenses.indexWhere((final e) => e.id == expense.id);
    if (expenseIndex == -1) {
      value = value.copyWith(expenses: [...value.expenses, expense]);
    } else {
      final newExpenses = [...value.expenses]..[expenseIndex] = expense;
      value = value.copyWith(expenses: newExpenses);
    }
    _recalculateExpenses();
  }

  void _recalculateExpenses() {
    _setExpensesSum();
    _setRegularExpensesSum();
  }

  void _recalculateIncomes() {
    _setIncomesSum();
    _setRegularIncomesSum();
  }

  Future<void> upsertIncome(final IncomeInfo income) async {
    // await incomesLocalApi.upsertIncome(income);
    final incomeIndex =
        value.incomes.indexWhere((final i) => i.id == income.id);
    if (incomeIndex == -1) {
      value = value.copyWith(incomes: [...value.incomes, income]);
    } else {
      final newIncomes = [...value.incomes]..[incomeIndex] = income;
      value = value.copyWith(incomes: newIncomes);
    }
    _recalculateIncomes();
  }

  void _setExpensesSum() {
    final double sum = value.expenses
        .fold(0, (final sum, final expense) => sum + expense.amount);
    value = value.copyWith(expensesSum: sum);
  }

  void _setRegularExpensesSum() {
    final double sum = value.expenses
        .where((final expense) => expense.isRegular)
        .fold(0, (final sum, final expense) => sum + expense.amount);
    value = value.copyWith(regularExpensesSum: sum);
  }

  void _setIncomesSum() {
    final double sum =
        value.incomes.fold(0, (final sum, final income) => sum + income.amount);
    value = value.copyWith(incomesSum: sum);
  }

  void _setRegularIncomesSum() {
    final double sum = value.incomes
        .where((final income) => income.isRegular)
        .fold(0, (final sum, final income) => sum + income.amount);
    value = value.copyWith(regularIncomesSum: sum);
  }
}
