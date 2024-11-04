// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopUser _$ShopUserFromJson(Map<String, dynamic> json) => ShopUser(
      userId: json['userId'] as String,
      shopId: json['shopId'] as String,
      userMainShop: fromJsonBoolean(json['userMainShop']),
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      sync: fromJsonBoolean(json['sync']),
    );

Map<String, dynamic> _$ShopUserToJson(ShopUser instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'userId': instance.userId,
      'shopId': instance.shopId,
      'userMainShop': instance.userMainShop,
    };
