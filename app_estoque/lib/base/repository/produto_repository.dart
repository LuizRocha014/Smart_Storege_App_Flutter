import 'dart:convert';

import 'package:app_estoque/base/models/arquivo/arquivo.dart';
import 'package:app_estoque/base/models/produtos/produto.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/iproduto_repository.dart';

class ProdutoRepository extends BaseRepository<Produto>
    implements IProdutoRepository {
  ProdutoRepository(super.infosTableDatabase, super.fromJson);

  @override
  Future<List<Produto>> getProdutos() async {
    final query = '''
     SELECT * FROM ${infosTableDatabase.tableName} PT
     JOIN ${Arquivo.table.tableName} A ON PT.ArquivoId = A.ID
          ''';
    final entitiesBanco = await context.rawQuery(query);
    if (entitiesBanco.isNullOrEmpty) return <Produto>[];
    final jsonString = jsonEncode(entitiesBanco);
    var listJson = jsonDecode(jsonString) as List;
    //final entities = listJson.map((e) => Produto.fromJson(e)).toList();
    return [];
  }
}
