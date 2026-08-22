import 'package:mobile_app/common_imports.dart';

@resource
class BudgetsResource extends OrderedMapNotifier<BudgetId, Budget> {
  BudgetsResource() : super(toKey: (final budget) => budget.id);
}
