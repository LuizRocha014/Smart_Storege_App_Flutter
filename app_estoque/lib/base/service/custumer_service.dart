import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icostumer_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/icostumer_service.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';

class CostumerService extends BaseService implements ICostumerService {
  @override
  Future<bool> postMethod() async {
    try {
      final repository = instanceManager.get<ICostumerRepository>();

      final list = await repository.getCustomerSync();
      final listMap = list.map((e) => e.toJson()).toList();
      final String urlApi = "$url/api/Costumer/PostAll";
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
      return false;
    }
  }

  @override
  Future<List<Costumer>> getAll({bool alteracaoNula = false}) async {
    try {
      final repository = instanceManager.get<ICostumerRepository>();
      final lastUpdate = sharedPreferences.getString("LastUpdate$runtimeType") ?? "";
      final String urlApi = "$url/api/Costumer/GetAllShopId";
      final retorno = await get(urlApi, query: {'shopId': shopUser.shopId, 'ultDate': lastUpdate});
      if (retorno.body == null) return throw Expando();
      var category = (retorno.body as List).map((e) => Costumer.fromJson(e)).toList();
      category.map((e) => e.sync = true);
      await repository.createList(category.map((e) => e.toJson()));
      sharedPreferences.setString("LastUpdate$runtimeType", DateTime.now().toIso8601String());
      return category;
    } catch (_) {
      return [];
    }
  }
}
