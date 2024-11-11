import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iproduct_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class ProductService extends BaseService implements IProductService {
  @override
  Future<List<Product>> getAll({bool alteracaoNula = false}) async {
    return [];
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
}
