import 'package:mobile_app/data_local_api/local_api_service.dart';
import 'package:mobile_app/foundation/data_api/interfaces/interfaces.dart';
import 'package:mobile_app/foundation/models/models.dart';

class BudgetApiLocalServiceImpl implements BudgetApiService {
  BudgetApiLocalServiceImpl({
    required this.localApi,
  });
  final LocalApiService localApi;
  @override
  Future<MonthlyBudgetModel> getMonthlyBudget(final BudgetModelId id) =>
      localApi.getInstance(
        key: id.value,
        defaultValue: MonthlyBudgetModel(id: id),
        fromJson: (final json) =>
            json.isEmpty ? null : MonthlyBudgetModel.fromJson(json),
      );

  @override
  Future<WeeklyBudgetModel> getWeeklyBudget(final BudgetModelId id) =>
      localApi.getInstance(
        key: id.value,
        defaultValue: WeeklyBudgetModel(id: id),
        fromJson: (final json) =>
            json.isEmpty ? null : WeeklyBudgetModel.fromJson(json),
      );

  @override
  Future<void> upsertMonthlyBudget(
    final MonthlyBudgetModel model,
  ) =>
      localApi.setInstance(
        key: model.id.value,
        value: model,
        toJson: (final instance) => instance.toJson(),
      );

  @override
  Future<void> upsertWeeklyBudget(final WeeklyBudgetModel model) =>
      localApi.setInstance(
        key: model.id.value,
        value: model,
        toJson: (final instance) => instance.toJson(),
      );
}
