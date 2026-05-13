import 'package:mobile_app/data_local_api/budget_storage_bridge.dart';
import 'package:mobile_app/data_models/data_models.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

/// Local API for budget data backed by [StorageKernel] via [BudgetStorageBridge].
class BudgetLocalApi {
  BudgetLocalApi({
    required final LocalDbI localDb,
    required final StorageKernel storageKernel,
    final StorageNamespace budgetNamespace = _defaultBudgetNamespace,
  }) : _kernelBudgetStore = BudgetStorageBridge(
          localDb: localDb,
          storageKernel: storageKernel,
          budgetNamespace: budgetNamespace,
        );

  final BudgetStorageBridge _kernelBudgetStore;

  static const _defaultBudgetNamespace = StorageNamespace('budget');

  Future<MonthlyBudgetModel> getMonthlyBudget(final BudgetModelId id) async {
    final json = await _kernelBudgetStore.readBudget(
      legacyKey: id.value,
      kernelPath: _monthlyBudgetPath(id),
    );
    if (json.isEmpty) return MonthlyBudgetModel(id: id);
    return MonthlyBudgetModel.fromJson(json);
  }

  Future<WeeklyBudgetModel> getWeeklyBudget(final BudgetModelId id) async {
    final json = await _kernelBudgetStore.readBudget(
      legacyKey: id.value,
      kernelPath: _weeklyBudgetPath(id),
    );
    if (json.isEmpty) return WeeklyBudgetModel(id: id);
    return WeeklyBudgetModel.fromJson(json);
  }

  Future<void> upsertMonthlyBudget(final MonthlyBudgetModel model) =>
      _kernelBudgetStore.writeBudget(
        legacyKey: model.id.value,
        kernelPath: _monthlyBudgetPath(model.id),
        value: model.toJson(),
      );

  Future<void> upsertWeeklyBudget(final WeeklyBudgetModel model) =>
      _kernelBudgetStore.writeBudget(
        legacyKey: model.id.value,
        kernelPath: _weeklyBudgetPath(model.id),
        value: model.toJson(),
      );

  static String _monthlyBudgetPath(final BudgetModelId id) =>
      'monthly/${id.value}.json';
  static String _weeklyBudgetPath(final BudgetModelId id) =>
      'weekly/${id.value}.json';
}
