// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      categoryId: json['categoryId'] as String,
      storedlocation: json['storedlocation'] as String?,
      sku: json['sku'] as String,
      brand: json['brand'] as String,
      supplierId: json['supplierId'] as String?,
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      minimumAmount: (json['minimumAmount'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      totalValue: (json['totalValue'] as num?)?.toDouble(),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      description: json['description'] as String,
      additionalInfo: json['additionalInfo'] as String,
      base64Image: json['base64Image'] as String?,
      numbProduct: (json['numbProduct'] as num?)?.toInt() ?? 0,
      codProduct: json['codProduct'] as String?,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      sync: fromJsonBoolean(json['sync']),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'categoryId': instance.categoryId,
      'storedlocation': instance.storedlocation,
      'sku': instance.sku,
      'brand': instance.brand,
      'supplierId': instance.supplierId,
      'codProduct': instance.codProduct,
      'purchasePrice': instance.purchasePrice,
      'minimumAmount': instance.minimumAmount,
      'quantity': instance.quantity,
      'price': instance.price,
      'totalValue': instance.totalValue,
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'description': instance.description,
      'additionalInfo': instance.additionalInfo,
    };
