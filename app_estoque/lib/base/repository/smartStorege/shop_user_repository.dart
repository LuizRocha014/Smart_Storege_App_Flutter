import 'package:app_estoque/base/models/smartStorege/ShopUser/shop_user.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_user_repository.dart';

class ShopUserRepository extends BaseRepository<ShopUser>
    implements IShopUserRepository {
  ShopUserRepository(super.infosTableDatabase, super.fromJson);
}
