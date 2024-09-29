import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/icategory_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';

class CategoryService extends BaseService implements ICategoryService {
  @override
  Future<List<Category>> getAll() async {
    try {
      int page = 1;
      List<Category> list = [];
      bool progresso = true;
      final repository = instanceManager.get<ICategoryRepository>();
      final String urlApi = "$url/api/Category/GetAll";
      do {
        final retorno = await get(urlApi, query: {
          "page": page,
          "pageSize": pageSize,
        });
        if (retorno.body == null) return throw Expando();
        var category = (retorno.body as List).map((e) => Category.fromJson(e));
        list.addAll(category);
        if (category.length < pageSize) progresso = false;
      } while (progresso);
      list.map((e) => repository.create(e.toJson()));
      return list;
    } catch (_) {
      return [];
    }
  }
}
