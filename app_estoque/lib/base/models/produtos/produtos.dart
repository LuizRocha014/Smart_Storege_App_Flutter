import 'package:app_estoque/base/models/core/core.dart';
import 'package:app_estoque/utils/infos_tabela_database.dart';
import 'package:app_estoque/utils/mappers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'produtos.g.dart';

@JsonSerializable()
class Produto extends Core {
  final String nome;
  final String cor;
  final String marca;
  final String codigo;
  final String quantidade;
  final String? arquivoId;
  final String valor;
  final String? categoriaId;

  Produto(
      {required this.nome,
      required super.id,
      required super.inclusao,
      required this.cor,
      required this.marca,
      required this.codigo,
      required this.quantidade,
      this.arquivoId,
      this.categoriaId,
      required this.valor});

  factory Produto.fromJson(Map<String, dynamic> json) => _$ProdutoFromJson(fromJsonRepository(json));

  Produto fromRepository(Map<String, dynamic> json) => Produto(
        nome: json['nome'] as String,
        id: json['id'] as String,
        inclusao: DateTime.parse(json['inclusao'] as String),
        cor: json['cor'] as String,
        marca: json['marca'] as String,
        codigo: json['codigo'] as String,
        quantidade: json['quantidade'] as String,
        arquivoId: json['arquivoId'] as String?,
        valor: json['valor'] as String,
      );

  Map<String, dynamic> toJson() => _$ProdutoToJson(this);

  static InfosTableDatabase get table {
    final columns = {
      "Nome": "TEXT",
      "Cor": "TEXT",
      "Marca": "TEXT",
      "Codigo": "TEXT",
      "Quantidade": "TEXT",
      "ArquivoId": "TEXT",
      "Valor": "TEXT",
      "CategoriaId": "TEXT",
    };

    columns.addAll(Core.table.columns);
    return InfosTableDatabase(tableName: 'Produto', columns: columns);
  }
}
