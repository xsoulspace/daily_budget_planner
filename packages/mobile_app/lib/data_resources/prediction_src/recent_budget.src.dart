import 'package:mobile_app/common_imports.dart';

@resource
class RecentBudgetResource with ChangeNotifier {
  var _recentBudget = Budget.empty;
}

extension BudgetsResourceX on RecentBudgetResource {
  Budget get recentBudget => _recentBudget;
  void setRecentBudget(final Budget budget) =>
      setState(() => _recentBudget = budget);
}
