import '../../models/models.dart';

abstract interface class BudgetApiService {
  Future<void> upsertMonthlyBudget(
    final MonthlyBudgetModel model,
  );
  Future<MonthlyBudgetModel> getMonthlyBudget(final BudgetModelId id);

  Future<void> upsertWeeklyBudget(
    final WeeklyBudgetModel model,
  );
  Future<WeeklyBudgetModel> getWeeklyBudget(final BudgetModelId id);
}
