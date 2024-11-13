// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      companyId: json['companyId'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      sync: fromJsonBoolean(json['sync']),
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'companyId': instance.companyId,
      'name': instance.name,
      'location': instance.location,
    };
