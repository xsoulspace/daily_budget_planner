// ignore_for_file: invalid_annotation_target

part of '../models.dart';

@Freezed(fromJson: false, toJson: false)
class BudgetModelId with _$BudgetModelId {
  const factory BudgetModelId({
    required final String value,
  }) = _BudgetModelId;
  const BudgetModelId._();
  factory BudgetModelId.fromJson(final String value) =>
      BudgetModelId(value: value);
  factory BudgetModelId.create() => BudgetModelId(value: IdCreator.create());
  String toJson() => value;
}

@freezed
class MonthlyBudgetModel with _$MonthlyBudgetModel {
  const factory MonthlyBudgetModel({
    required final BudgetModelId id,
    @JsonKey(
      fromJson: dateTimeFromMilisecondsSinceEpoch,
      toJson: dateTimeToMilisecondsSinceEpoch,
    )
        final DateTime? nextBudgetDay,
    @Default(0)
        final double amount,
  }) = _MonthlyBudgetModel;
  factory MonthlyBudgetModel.fromJson(final Map<String, dynamic> json) =>
      _$MonthlyBudgetModelFromJson(json);
  factory MonthlyBudgetModel.create() => MonthlyBudgetModel(
        nextBudgetDay: DateTime.now().add(const Duration(days: 30)),
        id: BudgetModelId.create(),
      );
  static const initial = MonthlyBudgetModel(
    id: BudgetModelId(value: ''),
  );
}

@freezed
class WeeklyBudgetModel with _$WeeklyBudgetModel {
  const factory WeeklyBudgetModel({
    required final BudgetModelId id,
    @Default(0) final double amount,
  }) = _WeeklyBudgetModel;
  factory WeeklyBudgetModel.fromJson(final Map<String, dynamic> json) =>
      _$WeeklyBudgetModelFromJson(json);
  factory WeeklyBudgetModel.create() => WeeklyBudgetModel(
        id: BudgetModelId.create(),
      );
  static const initial = WeeklyBudgetModel(
    id: BudgetModelId(value: ''),
  );
}
