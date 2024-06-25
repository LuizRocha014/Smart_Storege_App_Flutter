import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';

class Produto extends Core {
  final String nome;
  final String cor;
  final String marca;
  final String codigo;
  final String quantidade;
  final String? arquivoId;
  final String valor;

  Produto(
      {required this.nome,
      required super.id,
      required super.inclusao,
      required this.cor,
      required this.marca,
      required this.codigo,
      required this.quantidade,
      this.arquivoId,
      required this.valor});
  Map<String, dynamic> toJson() {
    return {
      "Nome": nome,
      "Cor": cor,
      "Marca": marca,
      "Codigo": codigo,
      "Quantidade": quantidade,
      "ArquivoId": arquivoId,
      "Valor": valor,
    };
  }

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        nome: json['nome'],
        valor: json['valor'],
        id: '',
        inclusao: DateTime.now(),
        cor: '',
        marca: '',
        codigo: '',
        quantidade: '',
      );

  static InfosTableDatabase get table {
    final columns = {
      "Nome": "TEXT",
      "Cor": "TEXT",
      "Marca": "TEXT",
      "Codigo": "TEXT",
      "Quantidade": "TEXT",
      "ArquivoId": "TEXT",
      "Valor": "TEXT",
    };

    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Produto', columns: columns);
  }
}
