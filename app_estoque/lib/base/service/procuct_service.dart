import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iproduct_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';

class ProductService extends BaseService implements IProductService {
  @override
  Future<List<Product>> getAll({bool alteracaoNula = false}) async {
    try {
      final repository = instanceManager.get<IProductRepository>();
      final lastUpdate =
          sharedPreferences.getString("LastUpdate$runtimeType") ?? "";
      final String urlApi = "$url/api/Product/GetAll";
      final retorno = await get(urlApi, query: {"ultDate": lastUpdate});
      var itens = (retorno.body as List).map((e) => Product.fromJson(e));
      itens.map((e) => e.sync = true);
      await repository.createList(itens.map((e) => e.toJson()));
      sharedPreferences.setString(
          "LastUpdate$runtimeType", DateTime.now().toIso8601String());
      return [];
    } catch (_) {
      return [];
    }
  }

  @override
  Future<bool> postMethod() async {
    try {
      final repository = instanceManager.get<IProductRepository>();
      final list = await repository.getItensAsync();
      if (list.isEmpty) return false;
      final String urlApi = "$url/api/Product/PostAll";
      Future.wait(list.map((e) {
        return post(
          urlApi,
          e.toJson(),
        ).then((retorno) {
          if (!temErroRequisicao(retorno)) {
            e.sync = true;
            repository.createOrReplace(e.toJson());
          }
        });
      }));
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> updateItem(Product item) async {
    try {
      final repository = instanceManager.get<IProductRepository>();
      final String urlApi = "$url/api/Product/AddProductShop";

      await post(
        urlApi,
        item.toJson(),
      ).then((retorno) async {
        if (!temErroRequisicao(retorno)) {
          item.sync = true;
          repository.createOrReplace(item.toJson());
        }
      });
      return true;
    } catch (_) {
      return false;
    }
  }
}
