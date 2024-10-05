import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';

part 'monthly_cubit.freezed.dart';

@freezed
class MonthlyCubitState with _$MonthlyCubitState {
  const factory MonthlyCubitState({
    @Default(MonthlyBudgetModel.initial) final MonthlyBudgetModel budget,
    @Default(true) final bool isLoading,
  }) = _MonthlyCubitState;
}

class MonthlyCubitDto {
  MonthlyCubitDto({
    required final BuildContext context,
  }) : localApiServices = context.read<LocalApiServices>();
  final LocalApiServices localApiServices;
}

class MonthlyCubit extends ValueNotifier<MonthlyCubitState> {
  MonthlyCubit({
    required this.dto,
  }) : super(const MonthlyCubitState()) {
    unawaited(onLoad());
  }
  final MonthlyCubitDto dto;
  final amountController = TextEditingController();
  final savingsController = TextEditingController();
  final amountFocusNode = FocusNode();
  final savingsFocusNode = FocusNode();

  @override
  void dispose() {
    savingsController.dispose();
    amountFocusNode.dispose();
    savingsFocusNode.dispose();
    super.dispose();
  }

  static const BudgetModelId id = BudgetModelId(value: 'monthly_budget');
  Future<void> onLoad() async {
    final budget = await dto.localApiServices.budget.getMonthlyBudget(id);
    amountController.text = budget.amount.toString();
    savingsController.text = budget.savings.toString();
    value = value.copyWith(budget: budget, isLoading: false);
  }

  void onAmountChange(final String amount) {
    final updatedBudget = value.budget.copyWith(
      amount: doubleFromJson(amount),
    );
    value = value.copyWith(budget: updatedBudget);
    unawaited(dto.localApiServices.budget.upsertMonthlyBudget(updatedBudget));
  }

  void onSavingsChange(final String savings) {
    final updatedBudget = value.budget.copyWith(
      savings: doubleFromJson(savings),
    );
    value = value.copyWith(budget: updatedBudget);
    unawaited(dto.localApiServices.budget.upsertMonthlyBudget(updatedBudget));
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
    final nextBudgetDay = value.budget.nextBudgetDay;
    if (nextBudgetDay == null) return 1;
    final range = DateTimeRange(start: today, end: nextBudgetDay);
    return range.duration.inDays + 2;
  }

  double get dailyBudgetNum =>
      (value.budget.amount - value.budget.savings) / daysCount;
  String get dailyBudget => dailyBudgetNum.toStringAsFixed(2);

  Future<void> onChangeNextBudgetDay(final BuildContext context) async {
    final datetime = await showDatePicker(
      context: context,
      initialDate: value.budget.nextBudgetDay ??
          today.add(Duration(days: daysLeftInThisWeek)),
      firstDate: today,
      lastDate: today.add(const Duration(days: 80)),
    );
    if (datetime == null) return;
    final updatedBudget = value.budget.copyWith(nextBudgetDay: datetime);
    value = value.copyWith(budget: updatedBudget);
    unawaited(dto.localApiServices.budget.upsertMonthlyBudget(updatedBudget));
  }
}
