import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_cubit.freezed.dart';
part 'monthly_cubit_states.dart';

class MonthlyCubitDto {
  MonthlyCubitDto({
    required final BuildContext context,
  }) : localApiServices = context.read<LocalApiServices>();
  final LocalApiServices localApiServices;
}

class MonthlyCubit extends Cubit<MonthlyCubitState> {
  MonthlyCubit({
    required this.dto,
  }) : super(const MonthlyCubitState()) {
    unawaited(onLoad());
  }
  final MonthlyCubitDto dto;
  final amountController = TextEditingController();
  static const BudgetModelId id = BudgetModelId(value: 'monthly_budget');
  Future<void> onLoad() async {
    final budget = await dto.localApiServices.budget.getMonthlyBudget(id);
    amountController.text = budget.amount.toString();
    emit(state.copyWith(budget: budget, isLoading: false));
  }

  void onAmountChange(final String value) {
    final updatedBudget = state.budget.copyWith(
      amount: double.tryParse(value) ?? 0,
    );
    emit(state.copyWith(budget: updatedBudget));
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
    final nextBudgetDay = state.budget.nextBudgetDay;
    if (nextBudgetDay == null) return 1;
    final range = DateTimeRange(start: today, end: nextBudgetDay);
    return range.duration.inDays + 2;
  }

  double get dailyBudgetNum => state.budget.amount / daysCount;
  String get dailyBudget => dailyBudgetNum.toStringAsFixed(2);

  Future<void> onChangeNextBudgetDay(final BuildContext context) async {
    final datetime = await showDatePicker(
      context: context,
      initialDate: state.budget.nextBudgetDay ??
          today.add(Duration(days: daysLeftInThisWeek)),
      firstDate: today,
      lastDate: today.add(const Duration(days: 80)),
    );
    if (datetime == null) return;
    final updatedBudget = state.budget.copyWith(nextBudgetDay: datetime);
    emit(state.copyWith(budget: updatedBudget));
    unawaited(dto.localApiServices.budget.upsertMonthlyBudget(updatedBudget));
  }
}
