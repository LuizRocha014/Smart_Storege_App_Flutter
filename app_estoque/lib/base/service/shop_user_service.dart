import 'package:app_estoque/base/models/smartStorege/ShopUser/shop_user.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_user_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/ishop_user_service.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class ShopUserService extends BaseService implements IShopUserService {
  @override
  Future<List<ShopUser>> getAll() async {
    try {
      List<ShopUser> list = [];
      final repository = instanceManager.get<IShopUserRepository>();
      final String urlApi = "$url/api/ShopUser/GetAllId";
      final retorno = await get(urlApi, query: {'userId': loggerUser.id});
      if (retorno.body == null) return throw Expando();
      var category = (retorno.body as List).map((e) => ShopUser.fromJson(e));
      list.addAll(category);
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
