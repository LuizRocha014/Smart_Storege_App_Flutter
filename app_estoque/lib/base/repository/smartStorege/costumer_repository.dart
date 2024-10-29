import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:app_estoque/base/models/smartStorege/shopCustomer/shop_costumer.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icostumer_repository.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:componentes_lr/componentes_lr.dart';

class CostumerRepository extends BaseRepository<Costumer>
    implements ICostumerRepository {
  CostumerRepository(super.infosTableDatabase, super.fromJson);

  Future<List<Costumer>> getCostumers() async {
    try {
      final query = '''SELECT * FROM ${ShopCostumer.table.tableName} sc
                        LEFT JOIN ${Costumer.table.tableName} c on sc.costumerId = c.id
                        WHERE SC.SHOPID = '${shopUser.shopId}'
                        ORDER BY nome desc''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final listEntity = entity.map((e) => Costumer.fromJson(e)).toList();
      return listEntity;
    } catch (_) {
      return [];
    }
  }
}
