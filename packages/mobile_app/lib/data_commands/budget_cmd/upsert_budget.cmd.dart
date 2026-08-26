import 'package:mobile_app/common_imports.dart';

class UpsertBudgetCommand with HasLocalApis, HasResources {
  const UpsertBudgetCommand();
  Future<void> execute(final Budget budget) async {
    await manualBudgetsLocalApi.upsertBudget(budget);
    budgetsResource[budget.id] = budget;
    await const LoadBudgetsCmd().execute();
    await const RecalculateDailyNumberCmd().execute();
  }
}
