import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icostumer_repository.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:componentes_lr/componentes_lr.dart';

class CostumerRepository extends BaseRepository<Costumer>
    implements ICostumerRepository {
  CostumerRepository(super.infosTableDatabase, super.fromJson);

  @override
  Future<List<Costumer>> getCostumers() async {
    try {
      final query = '''SELECT * FROM ${Costumer.table.tableName} 
                        WHERE SHOPID = '${shopUser.shopId}'
                        ORDER BY nome desc''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final listEntity = entity.map((e) => Costumer.fromJson(e)).toList();
      return listEntity;
    } catch (_) {
      return [];
    }
  }

  @override
  Future<List<Costumer>> getCustomerSync() async {
    try {
      final query = '''SELECT * FROM ${Costumer.table.tableName}
                        WHERE Sync = 0''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final listEntity = entity.map((e) => Costumer.fromJson(e)).toList();
      return listEntity;
    } catch (_) {
      return [];
    }
  }
}
