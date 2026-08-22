// ignore_for_file: invalid_annotation_target

part of 'data_models.dart';

@Freezed(fromJson: false, toJson: false)
abstract class BudgetModelId with _$BudgetModelId {
  const factory BudgetModelId({required final String value}) = _BudgetModelId;
  const BudgetModelId._();
  factory BudgetModelId.fromJson(final String value) =>
      BudgetModelId(value: value);
  factory BudgetModelId.create() => BudgetModelId(value: IdCreator.create());
  String toJson() => value;
}

@freezed
abstract class MonthlyBudgetModel with _$MonthlyBudgetModel {
  const factory MonthlyBudgetModel({
    required final BudgetModelId id,
    @JsonKey(
      fromJson: dateTimeFromMillisecondsSinceEpoch,
      toJson: dateTimeToMillisecondsSinceEpoch,
    )
    final DateTime? nextBudgetDay,
    @Default(0) final double amount,
    @Default(0) final double savings,
  }) = _MonthlyBudgetModel;
  factory MonthlyBudgetModel.fromJson(final Map<String, dynamic> json) =>
      _$MonthlyBudgetModelFromJson(json);
  factory MonthlyBudgetModel.create() => MonthlyBudgetModel(
    nextBudgetDay: DateTime.now().add(const Duration(days: 30)),
    id: BudgetModelId.create(),
  );
  static const initial = MonthlyBudgetModel(id: BudgetModelId(value: ''));
}

@freezed
abstract class WeeklyBudgetModel with _$WeeklyBudgetModel {
  const factory WeeklyBudgetModel({
    required final BudgetModelId id,
    @Default(0) final double amount,
  }) = _WeeklyBudgetModel;
  factory WeeklyBudgetModel.fromJson(final Map<String, dynamic> json) =>
      _$WeeklyBudgetModelFromJson(json);
  factory WeeklyBudgetModel.create() =>
      WeeklyBudgetModel(id: BudgetModelId.create());
  static const initial = WeeklyBudgetModel(id: BudgetModelId(value: ''));
}

enum BudgetType {
  personal,
  business;

  factory BudgetType.fromJson(final String json) =>
      BudgetType.values.byName(json);
  String toJson() => name;
}

enum BudgetTransactionType {
  expense,
  income;

  factory BudgetTransactionType.fromJson(final String json) =>
      BudgetTransactionType.values.byName(json);
  String toJson() => name;

  TransactionType toTransactionType() => switch (this) {
    BudgetTransactionType.expense => TransactionType.expense,
    BudgetTransactionType.income => TransactionType.income,
  };
}

enum PersonalIncomeBudgetType {
  salary,
  cashback,
  reselling,
  gifts,
  other,
  investments,
  crypto;

  factory PersonalIncomeBudgetType.fromJson(final String json) =>
      PersonalIncomeBudgetType.values.byName(json);
  String toJson() => name;
}

enum PersonalExpenseBudgetType {
  housing,
  subscriptions,
  food,
  transport,
  familyAndFriends,
  entertainment,
  other;

  factory PersonalExpenseBudgetType.fromJson(final String json) =>
      PersonalExpenseBudgetType.values.byName(json);
  String toJson() => name;
}

@freezed
abstract class Budget with _$Budget {
  const factory Budget({
    required final DateTime date,
    @Default(BudgetId.empty) final BudgetId id,
    @Default(InputMoney.empty) final InputMoney input,
    @Default(BudgetType.personal) final BudgetType type,
    @Default(BudgetTransactionType.income)
    final BudgetTransactionType transactionType,
    @Default(PersonalIncomeBudgetType.salary)
    final PersonalIncomeBudgetType personalIncomeType,
    @Default(PersonalExpenseBudgetType.other)
    final PersonalExpenseBudgetType personalExpenseType,
  }) = _Budget;
  const Budget._();
  factory Budget.fromJson(final Map<String, dynamic> json) =>
      _$BudgetFromJson(json);

  static final empty = Budget(date: DateTime.now());
  CurrencyId get currencyId => input.currencyId;
}
