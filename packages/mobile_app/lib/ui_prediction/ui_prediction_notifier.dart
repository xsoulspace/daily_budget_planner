import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';

part 'ui_prediction_notifier.freezed.dart';

/// balance = expenses + income
/// for example:
/// if expense = -150, income = 50
/// balance = -150 + 50 = -100
typedef ExpenseTotalTuple = ({double balance, double expense, double income});

@freezed
class UiPredictionState with _$UiPredictionState {
  const factory UiPredictionState({
    @Default([]) final List<Transaction> expenses,
    @Default([]) final List<Budget> budgets,
    @Default([]) final List<Transaction> incomes,
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
  ExpenseTotalTuple getExpenseFor(final DateTime date) => calculateTotalExpense(
        date.subtract(1.days),
        date,
      );

  /// Calculates the total expense as the difference between all budgets
  /// for the given dates.
  ///
  /// [startDate] and [endDate] are used to filter the budgets within the
  /// specified period.
  /// The total expense is calculated by summing up the amounts of all
  /// budgets within this period.
  ///
  /// Returns the total expense as a tuple with balance, expense, and income.
  ExpenseTotalTuple calculateTotalExpense(
    final DateTime startDate,
    final DateTime endDate,
  ) {
    final dayEnd = endDate.dayEnd;
    final maxStartDate = startDate.dayStart.subtract(const Duration(days: 31));

    final relevantBudgets = value.budgets
        .where(
          (final budget) =>
              budget.date.isBefore(dayEnd) || budget.date == dayEnd,
        )
        .toList()
      ..sort((final a, final b) => b.date.compareTo(a.date));
    if (relevantBudgets.isEmpty) return (balance: 0, expense: 0, income: 0);

    final DateTime effectiveStartDate;
    final closestBudgets = relevantBudgets
        .where((final budget) => !budget.date.isAfter(startDate.dayEnd));
    // Find the budget closest to startDate.dayEnd
    final Budget closestBudget;
    if (closestBudgets.isEmpty) {
      closestBudget = Budget(date: startDate.dayEnd);
    } else if (closestBudgets.length == 1) {
      closestBudget = closestBudgets.first;
    } else {
      closestBudget = closestBudgets.reduce((final a, final b) {
        final aDiff = a.date.difference(startDate.dayEnd).abs();
        final bDiff = b.date.difference(startDate.dayEnd).abs();
        return aDiff < bDiff ? a : b;
      });
    }
    effectiveStartDate = closestBudget.date;

    // Remove all budgets before the closest one
    relevantBudgets.removeWhere(
      (final budget) => budget.date.isBefore(effectiveStartDate),
    );

    if (relevantBudgets.isEmpty ||
        relevantBudgets.lastOrNull?.date.isAfter(effectiveStartDate) == true) {
      final olderBudget = value.budgets.lastWhereOrNull(
        (final budget) =>
            budget.date.isBefore(effectiveStartDate) &&
            budget.date.isAfter(maxStartDate),
      );
      if (olderBudget != null) {
        relevantBudgets.add(olderBudget);
      }
    }

    relevantBudgets.sort((final a, final b) => a.date.compareTo(b.date));
    if (relevantBudgets.isEmpty) return (balance: 0, expense: 0, income: 0);
    if (relevantBudgets.length == 1) {
      final budget = relevantBudgets.first;
      if (budget.date.isBefore(effectiveStartDate) ||
          budget.date == effectiveStartDate) {
        return (
          balance: budget.amount,
          expense: 0,
          income: 0,
        );
      }
      return (
        balance: budget.amount,
        expense: 0,
        income: budget.amount,
      );
    }

    double expense = 0;
    double income = 0;
    double previousAmount = relevantBudgets.first.amount;

    for (int i = 1; i < relevantBudgets.length; i++) {
      final difference = relevantBudgets[i].amount - previousAmount;
      if (difference < 0) {
        expense += difference.abs();
      } else {
        income += difference;
      }
      previousAmount = relevantBudgets[i].amount;
    }

    // If the period starts after the last budget, consider it as an expense
    if (startDate.isAfter(relevantBudgets.last.date)) {
      expense += relevantBudgets.last.amount;
    }

    return (
      balance: relevantBudgets.last.amount,
      expense: expense,
      income: income,
    );
  }

  Budget get recentBudget {
    if (value.budgets.isEmpty) return Budget.empty;
    return value.budgets.first;
  }

  Future<void> removeBudget(final BudgetId budgetId) async {
    final newBudgets =
        value.budgets.where((final b) => b.id != budgetId).toList();
    value = value.copyWith(budgets: newBudgets);
  }

  Future<void> upsertBudget(
    final Budget budget, {
    final bool isNew = false,
  }) async {
    final budgetIndex =
        value.budgets.indexWhere((final b) => b.id == budget.id);
    if (budgetIndex == -1) {
      final updatedBudgets = [...value.budgets, budget]
        ..sort((final a, final b) => b.date.compareTo(a.date));
      value = value.copyWith(budgets: updatedBudgets);
    } else {
      final newBudgets = [...value.budgets]
        ..[budgetIndex] = budget
        ..sort((final a, final b) => b.date.compareTo(a.date));
      value = value.copyWith(budgets: newBudgets);
    }
    // await budgetLocalApi.upsertBudget(budget);
  }

  Future<void> upsertTransaction(final Transaction transaction) async {
    // await expensesLocalApi.upsertRegularExpense(expense);
    switch (transaction.type) {
      case TransactionType.expense:
        value = value.copyWith(
          expenses: value.expenses.upsert(
            transaction,
            predicate: (final e) => e.id == transaction.id,
          ),
        );
        _recalculateExpenses();
      case TransactionType.income:
        value = value.copyWith(
          incomes: value.incomes.upsert(
            transaction,
            predicate: (final e) => e.id == transaction.id,
          ),
        );
        _recalculateIncomes();
      case TransactionType.transfer:
      // TODO(arenukvern): implement
    }
  }

  void _recalculateExpenses() {
    _setExpensesSum();
    _setRegularExpensesSum();
  }

  void _recalculateIncomes() {
    _setIncomesSum();
    _setRegularIncomesSum();
  }

  Future<void> upsertIncome(final Transaction income) async {
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

/// Extension on [DateTime] to provide a method for getting the
/// date without time.
extension DateTimeWithoutTime on DateTime {
  /// Returns a new [DateTime] instance with the same date but time
  /// set to midnight.
  ///
  /// This is useful for comparing dates without considering the time component.
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2023, 5, 15, 14, 30);
  /// final dateOnly = dateTime.withoutTime; // DateTime(2023, 5, 15, 0, 0, 0, 0)
  /// ```
  DateTime get dayStart => DateTime(year, month, day);
  DateTime get dayEnd => DateTime(year, month, day, 23, 59, 59, 999);
}

extension ListUpsertX<T> on List<T> {
  /// Helper method to upsert an item in a list
  List<T> upsert(
    final T item, {
    required final bool Function(T) predicate,
  }) {
    final index = indexWhere(predicate);
    if (index == -1) {
      return [...this, item];
    } else {
      return [...this]..[index] = item;
    }
  }
}
