import 'package:app_estoque/base/models/smartStorege/shopCustomer/shop_costumer.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ishop_costumer_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/ishop_costumer_service.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class ShopCustomerService extends BaseService implements IShopCostumerService {
  @override
  Future<List<ShopCostumer>> getAll({bool alteracaoNula = false}) async {
    try {
      final repository = instanceManager.get<IShopCostumerRepository>();
      final String urlApi = "$url/api/ShopCustomer/GetAll";
      final retorno = await get(urlApi, query: {'shopId': shopUser.shopId});
      if (retorno.body == null) return throw Expando();
      var category =
          (retorno.body as List).map((e) => ShopCostumer.fromJson(e));
      category.map((e) => e.sync = true);
      await repository.createList(category.map((e) => e.toJson()));
      return [];
    } catch (_) {
      return [];
    }
  }

  @override
  Future<List<ShopCostumer>> postMethod() async {
    try {
      final repository = instanceManager.get<IShopCostumerRepository>();
      final list = await repository.getShopCustomerSync();
      final listMap = list.map((e) => e.toJson()).toList();
      final String urlApi = "$url/api/ShopCustomer/PostAll";
      final retorno = await post(urlApi, listMap);
      if (temErroRequisicao(retorno)) return [];
      final retornoBody = retorno.body as List;
      for (var element in list) {
        if (!retornoBody.contains(element.id)) {
          element.sync = true;
          repository.createOrReplace(element.toJson());
        }
      }
      return [];
    } catch (_) {
      return [];
    }
  }
}
