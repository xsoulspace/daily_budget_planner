// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expensess_prediction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegularExpenseImpl _$$RegularExpenseImplFromJson(Map<String, dynamic> json) =>
    _$RegularExpenseImpl(
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String,
      period: $enumDecode(_$PeriodEnumMap, json['period']),
    );

Map<String, dynamic> _$$RegularExpenseImplToJson(
        _$RegularExpenseImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'category': instance.category,
      'period': _$PeriodEnumMap[instance.period]!,
    };

const _$PeriodEnumMap = {
  Period.daily: 'daily',
  Period.weekly: 'weekly',
  Period.monthly: 'monthly',
  Period.yearly: 'yearly',
};

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'category': instance.category,
    };

_$SalaryInfoImpl _$$SalaryInfoImplFromJson(Map<String, dynamic> json) =>
    _$SalaryInfoImpl(
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$SalaryInfoImplToJson(_$SalaryInfoImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
