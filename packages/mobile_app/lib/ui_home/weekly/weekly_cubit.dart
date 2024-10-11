import 'package:mobile_app/common_imports.dart';

class WeeklyCubit extends ValueNotifier<LoadableContainer<WeeklyBudgetModel>>
    with HasLocalApis {
  WeeklyCubit()
      : super(const LoadableContainer(value: WeeklyBudgetModel.initial));
  final amountFocusNode = FocusNode();
  final amountController = TextEditingController();
  @override
  void dispose() {
    amountController.dispose();
    amountFocusNode.dispose();
    super.dispose();
  }

  WeeklyBudgetModel get budget => value.value;
  final dayOfWeek = DateTime.now().weekday;
  late final int daysLeft = 7 - dayOfWeek + 1;
  String get dailyBudget => (budget.amount / daysLeft).toStringAsFixed(2);
  static const BudgetModelId id = BudgetModelId(value: 'weekly_budget');

  Future<void> onLoad() async {
    final budget = await budgetLocalApi.getWeeklyBudget(id);
    amountController.text = budget.amount.toStringAsFixed(2);
    value = LoadableContainer.loaded(budget);
  }

  void onAmountChange(final String amount) {
    final updatedBudget = budget.copyWith(
      amount: double.tryParse(amount) ?? 0,
    );
    value = value.copyWith(value: updatedBudget);
    unawaited(budgetLocalApi.upsertWeeklyBudget(updatedBudget));
  }
}
