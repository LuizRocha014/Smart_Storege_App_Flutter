// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      inclusao: DateTime.parse(json['inclusao'] as String),
      roleId: json['roleId'] as String,
      name: json['name'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      emailVerifiedAt: DateTime.parse(json['emailVerifiedAt'] as String),
      password: json['password'] as String,
      rememberToken: json['rememberToken'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'inclusao': instance.inclusao.toIso8601String(),
      'roleId': instance.roleId,
      'name': instance.name,
      'email': instance.email,
      'userName': instance.userName,
      'emailVerifiedAt': instance.emailVerifiedAt.toIso8601String(),
      'password': instance.password,
      'rememberToken': instance.rememberToken,
    };
