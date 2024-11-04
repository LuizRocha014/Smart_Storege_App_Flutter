// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_costumer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCostumer _$ShopCostumerFromJson(Map<String, dynamic> json) => ShopCostumer(
      id: json['id'] as String,
      sync: fromJsonBoolean(json['sync']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      customerId: json['customerId'] as String,
      shopId: json['shopId'] as String,
    );

Map<String, dynamic> _$ShopCostumerToJson(ShopCostumer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'shopId': instance.shopId,
      'customerId': instance.customerId,
    };
