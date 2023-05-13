import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_cubit.freezed.dart';
part 'weekly_cubit_states.dart';

class WeeklyCubitDto {
  WeeklyCubitDto({
    required final BuildContext context,
  }) : localApiServices = context.read<LocalApiServices>();
  final LocalApiServices localApiServices;
}

class WeeklyCubit extends Cubit<WeeklyCubitState> {
  WeeklyCubit({
    required this.dto,
  }) : super(const WeeklyCubitState()) {
    unawaited(onLoad());
  }
  final WeeklyCubitDto dto;
  final dayOfWeek = DateTime.now().weekday;
  final amountController = TextEditingController();
  @override
  Future<void> close() {
    amountController.dispose();
    return super.close();
  }

  late final int daysLeft = 7 - dayOfWeek + 1;
  String get dailyBudget => (state.budget.amount / daysLeft).toString();
  static const BudgetModelId id = BudgetModelId(value: 'monthly_budget');

  Future<void> onLoad() async {
    final budget = await dto.localApiServices.budget.getWeeklyBudget(id);
    amountController.text = budget.amount.toString();
    emit(state.copyWith(budget: budget, isLoading: false));
  }

  void onBudgetChange(final String value) {
    final updatedBudget = state.budget.copyWith(
      amount: double.parse(value),
    );
    emit(state.copyWith(budget: updatedBudget));
    unawaited(dto.localApiServices.budget.upsertWeeklyBudget(updatedBudget));
  }
}
