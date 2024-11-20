import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/icategory_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:componentes_lr/componentes_lr.dart';

class CategoryService extends BaseService implements ICategoryService {
  @override
  Future<List> getAll({bool alteracaoNula = false}) async {
    try {
      List<Category> list = [];
      final repository = instanceManager.get<ICategoryRepository>();
      final lastUpdate =
          sharedPreferences.getString("LastUpdate$runtimeType") ?? "";
      final String urlApi = "$url/api/Category/GetAll";
      final retorno = await get(urlApi, query: {"ultDate": lastUpdate});
      if (retorno.body == null) return throw Expando();
      var category = (retorno.body as List).map((e) => Category.fromJson(e));
      list.addAll(category);
      await repository.createList(list.map((e) => e.toJson()));
      sharedPreferences.setString(
          "LastUpdate$runtimeType", DateTime.now().toIso8601String());
      return list;
    } catch (_) {
      return [];
    }
  }
  // @override
  // Future<List<Category>> getAll() async {

  // }
}
