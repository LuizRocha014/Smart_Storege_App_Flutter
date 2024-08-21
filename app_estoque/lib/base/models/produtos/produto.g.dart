// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Produto _$ProdutoFromJson(Map<String, dynamic> json) => Produto(
      name: json['name'] as String,
      sku: json['sku'] as String?,
      brand: json['brand'] as String?,
      supplierId: (json['supplierId'] as num?)?.toInt(),
      purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
      salePrice: (json['salePrice'] as num?)?.toDouble(),
      codProd: json['codProd'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toInt(),
      minimumAmount: (json['minimumAmount'] as num?)?.toInt(),
      storageLocation: json['storageLocation'] as String?,
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      description: json['description'] as String?,
      additionalInfo: json['additionalInfo'] as String?,
      categoriaId: json['categoriaId'] as String?,
      numbProduct: (json['numbProduct'] as num?)?.toInt() ?? 0,
      id: json['id'] as String,
      inclusao: DateTime.parse(json['inclusao'] as String),
    );

Map<String, dynamic> _$ProdutoToJson(Produto instance) => <String, dynamic>{
      'id': instance.id,
      'inclusao': instance.inclusao.toIso8601String(),
      'name': instance.name,
      'sku': instance.sku,
      'brand': instance.brand,
      'supplierId': instance.supplierId,
      'purchasePrice': instance.purchasePrice,
      'salePrice': instance.salePrice,
      'totalAmount': instance.totalAmount,
      'minimumAmount': instance.minimumAmount,
      'storageLocation': instance.storageLocation,
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'description': instance.description,
      'additionalInfo': instance.additionalInfo,
      'codProd': instance.codProd,
      'categoriaId': instance.categoriaId,
    };
