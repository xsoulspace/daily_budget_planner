part of 'monthly_cubit.dart';

@freezed
class MonthlyCubitState with _$MonthlyCubitState {
  const factory MonthlyCubitState({
    @Default(MonthlyBudgetModel.initial) final MonthlyBudgetModel budget,
    @Default(true) final bool isLoading,
  }) = _MonthlyCubitState;
}
