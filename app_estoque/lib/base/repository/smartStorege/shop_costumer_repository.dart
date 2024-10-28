import 'package:app_estoque/base/models/smartStorege/shopCustomer/shop_costumer.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_costumer_repository.dart';

class ShopCostumerRepository extends BaseRepository<ShopCostumer>
    implements IShopCostumerRepository {
  ShopCostumerRepository(super.infosTableDatabase, super.fromJson);
}
