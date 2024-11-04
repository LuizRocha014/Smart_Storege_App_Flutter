import 'package:app_estoque/base/models/smartStorege/shopCustomer/shop_costumer.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_costumer_repository.dart';

class ShopCostumerRepository extends BaseRepository<ShopCostumer>
    implements IShopCostumerRepository {
  ShopCostumerRepository(super.infosTableDatabase, super.fromJson);
  @override
  Future<List<ShopCostumer>> getShopCustomerSync() async {
    try {
      final query = '''SELECT * FROM ${ShopCostumer.table.tableName} 
                        where Sync = 0''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final listEntity = entity.map((e) => ShopCostumer.fromJson(e)).toList();
      return listEntity;
    } catch (_) {
      return [];
    }
  }
}
