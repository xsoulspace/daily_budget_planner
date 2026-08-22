import 'package:mobile_app/common_imports.dart';

/// is difference between regularIncomesSum + regularExpensesSum,
/// divided by quantity of days left in the period setted in
/// the income date.
@resource
class DailyBudgetResource extends ValueNotifier<double> {
  DailyBudgetResource() : super(0);
}
