// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../transaction_models.dart';

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

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      date: DateTime.parse(json['date'] as String),
      id: json['id'] == null
          ? TransactionId.empty
          : TransactionId.fromJson(json['id'] as String),
      category: json['category'] == null
          ? TransactionCategoryId.empty
          : TransactionCategoryId.fromJson(json['category'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] == null
          ? CurrencyType.empty
          : CurrencyType.fromJson(json['currency'] as String),
      periodType: $enumDecodeNullable(
          _$TransactionPeriodTypeEnumMap, json['periodType']),
      period: $enumDecodeNullable(_$PeriodEnumMap, json['period']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'category': instance.category,
      'amount': instance.amount,
      'currency': instance.currency,
      'periodType': _$TransactionPeriodTypeEnumMap[instance.periodType],
      'period': _$PeriodEnumMap[instance.period],
      'runtimeType': instance.$type,
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

_$IncomeImpl _$$IncomeImplFromJson(Map<String, dynamic> json) => _$IncomeImpl(
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      id: json['id'] == null
          ? TransactionId.empty
          : TransactionId.fromJson(json['id'] as String),
      category: json['category'] == null
          ? IncomeCategoryId.empty
          : IncomeCategoryId.fromJson(json['category'] as String),
      currency: json['currency'] == null
          ? CurrencyType.empty
          : CurrencyType.fromJson(json['currency'] as String),
      periodType: $enumDecodeNullable(
          _$TransactionPeriodTypeEnumMap, json['periodType']),
      period: $enumDecodeNullable(_$PeriodEnumMap, json['period']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IncomeImplToJson(_$IncomeImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'id': instance.id,
      'category': instance.category,
      'currency': instance.currency,
      'periodType': _$TransactionPeriodTypeEnumMap[instance.periodType],
      'period': _$PeriodEnumMap[instance.period],
      'runtimeType': instance.$type,
    };
