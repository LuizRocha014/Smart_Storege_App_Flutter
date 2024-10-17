import 'package:app_estoque/base/models/smartStorege/ProductFile/product_file.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_file_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iproduct_file_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class ProductFileService extends BaseService implements IProductFileService {
  @override
  Future<List<ProductFile>> getAll() async {
    try {
      List<ProductFile> list = [];
      final repository = instanceManager.get<IProductFileRepository>();
      final String urlApi = "$url/api/Category/GetAll";
      final retorno = await get(urlApi, query: {});
      if (retorno.body == null) return throw Expando();
      var category = (retorno.body as List).map((e) => ProductFile.fromJson(e));
      list.addAll(category);
      await repository.createList(list.map((e) => e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
