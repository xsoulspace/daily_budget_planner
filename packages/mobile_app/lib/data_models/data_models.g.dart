// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) =>
    _AppSettingsModel(
      locale: localeFromString(json['locale'] as String?),
      brightness: json['brightness'] == null
          ? UiBrightness.system
          : UiBrightness.fromJson(json['brightness'] as String),
      use24HourFormat: json['use24HourFormat'] as bool? ?? true,
    );

Map<String, dynamic> _$AppSettingsModelToJson(_AppSettingsModel instance) =>
    <String, dynamic>{
      'locale': localeToString(instance.locale),
      'brightness': UiBrightness.toJson(instance.brightness),
      'use24HourFormat': instance.use24HourFormat,
    };

_MonthlyBudgetModel _$MonthlyBudgetModelFromJson(Map<String, dynamic> json) =>
    _MonthlyBudgetModel(
      id: BudgetModelId.fromJson(json['id'] as String),
      nextBudgetDay: json['nextBudgetDay'] == null
          ? null
          : DateTime.parse(json['nextBudgetDay'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      savings: (json['savings'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$MonthlyBudgetModelToJson(_MonthlyBudgetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nextBudgetDay': instance.nextBudgetDay?.toIso8601String(),
      'amount': instance.amount,
      'savings': instance.savings,
    };

_WeeklyBudgetModel _$WeeklyBudgetModelFromJson(Map<String, dynamic> json) =>
    _WeeklyBudgetModel(
      id: BudgetModelId.fromJson(json['id'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$WeeklyBudgetModelToJson(_WeeklyBudgetModel instance) =>
    <String, dynamic>{'id': instance.id, 'amount': instance.amount};

_Budget _$BudgetFromJson(Map<String, dynamic> json) => _Budget(
  date: DateTime.parse(json['date'] as String),
  id: json['id'] == null
      ? BudgetId.empty
      : BudgetId.fromJson(json['id'] as String),
  input: json['input'] == null
      ? InputMoney.empty
      : InputMoney.fromJson(json['input'] as Map<String, dynamic>),
  type: json['type'] == null
      ? BudgetType.personal
      : BudgetType.fromJson(json['type'] as String),
  transactionType: json['transactionType'] == null
      ? BudgetTransactionType.income
      : BudgetTransactionType.fromJson(json['transactionType'] as String),
  personalIncomeType: json['personalIncomeType'] == null
      ? PersonalIncomeBudgetType.salary
      : PersonalIncomeBudgetType.fromJson(json['personalIncomeType'] as String),
  personalExpenseType: json['personalExpenseType'] == null
      ? PersonalExpenseBudgetType.other
      : PersonalExpenseBudgetType.fromJson(
          json['personalExpenseType'] as String,
        ),
);

Map<String, dynamic> _$BudgetToJson(_Budget instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'id': instance.id,
  'input': instance.input,
  'type': instance.type,
  'transactionType': instance.transactionType,
  'personalIncomeType': instance.personalIncomeType,
  'personalExpenseType': instance.personalExpenseType,
};

_FinSettingsModel _$FinSettingsModelFromJson(Map<String, dynamic> json) =>
    _FinSettingsModel(
      fiatCurrencyId: json['fiatCurrencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['fiatCurrencyId'] as String),
      cryptoCurrencyId: json['cryptoCurrencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['cryptoCurrencyId'] as String),
    );

Map<String, dynamic> _$FinSettingsModelToJson(_FinSettingsModel instance) =>
    <String, dynamic>{
      'fiatCurrencyId': instance.fiatCurrencyId,
      'cryptoCurrencyId': instance.cryptoCurrencyId,
    };

_FinTaskModel _$FinTaskModelFromJson(
  Map<String, dynamic> json,
) => _FinTaskModel(
  id: json['id'] == null ? TaskId.empty : TaskId.fromJson(json['id'] as String),
  name: json['name'] as String? ?? '',
  purpose:
      $enumDecodeNullable(_$FinTaskModelPurposeEnumMap, json['purpose']) ??
      FinTaskModelPurpose.dailyBudget,
  type:
      $enumDecodeNullable(_$TaskTypeEnumMap, json['type']) ?? TaskType.personal,
  status: json['status'] == null
      ? TaskStatus.visible
      : TaskStatus.fromJson(json['status'] as String),
  period: json['period'] == null
      ? Period.monthly
      : Period.fromJson((json['period'] as num).toInt()),
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  regularIncomeTaskId: json['regularIncomeTaskId'] == null
      ? TaskId.empty
      : TaskId.fromJson(json['regularIncomeTaskId'] as String),
);

Map<String, dynamic> _$FinTaskModelToJson(_FinTaskModel instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'purpose': _$FinTaskModelPurposeEnumMap[instance.purpose]!,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'status': instance.status,
      'period': instance.period,
      'regularIncomeTaskId': instance.regularIncomeTaskId,
    };

const _$FinTaskModelPurposeEnumMap = {
  FinTaskModelPurpose.dailyBudget: 'dailyBudget',
};

const _$TaskTypeEnumMap = {
  TaskType.personal: 'personal',
  TaskType.business: 'business',
};

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] == null ? TaskId.empty : TaskId.fromJson(json['id'] as String),
  status: json['status'] == null
      ? TaskStatus.visible
      : TaskStatus.fromJson(json['status'] as String),
  title: json['title'] as String? ?? '',
  notes: json['notes'] as String? ?? '',
  type:
      $enumDecodeNullable(_$TaskTypeEnumMap, json['type']) ?? TaskType.personal,
  personalIncomeType:
      $enumDecodeNullable(
        _$PersonalIncomeTaskTypeEnumMap,
        json['personalIncomeType'],
      ) ??
      PersonalIncomeTaskType.salary,
  personalExpenseType:
      $enumDecodeNullable(
        _$PersonalExpenseTaskTypeEnumMap,
        json['personalExpenseType'],
      ) ??
      PersonalExpenseTaskType.other,
  transactionType: json['transactionType'] == null
      ? TaskTransactionType.income
      : TaskTransactionType.fromJson(json['transactionType'] as String),
  categoryIds:
      (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => CategoryId.fromJson(e as String))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'title': instance.title,
  'notes': instance.notes,
  'type': _$TaskTypeEnumMap[instance.type]!,
  'personalIncomeType':
      _$PersonalIncomeTaskTypeEnumMap[instance.personalIncomeType]!,
  'personalExpenseType':
      _$PersonalExpenseTaskTypeEnumMap[instance.personalExpenseType]!,
  'transactionType': instance.transactionType,
  'categoryIds': instance.categoryIds,
};

const _$PersonalIncomeTaskTypeEnumMap = {
  PersonalIncomeTaskType.salary: 'salary',
  PersonalIncomeTaskType.cashback: 'cashback',
  PersonalIncomeTaskType.reselling: 'reselling',
  PersonalIncomeTaskType.gifts: 'gifts',
  PersonalIncomeTaskType.other: 'other',
  PersonalIncomeTaskType.investments: 'investments',
  PersonalIncomeTaskType.crypto: 'crypto',
};

const _$PersonalExpenseTaskTypeEnumMap = {
  PersonalExpenseTaskType.housing: 'housing',
  PersonalExpenseTaskType.subscriptions: 'subscriptions',
  PersonalExpenseTaskType.food: 'food',
  PersonalExpenseTaskType.transport: 'transport',
  PersonalExpenseTaskType.familyAndFriends: 'familyAndFriends',
  PersonalExpenseTaskType.entertainment: 'entertainment',
  PersonalExpenseTaskType.other: 'other',
};

_ScheduledTransaction _$ScheduledTransactionFromJson(
  Map<String, dynamic> json,
) => _ScheduledTransaction(
  transactionId: json['transactionId'] == null
      ? TransactionId.empty
      : TransactionId.fromJson(json['transactionId'] as String),
  taskId: json['taskId'] == null
      ? TaskId.empty
      : TaskId.fromJson(json['taskId'] as String),
  schedule: json['schedule'] == null
      ? TransactionSchedule.empty
      : TransactionSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ScheduledTransactionToJson(
  _ScheduledTransaction instance,
) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'taskId': instance.taskId,
  'schedule': instance.schedule,
};

_TransactionSchedule _$TransactionScheduleFromJson(Map<String, dynamic> json) =>
    _TransactionSchedule(
      periodType:
          $enumDecodeNullable(
            _$TransactionPeriodTypeEnumMap,
            json['periodType'],
          ) ??
          TransactionPeriodType.none,
      period: json['period'] == null
          ? Period.daily
          : Period.fromJson((json['period'] as num).toInt()),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
    );

Map<String, dynamic> _$TransactionScheduleToJson(
  _TransactionSchedule instance,
) => <String, dynamic>{
  'periodType': _$TransactionPeriodTypeEnumMap[instance.periodType]!,
  'period': instance.period,
  'startedAt': instance.startedAt?.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
};

const _$TransactionPeriodTypeEnumMap = {
  TransactionPeriodType.none: 'none',
  TransactionPeriodType.bySpecificDate: 'bySpecificDate',
  TransactionPeriodType.byDayOfWeek: 'byDayOfWeek',
  TransactionPeriodType.byComputedDate: 'byComputedDate',
};

FiatCurrency _$FiatCurrencyFromJson(Map<String, dynamic> json) => FiatCurrency(
  id: json['id'] == null
      ? CurrencyId.empty
      : CurrencyId.fromJson(json['id'] as String),
  name: json['name'] as String? ?? '',
  slug: json['slug'] as String? ?? '',
  symbol: json['symbol'] as String? ?? '',
  decimals: (json['decimals'] as num?)?.toInt() ?? 2,
  type: json['type'] == null
      ? CurrencyType.fiat
      : CurrencyType.fromJson(json['type'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$FiatCurrencyToJson(FiatCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'type': instance.type,
      'runtimeType': instance.$type,
    };

CryptoCurrency _$CryptoCurrencyFromJson(Map<String, dynamic> json) =>
    CryptoCurrency(
      id: json['id'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['id'] as String),
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      type: json['type'] == null
          ? CurrencyType.crypto
          : CurrencyType.fromJson(json['type'] as String),
      chainId: json['chainId'] == null
          ? ChainId.empty
          : ChainId.fromJson(json['chainId'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CryptoCurrencyToJson(CryptoCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'type': instance.type,
      'chainId': instance.chainId,
      'runtimeType': instance.$type,
    };

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  transactionDate: DateTime.parse(json['transactionDate'] as String),
  id: json['id'] == null
      ? TransactionId.empty
      : TransactionId.fromJson(json['id'] as String),
  input: json['input'] == null
      ? InputMoney.empty
      : InputMoney.fromJson(json['input'] as Map<String, dynamic>),
  description: json['description'] as String? ?? '',
  note: json['note'] as String? ?? '',
  shoppingListString: json['shoppingListString'] as String? ?? '',
  taskId: json['taskId'] == null
      ? TaskId.empty
      : TaskId.fromJson(json['taskId'] as String),
  type:
      $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
      TransactionType.expense,
  categoryId: json['categoryId'] == null
      ? CategoryId.empty
      : CategoryId.fromJson(json['categoryId'] as String),
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'transactionDate': instance.transactionDate.toIso8601String(),
      'id': instance.id,
      'input': instance.input,
      'description': instance.description,
      'note': instance.note,
      'shoppingListString': instance.shoppingListString,
      'taskId': instance.taskId,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'categoryId': instance.categoryId,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.expense: 'expense',
  TransactionType.income: 'income',
  TransactionType.transferIn: 'transfer_in',
  TransactionType.transferOut: 'transfer_out',
};

FiatInputModel _$FiatInputModelFromJson(Map<String, dynamic> json) =>
    FiatInputModel(
      currencyId: json['currencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['currencyId'] as String),
      amountWithTax: (json['amountWithTax'] as num?)?.toDouble() ?? 0.0,
      currencyType: json['currencyType'] == null
          ? CurrencyType.fiat
          : CurrencyType.fromJson(json['currencyType'] as String),
      tax: json['tax'] == null
          ? TaxValue.zero
          : TaxValue.fromJson((json['tax'] as num).toInt()),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FiatInputModelToJson(FiatInputModel instance) =>
    <String, dynamic>{
      'currencyId': instance.currencyId,
      'amountWithTax': instance.amountWithTax,
      'currencyType': instance.currencyType,
      'tax': instance.tax,
      'runtimeType': instance.$type,
    };

CyptoInputModel _$CyptoInputModelFromJson(Map<String, dynamic> json) =>
    CyptoInputModel(
      currencyId: json['currencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['currencyId'] as String),
      amountWithTax: (json['amountWithTax'] as num?)?.toDouble() ?? 0.0,
      currencyType: json['currencyType'] == null
          ? CurrencyType.crypto
          : CurrencyType.fromJson(json['currencyType'] as String),
      tax: json['tax'] == null
          ? TaxValue.zero
          : TaxValue.fromJson((json['tax'] as num).toInt()),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CyptoInputModelToJson(CyptoInputModel instance) =>
    <String, dynamic>{
      'currencyId': instance.currencyId,
      'amountWithTax': instance.amountWithTax,
      'currencyType': instance.currencyType,
      'tax': instance.tax,
      'runtimeType': instance.$type,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  localId: UserModelId.localFromJson(json['local_id'] as String),
  remoteId: UserModelId.remoteFromJson(json['remote_id'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'local_id': UserModelId.toStringJson(instance.localId),
      'remote_id': UserModelId.toStringJson(instance.remoteId),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _SubscriptionModel(
      paidDaysLeft: (json['paid_days_left'] as num?)?.toInt() ?? 0,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SubscriptionModelToJson(_SubscriptionModel instance) =>
    <String, dynamic>{
      'paid_days_left': instance.paidDaysLeft,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_UserPermissionsModel _$UserPermissionsModelFromJson(
  Map<String, dynamic> json,
) => _UserPermissionsModel(
  shouldBeSynced: json['should_be_synced'] as bool? ?? false,
  tagLimit: (json['tag_limit'] as num?)?.toInt() ?? 5,
);

Map<String, dynamic> _$UserPermissionsModelToJson(
  _UserPermissionsModel instance,
) => <String, dynamic>{
  'should_be_synced': instance.shouldBeSynced,
  'tag_limit': instance.tagLimit,
};
