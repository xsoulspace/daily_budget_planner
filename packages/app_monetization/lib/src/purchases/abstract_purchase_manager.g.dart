// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_purchase_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseProductDetailsImpl _$$PurchaseProductDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseProductDetailsImpl(
      productId: ProductId.fromJson(json['productId']),
      productType:
          $enumDecode(_$PurchaseProductTypeEnumMap, json['productType']),
      name: json['name'] as String,
      formattedPrice: json['formattedPrice'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      description: json['description'] as String? ?? '',
      freeTrialDuration: json['freeTrialDuration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['freeTrialDuration'] as num).toInt()),
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
      'duration': instance.duration.inMicroseconds,
      'description': instance.description,
      'freeTrialDuration': instance.freeTrialDuration.inMicroseconds,
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
      productId: ProductId.fromJson(json['productId']),
      name: json['name'] as String,
      formattedPrice: json['formattedPrice'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      purchaseType:
          $enumDecode(_$PurchaseProductTypeEnumMap, json['purchaseType']),
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
      'price': instance.price,
      'currency': instance.currency,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'purchaseType': instance.purchaseType,
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

_$PurchaseUpdateImpl _$$PurchaseUpdateImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseUpdateImpl(
      purchaseId: PurchaseId.fromJson(json['purchaseId']),
      status: $enumDecode(_$PurchaseStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$PurchaseUpdateImplToJson(
        _$PurchaseUpdateImpl instance) =>
    <String, dynamic>{
      'purchaseId': instance.purchaseId,
      'status': _$PurchaseStatusEnumMap[instance.status]!,
    };

const _$PurchaseStatusEnumMap = {
  PurchaseStatus.pending: 'pending',
  PurchaseStatus.completed: 'completed',
  PurchaseStatus.cancelled: 'cancelled',
  PurchaseStatus.failed: 'failed',
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
