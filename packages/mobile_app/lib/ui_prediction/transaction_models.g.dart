// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      date: DateTime.parse(json['date'] as String),
      id: json['id'] == null
          ? BudgetId.empty
          : BudgetId.fromJson(json['id'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] == null
          ? CurrencyType.empty
          : CurrencyType.fromJson(json['currency'] as String),
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
    };

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      date: DateTime.parse(json['date'] as String),
      id: json['id'] == null
          ? TransactionId.empty
          : TransactionId.fromJson(json['id'] as String),
      category: json['category'] == null
          ? TransactionCategoryId.empty
          : TransactionCategoryId.fromJson(json['category'] as String),
      description: json['description'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] == null
          ? CurrencyType.empty
          : CurrencyType.fromJson(json['currency'] as String),
      type: $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
          TransactionType.expense,
      periodType: $enumDecodeNullable(
          _$TransactionPeriodTypeEnumMap, json['periodType']),
      period: $enumDecodeNullable(_$PeriodEnumMap, json['period']),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'amount': instance.amount,
      'currency': instance.currency,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'periodType': _$TransactionPeriodTypeEnumMap[instance.periodType],
      'period': _$PeriodEnumMap[instance.period],
    };

const _$TransactionTypeEnumMap = {
  TransactionType.expense: 'expense',
  TransactionType.income: 'income',
};

const _$TransactionPeriodTypeEnumMap = {
  TransactionPeriodType.bySpecificDate: 'bySpecificDate',
  TransactionPeriodType.byDayOfWeek: 'byDayOfWeek',
  TransactionPeriodType.byComputedDate: 'byComputedDate',
};

const _$PeriodEnumMap = {
  Period.daily: 'daily',
  Period.weekly: 'weekly',
  Period.monthly: 'monthly',
  Period.yearly: 'yearly',
};
