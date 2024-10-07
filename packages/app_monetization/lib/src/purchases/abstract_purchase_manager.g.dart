// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_purchase_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionDetailsImpl _$$SubscriptionDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionDetailsImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$SubscriptionDetailsImplToJson(
        _$SubscriptionDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'duration': instance.duration.inMicroseconds,
    };

_$OneTimePurchaseDetailsImpl _$$OneTimePurchaseDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$OneTimePurchaseDetailsImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OneTimePurchaseDetailsImplToJson(
        _$OneTimePurchaseDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

_$AvailableSubscriptionImpl _$$AvailableSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableSubscriptionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$AvailableSubscriptionImplToJson(
        _$AvailableSubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'duration': instance.duration.inMicroseconds,
    };

_$AvailableOneTimePurchaseImpl _$$AvailableOneTimePurchaseImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableOneTimePurchaseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$AvailableOneTimePurchaseImplToJson(
        _$AvailableOneTimePurchaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

_$PurchaseDetailsImpl _$$PurchaseDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseDetailsImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      subscriptionId: json['subscriptionId'] as String?,
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$$PurchaseDetailsImplToJson(
        _$PurchaseDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'subscriptionId': instance.subscriptionId,
      'expiryDate': instance.expiryDate?.toIso8601String(),
    };

_$PurchaseSuccessImpl _$$PurchaseSuccessImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseSuccessImpl(
      PurchaseDetails.fromJson(json['details'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PurchaseSuccessImplToJson(
        _$PurchaseSuccessImpl instance) =>
    <String, dynamic>{
      'details': instance.details,
      'runtimeType': instance.$type,
    };

_$PurchaseFailureImpl _$$PurchaseFailureImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseFailureImpl(
      json['error'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PurchaseFailureImplToJson(
        _$PurchaseFailureImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };
