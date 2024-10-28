import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_product.g.dart';

@JsonSerializable()
class ShopProduct extends Core {
  final String productId;
  final String shopId;
  final String userId;
  final int totalAmount;
  final double salePrice;
  ShopProduct({
    required super.id,
    required super.createdAt,
    required super.active,
    required this.productId,
    required this.shopId,
    required this.userId,
    required this.totalAmount,
    required this.salePrice,
  });
  factory ShopProduct.fromJson(Map<String, dynamic> json) =>
      _$ShopProductFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ShopProductToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "ProductId": "TEXT",
      "ShopId": "TEXT",
      "UserId": "TEXT",
      "TotalAmount": "INTEGER",
      "SalePrice": "REAL",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'ShopProduct', columns: columns);
  }
}
