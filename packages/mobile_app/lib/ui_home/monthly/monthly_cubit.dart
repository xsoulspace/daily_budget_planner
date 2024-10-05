import 'package:mobile_app/common_imports.dart';

class MonthlyCubit extends ValueNotifier<LoadableContainer<MonthlyBudgetModel>>
    with HasLocalApis {
  MonthlyCubit()
      : super(const LoadableContainer(value: MonthlyBudgetModel.initial)) {
    unawaited(onLoad());
  }
  final amountController = TextEditingController();
  final savingsController = TextEditingController();
  final amountFocusNode = FocusNode();
  final savingsFocusNode = FocusNode();
  MonthlyBudgetModel get budget => value.value;

  @override
  void dispose() {
    savingsController.dispose();
    amountFocusNode.dispose();
    savingsFocusNode.dispose();
    super.dispose();
  }

  static const id = BudgetModelId(value: 'monthly_budget');
  Future<void> onLoad() async {
    final budget = await budgetLocalApi.getMonthlyBudget(id);
    amountController.text = budget.amount.toString();
    savingsController.text = budget.savings.toString();
    value = LoadableContainer.loaded(budget);
  }

  void onAmountChange(final String amount) {
    final updatedBudget = budget.copyWith(
      amount: doubleFromJson(amount),
    );
    value = value.copyWith(value: updatedBudget);
    unawaited(budgetLocalApi.upsertMonthlyBudget(updatedBudget));
  }

  void onSavingsChange(final String savings) {
    final updatedBudget = budget.copyWith(
      savings: doubleFromJson(savings),
    );
    value = value.copyWith(value: updatedBudget);
    unawaited(budgetLocalApi.upsertMonthlyBudget(updatedBudget));
  }

  final today = DateTime.now();
  late final dayOfWeek = today.weekday;
  late final int daysLeftInThisWeek = 7 - dayOfWeek + 1;

  String get weeklyBudget {
    if (daysCount >= 7) {
      return (dailyBudgetNum * 7).toStringAsFixed(2);
    }
    return (dailyBudgetNum * daysCount).toStringAsFixed(2);
  }

  double get thisWeekBudget => 0;
  // int get daysLeftThisWeek => ;
  int get daysCount {
    final nextBudgetDay = budget.nextBudgetDay;
    if (nextBudgetDay == null) return 1;
    final range = DateTimeRange(start: today, end: nextBudgetDay);
    return range.duration.inDays + 2;
  }

  double get dailyBudgetNum => (budget.amount - budget.savings) / daysCount;
  String get dailyBudget => dailyBudgetNum.toStringAsFixed(2);

  Future<void> onChangeNextBudgetDay(final BuildContext context) async {
    final datetime = await showDatePicker(
      context: context,
      initialDate:
          budget.nextBudgetDay ?? today.add(Duration(days: daysLeftInThisWeek)),
      firstDate: today,
      lastDate: today.add(const Duration(days: 80)),
    );
    if (datetime == null) return;
    final updatedBudget = budget.copyWith(nextBudgetDay: datetime);
    value = value.copyWith(value: updatedBudget);
    unawaited(budgetLocalApi.upsertMonthlyBudget(updatedBudget));
  }
}
