import 'dart:typed_data';

import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_dto.g.dart';

@JsonSerializable()
class ItemDto {
  final String? nome;
  final String? marca;
  final int? quantidade;
  final double? valor;
  final String? productId;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late Uint8List? image;
  late final String? base64Image;
  @JsonKey(
    includeFromJson: false,
    includeToJson: false,
  )
  late int numbProduct;

  factory ItemDto.fromJson(Map<String, dynamic> json) =>
      _$ItemDtoFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ItemDtoToJson(this));

  ItemDto(
      {this.nome,
      this.valor,
      this.quantidade,
      this.marca,
      this.base64Image,
      this.numbProduct = 0,
      this.productId});
}
