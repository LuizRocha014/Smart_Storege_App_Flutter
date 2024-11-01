import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale.g.dart';

@JsonSerializable()
class Sale extends Core {
  final double valor;
  Sale({
    required super.id,
    required super.createdAt,
    required super.active,
    required this.valor,
  });
  factory Sale.fromJson(Map<String, dynamic> json) =>
      _$SaleFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$SaleToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "valor": "INTEGER",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Sale', columns: columns);
  }
}
