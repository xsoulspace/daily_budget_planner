// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseDurationImpl _$$PurchaseDurationImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseDurationImpl(
      years: (json['years'] as num?)?.toInt() ?? 0,
      months: (json['months'] as num?)?.toInt() ?? 0,
      days: (json['days'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PurchaseDurationImplToJson(
        _$PurchaseDurationImpl instance) =>
    <String, dynamic>{
      'years': instance.years,
      'months': instance.months,
      'days': instance.days,
    };

_$PurchaseProductDetailsImpl _$$PurchaseProductDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseProductDetailsImpl(
      productId: PurchaseProductId.fromJson(json['productId']),
      productType:
          $enumDecode(_$PurchaseProductTypeEnumMap, json['productType']),
      name: json['name'] as String,
      formattedPrice: json['formattedPrice'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      description: json['description'] as String? ?? '',
      duration: json['duration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['duration'] as num).toInt()),
      freeTrialDuration: json['freeTrialDuration'] == null
          ? PurchaseDuration.zero
          : PurchaseDuration.fromJson(
              json['freeTrialDuration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseProductDetailsImplToJson(
        _$PurchaseProductDetailsImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productType': instance.productType,
      'name': instance.name,
      'formattedPrice': instance.formattedPrice,
      'price': instance.price,
      'currency': instance.currency,
      'description': instance.description,
      'duration': instance.duration.inMicroseconds,
      'freeTrialDuration': instance.freeTrialDuration,
    };

const _$PurchaseProductTypeEnumMap = {
  PurchaseProductType.consumable: 'consumable',
  PurchaseProductType.nonConsumable: 'nonConsumable',
  PurchaseProductType.subscription: 'subscription',
};

_$PurchaseDetailsImpl _$$PurchaseDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseDetailsImpl(
      purchaseId: PurchaseId.fromJson(json['purchaseId']),
      productId: PurchaseProductId.fromJson(json['productId']),
      name: json['name'] as String,
      formattedPrice: json['formattedPrice'] as String,
      status: $enumDecode(_$PurchaseStatusEnumMap, json['status']),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      purchaseType:
          $enumDecode(_$PurchaseProductTypeEnumMap, json['purchaseType']),
      freeTrialDuration: json['freeTrialDuration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['freeTrialDuration'] as num).toInt()),
      duration: json['duration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['duration'] as num).toInt()),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$$PurchaseDetailsImplToJson(
        _$PurchaseDetailsImpl instance) =>
    <String, dynamic>{
      'purchaseId': instance.purchaseId,
      'productId': instance.productId,
      'name': instance.name,
      'formattedPrice': instance.formattedPrice,
      'status': _$PurchaseStatusEnumMap[instance.status]!,
      'price': instance.price,
      'currency': instance.currency,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'purchaseType': instance.purchaseType,
      'freeTrialDuration': instance.freeTrialDuration.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
      'expiryDate': instance.expiryDate?.toIso8601String(),
    };

const _$PurchaseStatusEnumMap = {
  PurchaseStatus.pending: 'pending',
  PurchaseStatus.purchased: 'purchased',
  PurchaseStatus.error: 'error',
  PurchaseStatus.restored: 'restored',
  PurchaseStatus.canceled: 'canceled',
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

_$RestoreSuccessImpl _$$RestoreSuccessImplFromJson(Map<String, dynamic> json) =>
    _$RestoreSuccessImpl(
      (json['restoredPurchases'] as List<dynamic>)
          .map((e) => PurchaseDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RestoreSuccessImplToJson(
        _$RestoreSuccessImpl instance) =>
    <String, dynamic>{
      'restoredPurchases': instance.restoredPurchases,
      'runtimeType': instance.$type,
    };

_$RestoreFailureImpl _$$RestoreFailureImplFromJson(Map<String, dynamic> json) =>
    _$RestoreFailureImpl(
      json['error'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RestoreFailureImplToJson(
        _$RestoreFailureImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };

_$CancelSuccessImpl _$$CancelSuccessImplFromJson(Map<String, dynamic> json) =>
    _$CancelSuccessImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CancelSuccessImplToJson(_$CancelSuccessImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CancelFailureImpl _$$CancelFailureImplFromJson(Map<String, dynamic> json) =>
    _$CancelFailureImpl(
      json['error'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CancelFailureImplToJson(_$CancelFailureImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };

_$CompletePurchaseSuccessImpl _$$CompletePurchaseSuccessImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletePurchaseSuccessImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletePurchaseSuccessImplToJson(
        _$CompletePurchaseSuccessImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CompletePurchaseFailureImpl _$$CompletePurchaseFailureImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletePurchaseFailureImpl(
      json['error'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletePurchaseFailureImplToJson(
        _$CompletePurchaseFailureImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };

_$PurchaseVerificationDtoImpl _$$PurchaseVerificationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseVerificationDtoImpl(
      purchaseId: PurchaseId.fromJson(json['purchaseId']),
      productId: PurchaseProductId.fromJson(json['productId']),
      status: $enumDecode(_$PurchaseStatusEnumMap, json['status']),
      productType:
          $enumDecode(_$PurchaseProductTypeEnumMap, json['productType']),
      transactionDate: json['transactionDate'] == null
          ? null
          : DateTime.parse(json['transactionDate'] as String),
      purchaseToken: json['purchaseToken'] as String?,
      developerPayload: json['developerPayload'] as String?,
      source: json['source'] as String?,
      localVerificationData: json['localVerificationData'] as String?,
      serverVerificationData: json['serverVerificationData'] as String?,
    );

Map<String, dynamic> _$$PurchaseVerificationDtoImplToJson(
        _$PurchaseVerificationDtoImpl instance) =>
    <String, dynamic>{
      'purchaseId': instance.purchaseId,
      'productId': instance.productId,
      'status': _$PurchaseStatusEnumMap[instance.status]!,
      'productType': instance.productType,
      'transactionDate': instance.transactionDate?.toIso8601String(),
      'purchaseToken': instance.purchaseToken,
      'developerPayload': instance.developerPayload,
      'source': instance.source,
      'localVerificationData': instance.localVerificationData,
      'serverVerificationData': instance.serverVerificationData,
    };
