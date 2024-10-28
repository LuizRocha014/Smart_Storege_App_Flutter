import 'dart:typed_data';

import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Core {
  final String name;
  final String? sku;
  final String? brand;
  final int? supplierId;
  final double? purchasePrice;
  final double? salePrice;
  final int? totalAmount;
  final int? minimumAmount;
  final String? storageLocation;
  final DateTime? expiryDate;
  final String? description;
  final String? additionalInfo;
  final String? codProd;
  //late String? arquivoId;
  final String? categoriaId;
  @JsonKey(includeToJson: false)
  late int numbProduct;
  @JsonKey(includeToJson: false, includeFromJson: false)
  late Uint8List? image;
  @JsonKey(includeToJson: false)
  final String? base64Image;

  Product({
    required this.name,
    this.sku,
    this.brand,
    this.supplierId,
    this.purchasePrice,
    this.salePrice,
    this.codProd,
    this.totalAmount,
    this.minimumAmount,
    this.storageLocation,
    this.expiryDate,
    this.description,
    this.additionalInfo,
    this.categoriaId,
    this.base64Image,
    this.numbProduct = 0,
    required super.id,
    required super.createdAt,
    required super.active,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ProductToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "Name": "TEXT",
      "Brand": "TEXT",
      "Sku": "TEXT",
      "SupplierId": "INTEGER",
      "PurchasePrice": "REAL",
      "SalePrice": "REAL",
      "TotalAmount": "INTEGER",
      "Descricao": "INTEGER",
      "MinimumAmount": "INT",
      "StorageLocation": "TEXT",
      "ExpiryDate": "TEXT",
      "Description": "TEXT",
      "AdditionalInfo": "TEXT",
      "CategoriaId": "TEXT",
      "CodProd": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Product', columns: columns);
  }
}
