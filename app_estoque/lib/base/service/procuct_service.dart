import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iproduct_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class ProductService extends BaseService implements IProductService {
  @override
  Future<List<Product>> getAll() async {
    return [];
  }

  @override
  Future<List<Product>> postMethod() async {
    final repository = instanceManager.get<IProductRepository>();
    final list = await repository.getProdutoSync();
    final String urlApi = "$url/api/Product/PostAll";
    if (list.isEmpty) return [];
    final listMap = list.map((e) => e.toJson()).toList();
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
  }
}
