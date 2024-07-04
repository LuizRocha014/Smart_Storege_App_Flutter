// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arquivo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Arquivo _$ArquivoFromJson(Map<String, dynamic> json) => Arquivo(
      id: json['id'] as String,
      inclusao: DateTime.parse(json['inclusao'] as String),
      base64: json['base64'] as String,
    );

Map<String, dynamic> _$ArquivoToJson(Arquivo instance) => <String, dynamic>{
      'id': instance.id,
      'inclusao': instance.inclusao.toIso8601String(),
      'base64': instance.base64,
    };
