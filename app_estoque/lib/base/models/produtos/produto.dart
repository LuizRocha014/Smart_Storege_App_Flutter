import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:json_annotation/json_annotation.dart';

class Produto extends Core {
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

  Produto({
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
    this.numbProduct = 0,
    required super.id,
    required super.createdAt,
  });

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
    return InfosTableDatabase(tableName: 'Produtos', columns: columns);
  }
}
