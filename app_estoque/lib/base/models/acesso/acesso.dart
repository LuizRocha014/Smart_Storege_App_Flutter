import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';

class Acessos {
  final String nome;
  final String valor;
  final String descricao;

  Acessos({required this.nome, required this.valor, required this.descricao});
  factory Acessos.fromJson(Map<String, dynamic> json) => Acessos(
        nome: json['nome'],
        valor: json['valor'],
        descricao: json['descricao'],
      );

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
