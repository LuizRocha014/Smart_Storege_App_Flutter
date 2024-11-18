import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:app_estoque/base/models/smartStorege/Transaction/transaction.dart';
import 'package:app_estoque/base/models/smartStorege/venda/sale.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/isale_repository.dart';
import 'package:componentes_lr/componentes_lr.dart';

class SaleRepository extends BaseRepository<Sale> implements ISaleRepository {
  SaleRepository(super.infosTableDatabase, super.fromJson);

  @override
  Future<String> getValortotalVendas() async {
    final query =
        ''' SELECT SUM(SL.VALOR) as Valor FROM ${infosTableDatabase.tableName} SL
                      ''';
    final entity = await context.rawQuery(query);
    if (entity.isEmpty) return "0";
    //return entity.
    final retorn = entity.first['Valor'].toString();
    return retorn.contains("null") ? "0" : retorn;
  }

  @override
  Future<List<Sale>> getVendas() async {
    final query = ''' SELECT c.cnpj, * FROM ${infosTableDatabase.tableName} s
                      JOIN ${Transactions.table.tableName} t on t.SaleId = s.id
                      JOIN ${Costumer.table.tableName} c on t.CustomerId = c.id
                      ''';
    final entity = await context.rawQuery(query);
    if (entity.isEmpty) return [];
    //return entity.
    final returo = entity.map((e) => Sale.fromJson(e)).toList();
    return returo;
  }

  @override
  Future<List<Sale>> getItensAsync() async {
    try {
      final query = '''SELECT * FROM ${Sale.table.tableName} WHERE Sync = 0''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final entityList = entity.map((e) => Sale.fromJson(e)).toList();
      return entityList;
    } catch (_) {
      return [];
    }
  }
}
