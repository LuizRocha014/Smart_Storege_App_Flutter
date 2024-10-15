// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopProduct _$ShopProductFromJson(Map<String, dynamic> json) => ShopProduct(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      productId: json['productId'] as String,
      shopId: json['shopId'] as String,
      userId: json['userId'] as String,
      totalAmount: (json['totalAmount'] as num).toInt(),
      salePrice: (json['salePrice'] as num).toDouble(),
    );

Map<String, dynamic> _$ShopProductToJson(ShopProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'productId': instance.productId,
      'shopId': instance.shopId,
      'userId': instance.userId,
      'totalAmount': instance.totalAmount,
      'salePrice': instance.salePrice,
    };
