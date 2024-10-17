import 'package:app_estoque/base/models/smartStorege/ShopUser/shop_user.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
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
}
