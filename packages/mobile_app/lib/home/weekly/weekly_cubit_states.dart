part of 'weekly_cubit.dart';

@freezed
class WeeklyCubitState with _$WeeklyCubitState {
  const factory WeeklyCubitState({
    @Default(WeeklyBudgetModel.initial) final WeeklyBudgetModel budget,
    @Default(true) final bool isLoading,
  }) = _WeeklyCubitState;
}
