import 'package:app_estoque/base/models/smartStorege/venda/sale.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/isale_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/isale_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class SaleService extends BaseService implements ISaleService {
  @override
  Future<bool> postMethod() async {
    try {
      final repository = instanceManager.get<ISaleRepository>();
      final list = await repository.getItensAsync();
      if (list.isEmpty) return false;
      final listMap = list.map((e) => e.toJson()).toList();
      final String urlApi = "$url/api/Sale/PostAll";
      post(
        urlApi,
        listMap,
      ).then((retorno) {
        if (!temErroRequisicao(retorno)) {}
      });

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<Sale>> getAll({bool alteracaoNula = false}) async {
    try {
      final repository = instanceManager.get<ISaleRepository>();
      final String urlApi = "$url/api/Shop/GetAll";
      final retorno = await get(urlApi, query: {});
      if (retorno.body == null) return [];
      var list = (retorno.body as List).map((e) => Sale.fromJson(e)).toList();
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
