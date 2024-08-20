import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'produto.g.dart';

@JsonSerializable()
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
  @JsonKey(includeFromJson: false)
  late int numbProduct;

  Produto({
    required this.name,
    this.sku,
    this.brand,
    this.supplierId,
    this.purchasePrice,
    this.salePrice,
    this.totalAmount,
    this.minimumAmount,
    this.storageLocation,
    this.expiryDate,
    this.description,
    this.additionalInfo,
    this.numbProduct = 0,
    required super.id,
    required super.inclusao,
  });
  factory Produto.fromJson(Map<String, dynamic> json) =>
      _$ProdutoFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoToJson(this);

  static InfosTableDatabase get table {
    final columns = {
      "name": "TEXT",
      "brand": "TEXT",
      "supplierId": "TEXT",
      "purchasePrice": "TEXT",
      "salePrice": "TEXT",
      "totalAmount": "TEXT",
      "Descricao": "TEXT",
      "minimumAmount": "TEXT",
      "storageLocation": "TEXT",
      "expiryDate": "TEXT",
      "description": "TEXT",
      "additionalInfo": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Produtos', columns: columns);
  }
}
