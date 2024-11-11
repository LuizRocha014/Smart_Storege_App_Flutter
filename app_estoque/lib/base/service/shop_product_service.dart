import 'package:app_estoque/base/models/smartStorege/ShopProduct/shop_product.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_product_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/ishop_product_service.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class ShopProductService extends BaseService implements IShopProductService {
  @override
  Future<List<ShopProduct>> getAll({bool alteracaoNula = false}) async {
    try {
      List<ShopProduct> list = [];
      final repository = instanceManager.get<IShopProductRepository>();
      final String urlApi = "$url/api/ShopProduct/GetAll";
      final retorno = await get(urlApi, query: {'userId': loggerUser.id});
      if (retorno.body == null) return throw Expando();
      var category = (retorno.body as List).map((e) => ShopProduct.fromJson(e));
      list.addAll(category);
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }

  @override
  Future<bool> postMethod() async {
    return false;
  }
}
