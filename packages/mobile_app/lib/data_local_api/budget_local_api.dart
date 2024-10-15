import 'package:mobile_app/common_imports.dart';

class BudgetLocalApi with HasLocalApis {
  Future<MonthlyBudgetModel> getMonthlyBudget(final BudgetModelId id) =>
      localDb.getItem(
        key: id.value,
        defaultValue: MonthlyBudgetModel(id: id),
        fromJson: (final json) =>
            json.isEmpty ? null : MonthlyBudgetModel.fromJson(json),
      );

  Future<WeeklyBudgetModel> getWeeklyBudget(final BudgetModelId id) =>
      localDb.getItem(
        key: id.value,
        defaultValue: WeeklyBudgetModel(id: id),
        fromJson: (final json) =>
            json.isEmpty ? null : WeeklyBudgetModel.fromJson(json),
      );

  Future<void> upsertMonthlyBudget(
    final MonthlyBudgetModel model,
  ) =>
      localDb.setItem(
        key: model.id.value,
        value: model,
        toJson: (final instance) => instance.toJson(),
      );

  Future<void> upsertWeeklyBudget(final WeeklyBudgetModel model) =>
      localDb.setItem(
        key: model.id.value,
        value: model,
        toJson: (final instance) => instance.toJson(),
      );
}
