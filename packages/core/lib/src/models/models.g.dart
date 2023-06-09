// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSettingsModel _$$_AppSettingsModelFromJson(Map<String, dynamic> json) =>
    _$_AppSettingsModel(
      locale: localeFromString(json['locale'] as String?),
    );

Map<String, dynamic> _$$_AppSettingsModelToJson(_$_AppSettingsModel instance) =>
    <String, dynamic>{
      'locale': localeToString(instance.locale),
    };

_$_MonthlyBudgetModel _$$_MonthlyBudgetModelFromJson(
        Map<String, dynamic> json) =>
    _$_MonthlyBudgetModel(
      id: BudgetModelId.fromJson(json['id'] as String),
      nextBudgetDay:
          dateTimeFromMilisecondsSinceEpoch(json['nextBudgetDay'] as int?),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      savings: (json['savings'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_MonthlyBudgetModelToJson(
        _$_MonthlyBudgetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nextBudgetDay': dateTimeToMilisecondsSinceEpoch(instance.nextBudgetDay),
      'amount': instance.amount,
      'savings': instance.savings,
    };

_$_WeeklyBudgetModel _$$_WeeklyBudgetModelFromJson(Map<String, dynamic> json) =>
    _$_WeeklyBudgetModel(
      id: BudgetModelId.fromJson(json['id'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_WeeklyBudgetModelToJson(
        _$_WeeklyBudgetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
    };

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      localId: UserModelId.localFromJson(json['local_id'] as String),
      remoteId: UserModelId.remoteFromJson(json['remote_id'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      subscription: SubscriptionModel.fromJson(
          json['subscription'] as Map<String, dynamic>),
      locale: localeFromString(json['locale'] as String?),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'local_id': UserModelId.toStringJson(instance.localId),
      'remote_id': UserModelId.toStringJson(instance.remoteId),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'subscription': instance.subscription.toJson(),
      'locale': localeToString(instance.locale),
    };

_$_SubscriptionModel _$$_SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _$_SubscriptionModel(
      paidDaysLeft: json['paid_days_left'] as int? ?? 0,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_SubscriptionModelToJson(
        _$_SubscriptionModel instance) =>
    <String, dynamic>{
      'paid_days_left': instance.paidDaysLeft,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$_UserPermissionsModel _$$_UserPermissionsModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserPermissionsModel(
      shouldBeSynced: json['should_be_synced'] as bool? ?? false,
      tagLimit: json['tag_limit'] as int? ?? 5,
    );

Map<String, dynamic> _$$_UserPermissionsModelToJson(
        _$_UserPermissionsModel instance) =>
    <String, dynamic>{
      'should_be_synced': instance.shouldBeSynced,
      'tag_limit': instance.tagLimit,
    };
