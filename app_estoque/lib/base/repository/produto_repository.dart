
// class ProdutoRepository extends BaseRepository<Produto>
//     implements IProdutoRepository {
//   ProdutoRepository(super.infosTableDatabase, super.fromJson);

//   @override
//   Future<List<Produto>> getProdutos() {
//     return null;
//   }

//   // @override
//   // Future<List<Produto>> getProdutos() async {
//   //   final query = '''
//   //    SELECT * FROM ${infosTableDatabase.tableName} PT
//   //    JOIN ${Arquivo.table.tableName} A ON PT.ArquivoId = A.ID
//   //         ''';
//   //   final entitiesBanco = await context.rawQuery(query);
//   //   if (entitiesBanco.isNullOrEmpty) return <Produto>[];
//   //   final jsonString = jsonEncode(entitiesBanco);
//   //   final listJson = jsonDecode(jsonString) as List;
//   //   //final entities = listJson.map((e) => Produto.fromJson(e)).toList();
//   //   return [];
//   // }
// }
