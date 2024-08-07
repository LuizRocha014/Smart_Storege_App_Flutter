// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Venda _$VendaFromJson(Map<String, dynamic> json) => Venda(
      id: json['id'] as String,
      inclusao: DateTime.parse(json['inclusao'] as String),
    );

Map<String, dynamic> _$VendaToJson(Venda instance) => <String, dynamic>{
      'id': instance.id,
      'inclusao': instance.inclusao.toIso8601String(),
    };
