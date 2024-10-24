// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) => ItemDto(
      nome: json['nome'] as String?,
      valor: (json['valor'] as num?)?.toDouble(),
      quantidade: (json['quantidade'] as num?)?.toInt(),
      marca: json['marca'] as String?,
      base64Image: json['base64Image'] as String?,
      productId: json['productId'] as String?,
    );

Map<String, dynamic> _$ItemDtoToJson(ItemDto instance) => <String, dynamic>{
      'nome': instance.nome,
      'marca': instance.marca,
      'quantidade': instance.quantidade,
      'valor': instance.valor,
      'productId': instance.productId,
      'base64Image': instance.base64Image,
    };
