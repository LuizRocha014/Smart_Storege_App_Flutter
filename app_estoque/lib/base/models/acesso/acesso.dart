import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'acesso.g.dart';

@JsonSerializable()
class Acessos {
  final String nome;
  final String valor;
  final String descricao;

  Acessos({required this.nome, required this.valor, required this.descricao});

  factory Acessos.fromJson(Map<String, dynamic> json) => _$AcessosFromJson(json);

  Map<String, dynamic> toJson() => _$AcessosToJson(this);

  static InfosTableDatabase get table {
    final columns = {
      "Nome": "TEXT",
      "Valor": "TEXT",
      "Descricao": "TEXT",
    };
    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Acesso', columns: columns);
  }
}
