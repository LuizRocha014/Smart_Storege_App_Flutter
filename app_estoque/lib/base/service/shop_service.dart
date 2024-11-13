import 'package:app_estoque/base/models/smartStorege/Shop/shop.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/ishop_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class ShopService extends BaseService implements IShopService {
  @override
  Future<List<Shop>> getAll({bool alteracaoNula = false}) async {
    try {
      final repository = instanceManager.get<IShopRepository>();
      final String urlApi = "$url/api/Shop/GetAll";
      final retorno = await get(urlApi, query: {});
      if (retorno.body == null) return [];
      var list = (retorno.body as List).map((e) => Shop.fromJson(e)).toList();
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
