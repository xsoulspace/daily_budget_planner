// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expensess_prediction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      date: DateTime.parse(json['date'] as String),
      id: json['id'] == null
          ? BudgetId.empty
          : BudgetId.fromJson(json['id'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'amount': instance.amount,
    };

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      date: DateTime.parse(json['date'] as String),
      id: json['id'] == null
          ? TransactionId.empty
          : TransactionId.fromJson(json['id'] as String),
      category: json['category'] == null
          ? ExpenseCategoryId.empty
          : ExpenseCategoryId.fromJson(json['category'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      period: $enumDecodeNullable(_$PeriodEnumMap, json['period']),
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'category': instance.category,
      'amount': instance.amount,
      'period': _$PeriodEnumMap[instance.period],
    };

const _$PeriodEnumMap = {
  Period.daily: 'daily',
  Period.weekly: 'weekly',
  Period.monthly: 'monthly',
  Period.yearly: 'yearly',
};

_$IncomeInfoImpl _$$IncomeInfoImplFromJson(Map<String, dynamic> json) =>
    _$IncomeInfoImpl(
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      id: json['id'] == null
          ? TransactionId.empty
          : TransactionId.fromJson(json['id'] as String),
      category: json['category'] == null
          ? IncomeCategoryId.empty
          : IncomeCategoryId.fromJson(json['category'] as String),
      period: $enumDecodeNullable(_$PeriodEnumMap, json['period']),
    );

Map<String, dynamic> _$$IncomeInfoImplToJson(_$IncomeInfoImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'id': instance.id,
      'category': instance.category,
      'period': _$PeriodEnumMap[instance.period],
    };
