import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/enuns.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transactions extends Core {
  final TipoTransacao type; // Enum tipoTransacao
  final String? supplierId; // Usando String? para representar GUIDs
  final String? customerId;
  final String productId;
  final String saleId;
  final int numberProd;
  final String? targetCompanyId;
  final String? originCompanyId;
  final String userId;
  final String? paymentMethod;
  final String? note;

  Transactions({
    required this.type,
    this.supplierId,
    this.customerId,
    required this.numberProd,
    required this.productId,
    required this.saleId,
    this.targetCompanyId,
    this.originCompanyId,
    required this.userId,
    this.paymentMethod,
    this.note,
    required super.id,
    required super.createdAt,
    required super.active,
    required super.sync,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$TransactionsToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "Type": "INTEGER",
      "SupplierId": "TEXT",
      "CustomerId": "TEXT",
      "ProductId": "TEXT",
      "TargetCompanyId": "TEXT",
      "OriginCompanyId": "TEXT",
      "UserId": "TEXT",
      "SaleId": "TEXT",
      "PaymentMethod": "TEXT",
      "Note": "TEXT",
      "NumberProd": "INTEGER",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Transactions', columns: columns);
  }
}
