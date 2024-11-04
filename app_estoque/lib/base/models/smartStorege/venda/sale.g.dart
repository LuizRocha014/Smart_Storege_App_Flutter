// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map<String, dynamic> json) => Sale(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      active: fromJsonBoolean(json['active']),
      valor: (json['valor'] as num).toDouble(),
      codigoVenda: json['codigoVenda'] as String,
      desconto: (json['desconto'] as num?)?.toDouble(),
      sync: fromJsonBoolean(json['sync']),
    );

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'active': instance.active,
      'sync': instance.sync,
      'valor': instance.valor,
      'codigoVenda': instance.codigoVenda,
      'desconto': instance.desconto,
    };
