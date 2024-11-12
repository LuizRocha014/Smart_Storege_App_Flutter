import 'package:app_estoque/base/models/smartStorege/ShopProduct/shop_product.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_product_repository.dart';

class ShopProductRepository extends BaseRepository<ShopProduct>
    implements IShopProductRepository {
  ShopProductRepository(super.infosTableDatabase, super.fromJson);

  @override
  Future<List<ShopProduct>> getItensSync() async {
    try {
      final query =
          '''SELECT * FROM ${ShopProduct.table.tableName} WHERE Sync = 0''';
      final entity = await context.rawQuery(query);
      if (entity.isEmpty) return [];
      final entityList = entity.map((e) => ShopProduct.fromJson(e)).toList();
      return entityList;
    } catch (_) {
      return [];
    }
  }
}
