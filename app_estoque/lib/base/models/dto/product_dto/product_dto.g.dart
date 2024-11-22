// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutctDto _$ProdutctDtoFromJson(Map<String, dynamic> json) => ProdutctDto(
      categoriaName: json['categoriaName'] as String?,
      categoriaId: json['categoriaId'] as String?,
      codProduct: json['codProduct'] as String?,
    );

Map<String, dynamic> _$ProdutctDtoToJson(ProdutctDto instance) =>
    <String, dynamic>{
      'categoriaName': instance.categoriaName,
      'categoriaId': instance.categoriaId,
      'codProduct': instance.codProduct,
    };
