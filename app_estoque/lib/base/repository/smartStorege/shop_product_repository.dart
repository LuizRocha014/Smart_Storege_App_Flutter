import 'package:app_estoque/base/models/smartStorege/ShopProduct/shop_product.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_product_repository.dart';

class ShopProductRepository extends BaseRepository<ShopProduct> implements IShopProductRepository {
  ShopProductRepository(super.infosTableDatabase, super.fromJson);

  @override
  Future<List<ShopProduct>> getShopProduct() async {
    try {
      final query = '''SELECT * FROM ${infosTableDatabase.tableName} where Sync = 0 ''';
      final entiry = await context.rawQuery(query);
      if (entiry.isEmpty) return [];
      final entityList = entiry.map((e) => ShopProduct.fromJson(e)).toList();
      return entityList;
    } catch (_) {
      return [];
    }
  }
}
