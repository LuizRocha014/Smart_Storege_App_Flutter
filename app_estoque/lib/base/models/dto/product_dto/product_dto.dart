import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProdutctDto {
  final String? categoriaName;
  final String? categoriaId;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<Product>? listProduct;

  ProdutctDto({
    List<Product>? listProduct,
    this.categoriaName,
    this.categoriaId,
  }) : listProduct = listProduct ?? [];

  factory ProdutctDto.fromJson(Map<String, dynamic> json) =>
      _$ProdutctDtoFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ProdutctDtoToJson(this));
}
