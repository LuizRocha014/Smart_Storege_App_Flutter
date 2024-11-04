// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFile _$ProductFileFromJson(Map<String, dynamic> json) => ProductFile(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      productId: json['productId'] as String,
      fileId: json['fileId'] as String,
      description: json['description'] as String,
      sync: fromJsonBoolean(json['sync']),
    );

Map<String, dynamic> _$ProductFileToJson(ProductFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'productId': instance.productId,
      'fileId': instance.fileId,
      'description': instance.description,
    };
