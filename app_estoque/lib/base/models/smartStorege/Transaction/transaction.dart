import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/enuns.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Core {
  TipoTransacao type;
  String? supplierId; // Representando Guid como String
  String? customerId;
  String productId;
  String? targetCompany;
  String? originCompany;
  String userId;
  String? paymentMethod;
  String? notes;

  Transaction({
    required this.type,
    this.supplierId,
    this.customerId,
    required this.productId,
    this.targetCompany,
    this.originCompany,
    required this.userId,
    this.paymentMethod,
    this.notes,
    required super.id,
    required super.createdAt,
    required super.active,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$TransactionToJson(this));

  static InfosTableDatabase get table {
    final columns = {
      "Type": "INTEGER",
      "SupplierId": "TEXT",
      "CustomerId": "TEXT",
      "ProductId": "TEXT",
      "TargetCompany": "TEXT",
      "OriginCompany": "TEXT",
      "UserId": "TEXT",
      "PaymentMethod": "TEXT",
      "Notes": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Transaction', columns: columns);
  }
}
