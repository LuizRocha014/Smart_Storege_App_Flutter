// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPermission _$UserPermissionFromJson(Map<String, dynamic> json) =>
    UserPermission(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      acessoId: json['acessoId'] as String,
      usuarioId: json['usuarioId'] as String,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$UserPermissionToJson(UserPermission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'usuarioId': instance.usuarioId,
      'acessoId': instance.acessoId,
    };
