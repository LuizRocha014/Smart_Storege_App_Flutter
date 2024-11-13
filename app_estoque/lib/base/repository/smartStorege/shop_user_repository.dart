import 'package:app_estoque/base/models/smartStorege/Shop/shop.dart';
import 'package:app_estoque/base/models/smartStorege/ShopUser/shop_user.dart';
import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_user_repository.dart';

class ShopUserRepository extends BaseRepository<ShopUser>
    implements IShopUserRepository {
  ShopUserRepository(super.infosTableDatabase, super.fromJson);

  @override
  Future<ShopUser> getShopUserId(String userId) async {
    final query = '''SELECT * FROM ${ShopUser.table.tableName} 
                     WHERE USERID = '$userId' and userMainShop = 1 ''';
    final entity = await context.rawQuery(query);
    return ShopUser.fromJson(entity.first);
  }

  @override
  Future<List<Shop>> getShop(String userId) async {
    final query = '''SELECT S.* FROM ${ShopUser.table.tableName} US
                    JOIN ${Shop.table.tableName} S ON US.shopId = S.ID
                     WHERE USERID = '$userId' ''';
    final entity = await context.rawQuery(query);
    final shop = entity.map((e) => Shop.fromJson(e)).toList();
    return shop;
  }
}
