import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_repository.dart';

class ShopRepository extends BaseRepository implements IShopRepository {
  ShopRepository(super.infosTableDatabase, super.fromJson);
}
