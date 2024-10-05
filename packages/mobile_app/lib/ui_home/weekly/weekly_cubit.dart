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
  final amountFocusNode = FocusNode();
  final amountController = TextEditingController();
  @override
  Future<void> close() {
    amountController.dispose();
    amountFocusNode.dispose();
    return super.close();
  }

  final dayOfWeek = DateTime.now().weekday;
  late final int daysLeft = 7 - dayOfWeek + 1;
  String get dailyBudget => (state.budget.amount / daysLeft).toStringAsFixed(2);
  static const BudgetModelId id = BudgetModelId(value: 'weekly_budget');

  Future<void> onLoad() async {
    final budget = await dto.localApiServices.budget.getWeeklyBudget(id);
    amountController.text = budget.amount.toStringAsFixed(2);
    emit(state.copyWith(budget: budget, isLoading: false));
  }

  void onAmountChange(final String value) {
    final updatedBudget = state.budget.copyWith(
      amount: double.tryParse(value) ?? 0,
    );
    emit(state.copyWith(budget: updatedBudget));
    unawaited(dto.localApiServices.budget.upsertWeeklyBudget(updatedBudget));
  }
}
