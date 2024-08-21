// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      roleId: (json['roleId'] as num?)?.toInt(),
      id: json['id'] as String,
      inclusao: DateTime.parse(json['inclusao'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'inclusao': instance.inclusao.toIso8601String(),
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'roleId': instance.roleId,
    };
