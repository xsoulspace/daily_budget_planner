// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsModelImpl _$$AppSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingsModelImpl(
      locale: localeFromString(json['locale'] as String?),
    );

Map<String, dynamic> _$$AppSettingsModelImplToJson(
        _$AppSettingsModelImpl instance) =>
    <String, dynamic>{
      'locale': localeToString(instance.locale),
    };

_$MonthlyBudgetModelImpl _$$MonthlyBudgetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlyBudgetModelImpl(
      id: BudgetModelId.fromJson(json['id'] as String),
      nextBudgetDay: dateTimeFromMilisecondsSinceEpoch(
          (json['nextBudgetDay'] as num?)?.toInt()),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      savings: (json['savings'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$MonthlyBudgetModelImplToJson(
        _$MonthlyBudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nextBudgetDay': dateTimeToMilisecondsSinceEpoch(instance.nextBudgetDay),
      'amount': instance.amount,
      'savings': instance.savings,
    };

_$WeeklyBudgetModelImpl _$$WeeklyBudgetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyBudgetModelImpl(
      id: BudgetModelId.fromJson(json['id'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$WeeklyBudgetModelImplToJson(
        _$WeeklyBudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      localId: UserModelId.localFromJson(json['local_id'] as String),
      remoteId: UserModelId.remoteFromJson(json['remote_id'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      subscription: SubscriptionModel.fromJson(
          json['subscription'] as Map<String, dynamic>),
      locale: localeFromString(json['locale'] as String?),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'local_id': UserModelId.toStringJson(instance.localId),
      'remote_id': UserModelId.toStringJson(instance.remoteId),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'subscription': instance.subscription.toJson(),
      'locale': localeToString(instance.locale),
    };

_$SubscriptionModelImpl _$$SubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionModelImpl(
      paidDaysLeft: (json['paid_days_left'] as num?)?.toInt() ?? 0,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$SubscriptionModelImplToJson(
        _$SubscriptionModelImpl instance) =>
    <String, dynamic>{
      'paid_days_left': instance.paidDaysLeft,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$UserPermissionsModelImpl _$$UserPermissionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPermissionsModelImpl(
      shouldBeSynced: json['should_be_synced'] as bool? ?? false,
      tagLimit: (json['tag_limit'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$$UserPermissionsModelImplToJson(
        _$UserPermissionsModelImpl instance) =>
    <String, dynamic>{
      'should_be_synced': instance.shouldBeSynced,
      'tag_limit': instance.tagLimit,
    };
