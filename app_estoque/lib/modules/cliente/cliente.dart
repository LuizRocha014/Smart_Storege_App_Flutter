import 'package:app_estoque/base/models/smartStorege/Core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Cliente extends Core {
  final String nome;
  final String cnpj;
  final String email;
  final String address;
  final String zipcode;
  final String phone;
  final String responsible;
  final String responsiblephone;
  final String segment;

  // factory Cliente.fromJson(Map<String, dynamic> json) =>
  //     _$ClienteFromJson(fromJsonRepository(json));

  // Map<String, dynamic> toJson() => fromJsonRepository(_$ClienteToJson(this));

  Cliente(
    this.nome,
    this.cnpj,
    this.email,
    this.address,
    this.zipcode,
    this.phone,
    this.responsible,
    this.responsiblephone,
    this.segment, {
    required super.id,
    required super.inclusao,
  });

  static InfosTableDatabase get table {
    final columns = {
      "Nome": "TEXT",
      "cnpj": "TEXT",
      "email": "TEXT",
      "address": "TEXT",
      "zipcode": "TEXT",
      "phone": "TEXT",
      "responsible": "TEXT",
      "responsiblephone": "TEXT",
      "segment": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Cliente', columns: columns);
  }
}
