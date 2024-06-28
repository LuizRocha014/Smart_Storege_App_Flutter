// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      sobrenome: json['sobrenome'] as String,
      userName: json['userName'] as String,
      senha: json['senha'] as String,
      email: json['email'] as String,
      nome: json['nome'] as String,
      id: json['id'] as String,
      inclusao: DateTime.parse(json['inclusao'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'inclusao': instance.inclusao.toIso8601String(),
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'userName': instance.userName,
      'senha': instance.senha,
      'email': instance.email,
    };
