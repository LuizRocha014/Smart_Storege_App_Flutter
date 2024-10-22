import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_costumer.g.dart';

@JsonSerializable()
class ShopCostumer extends Core {
  final String shopId;
  final String costumerId;
  ShopCostumer(
      {required super.id,
      required super.createdAt,
      required super.active,
      required this.costumerId,
      required this.shopId});

  factory ShopCostumer.fromJson(Map<String, dynamic> json) =>
      _$ShopCostumerFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ShopCostumerToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "CostumerId": "TEXT",
      "ShopId": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'ShopCostumer', columns: columns);
  }
}
