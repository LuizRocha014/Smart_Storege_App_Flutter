// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costumer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Costumer _$CostumerFromJson(Map<String, dynamic> json) => Costumer(
      id: json['id'] as String,
      nome: json['nome'] as String,
      cnpj: json['cnpj'] as String,
      email: json['email'] as String,
      addressNumber: json['addressNumber'] as String,
      address: json['address'] as String,
      zipCode: json['zipCode'] as String?,
      neighborhood: json['neighborhood'] as String?,
      sync: fromJsonBoolean(json['sync']),
      reference: json['reference'] as String?,
      phone: json['phone'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
    );

Map<String, dynamic> _$CostumerToJson(Costumer instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'nome': instance.nome,
      'cnpj': instance.cnpj,
      'email': instance.email,
      'address': instance.address,
      'addressNumber': instance.addressNumber,
      'neighborhood': instance.neighborhood,
      'zipCode': instance.zipCode,
      'phone': instance.phone,
      'reference': instance.reference,
    };
