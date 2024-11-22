import 'dart:typed_data';

import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Core {
  late String categoryId;
  late String shopId;
  late String? storedlocation;
  late String sku;
  late String brand;
  late String? supplierId;
  late String? codProduct;
  late double purchasePrice;
  late int minimumAmount;
  late int? quantity;
  late double? price;
  late double? totalValue;
  late DateTime? expiryDate;
  late String description;
  late String additionalInfo;
  @JsonKey(includeToJson: false)
  late int numbProduct;
  @JsonKey(includeToJson: false, includeFromJson: false, defaultValue: null)
  late Uint8List? image = Uint8List(0);
  @JsonKey(includeToJson: false)
  final String? base64Image;
  @JsonKey(includeToJson: false)
  final String? categoriaName;
  @JsonKey(includeToJson: false)
  final String? fileId;

  Product({
    required this.categoryId,
    required this.shopId,
    this.storedlocation,
    required this.sku,
    required this.brand,
    this.supplierId,
    this.categoriaName,
    this.fileId,
    required this.purchasePrice,
    required this.minimumAmount,
    this.quantity,
    this.price,
    this.totalValue,
    this.expiryDate,
    required this.description,
    required this.additionalInfo,
    this.base64Image,
    this.numbProduct = 0,
    this.codProduct,
    required super.id,
    required super.createdAt,
    required super.active,
    required super.sync,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ProductToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "Brand": "TEXT",
      "ShopId": "TEXT",
      "Sku": "TEXT",
      "SupplierId": "TEXT",
      "Storedlocation": "TEXT",
      "PurchasePrice": "REAL",
      "Price": "REAL",
      "TotalAmount": "INTEGER",
      "TotalValue": "INTEGER",
      "Quantity": "INTEGER",
      "Descricao": "INTEGER",
      "MinimumAmount": "INT",
      "StorageLocation": "TEXT",
      "ExpiryDate": "TEXT",
      "Description": "TEXT",
      "AdditionalInfo": "TEXT",
      "CategoryId": "TEXT",
      "CodProduct": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Product', columns: columns);
  }
}
