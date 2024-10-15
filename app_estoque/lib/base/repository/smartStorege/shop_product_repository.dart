import 'package:app_estoque/base/models/smartStorege/ShopProduct/shop_product.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_product_repository.dart';

class ShopProductRepository extends BaseRepository<ShopProduct>
    implements IShopProductRepository {
  ShopProductRepository(super.infosTableDatabase, super.fromJson);
}
