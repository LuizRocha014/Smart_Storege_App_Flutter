// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      roleId: json['roleId'] as String,
      name: json['name'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      emailVerifiedAt: DateTime.parse(json['emailVerifiedAt'] as String),
      password: json['password'] as String,
      rememberToken: json['rememberToken'] as String,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'active': instance.active,
      'roleId': instance.roleId,
      'name': instance.name,
      'email': instance.email,
      'userName': instance.userName,
      'emailVerifiedAt': instance.emailVerifiedAt.toIso8601String(),
      'password': instance.password,
      'rememberToken': instance.rememberToken,
    };
