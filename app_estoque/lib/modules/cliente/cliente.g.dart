// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cliente _$ClienteFromJson(Map<String, dynamic> json) => Cliente(
      json['nome'] as String,
      json['cnpj'] as String,
      json['email'] as String,
      json['address'] as String,
      json['zipcode'] as String,
      json['phone'] as String,
      json['responsible'] as String,
      json['responsiblephone'] as String,
      json['segment'] as String,
      id: json['id'] as String,
      inclusao: DateTime.parse(json['inclusao'] as String),
    );

Map<String, dynamic> _$ClienteToJson(Cliente instance) => <String, dynamic>{
      'id': instance.id,
      'inclusao': instance.inclusao.toIso8601String(),
      'nome': instance.nome,
      'cnpj': instance.cnpj,
      'email': instance.email,
      'address': instance.address,
      'zipcode': instance.zipcode,
      'phone': instance.phone,
      'responsible': instance.responsible,
      'responsiblephone': instance.responsiblephone,
      'segment': instance.segment,
    };
