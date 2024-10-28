import 'package:app_estoque/base/models/smartStorege/ShopUser/shop_user.dart';
import 'package:componentes_lr/componentes_lr.dart';

abstract class IShopUserRepository extends IBaseRepository<ShopUser> {
  Future<ShopUser> getShopUserId(String userId);
}
