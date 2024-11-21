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
      //final shopId = sharedPreferences.getString("ShopId");
      if (shopUser.id.isEmpty) return [];
      final retorno = await get(urlApi, query: {'shopId': shopUser.id});
      var itens = (retorno.body as List).map((e) => ShopCostumer.fromJson(e));
      itens.map((e) => e.sync = true);
      await repository.createList(itens.map((e) => e.toJson()));
      return [];
    } catch (_) {
      return [];
    }
  }

  @override
  Future<bool> postMethod() async {
    try {
      final repository = instanceManager.get<IShopCostumerRepository>();
      final list = await repository.getShopCustomerSync();
      final String urlApi = "$url/api/ShopCustomer/PostAll";
      if (list.isEmpty) return false;
      final listMap = list.map((e) => e.toJson()).toList();
      final retorno = await post(urlApi, listMap);
      if (temErroRequisicao(retorno)) return false;
      final retornoBody = retorno.body as List;
      for (var element in list) {
        if (!retornoBody.contains(element.id)) {
          element.sync = true;
          repository.createOrReplace(element.toJson());
        }
      }
      return true;
    } catch (_) {
      return true;
    }
  }
}
