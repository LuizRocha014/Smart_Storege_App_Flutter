import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:json_annotation/json_annotation.dart';

part 'costumer.g.dart';

@JsonSerializable()
class Costumer extends Core {
  final String nome;
  final String cnpj;
  final String email;
  final String address;
  final String addressNumber;
  final String? neighborhood;
  final String? zipCode;
  final String? phone;
  final String? reference;

  factory Costumer.fromJson(Map<String, dynamic> json) =>
      _$CostumerFromJson(fromJsonRepository(json));

  Map<String, dynamic> toJson() => toJsonRepository(_$CostumerToJson(this));

  Costumer({
    required super.id,
    required this.nome,
    required this.cnpj,
    required this.email,
    required this.addressNumber,
    required this.address,
    required this.zipCode,
    this.neighborhood,
    this.reference,
    this.phone,
    required super.createdAt,
    required super.active,
  });

  static InfosTableDatabase get table {
    final columns = {
      "Nome": "TEXT",
      "Cnpj": "TEXT",
      "Email": "TEXT",
      "Address": "TEXT",
      "AddressNumber": "TEXT",
      "Neighborhood": "TEXT",
      "ZipCode": "TEXT",
      "Phone": "TEXT",
      "Reference": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Costumer', columns: columns);
  }
}
