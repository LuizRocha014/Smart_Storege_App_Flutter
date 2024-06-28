// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Produto _$ProdutoFromJson(Map<String, dynamic> json) => Produto(
      nome: json['nome'] as String,
      id: json['id'] as String,
      inclusao: DateTime.parse(json['inclusao'] as String),
      cor: json['cor'] as String,
      marca: json['marca'] as String,
      codigo: json['codigo'] as String,
      quantidade: json['quantidade'] as String,
      arquivoId: json['arquivoId'] as String?,
      valor: json['valor'] as String,
    );

Map<String, dynamic> _$ProdutoToJson(Produto instance) => <String, dynamic>{
      'id': instance.id,
      'inclusao': instance.inclusao.toIso8601String(),
      'nome': instance.nome,
      'cor': instance.cor,
      'marca': instance.marca,
      'codigo': instance.codigo,
      'quantidade': instance.quantidade,
      'arquivoId': instance.arquivoId,
      'valor': instance.valor,
    };
