import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop extends Core {
  final String companyId;
  final String nome;
  final String location;
  Shop({
    required super.id,
    required super.createdAt,
    required super.active,
    required this.companyId,
    required this.nome,
    required this.location,
    required super.sync,
  });

  factory Shop.fromJson(Map<String, dynamic> json) =>
      _$ShopFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$ShopToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "CompanyId": "TEXT",
      "Nome": "TEXT",
      "Location": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Shop', columns: columns);
  }
}
