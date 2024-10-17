import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_repository.dart';

class ShopRepository extends BaseRepository implements IShopRepository {
  ShopRepository(super.infosTableDatabase, super.fromJson);
}
