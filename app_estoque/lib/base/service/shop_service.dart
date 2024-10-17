import 'package:app_estoque/base/models/smartStorege/Shop/shop.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_user_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/ishop_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class ShopService extends BaseService implements IShopService {
  @override
  Future<List<Shop>> getAll() async {
    try {
      List<Shop> list = [];
      final repository = instanceManager.get<IShopUserRepository>();
      final String urlApi = "$url/api/Category/GetAll";
      final retorno = await get(urlApi, query: {});
      if (retorno.body == null) return throw Expando();
      var category = (retorno.body as List).map((e) => Shop.fromJson(e));
      list.addAll(category);
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
