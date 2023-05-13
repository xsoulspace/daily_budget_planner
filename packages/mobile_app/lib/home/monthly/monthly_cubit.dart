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
  static const BudgetModelId id = BudgetModelId(value: 'monthly_budget');
  Future<void> onLoad() async {
    final budget = await dto.localApiServices.budget.getMonthlyBudget(id);
    emit(state.copyWith(budget: budget, isLoading: false));
  }

  void onBudgetChange(final String value) {
    emit(
      state.copyWith(
        budget: state.budget.copyWith(
          amount: double.parse(value),
        ),
      ),
    );
  }
}
