import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale.g.dart';

@JsonSerializable()
class Sale extends Core {
  final double valor;
  final String codigoVenda;
  final double? desconto;
  Sale(
      {required super.id,
      required super.createdAt,
      required super.active,
      required this.valor,
      required this.codigoVenda,
      this.desconto,
      required super.sync});
  factory Sale.fromJson(Map<String, dynamic> json) =>
      _$SaleFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$SaleToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "Valor": "INTEGER",
      "Desconto": "INTEGER",
      "CodigoVenda": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Sale', columns: columns);
  }
}
