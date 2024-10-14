import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/service/interface/ibase_service_get.dart';

abstract class ICategoryService extends IBaseServiceGet {
  @override
  Future<List<Category>> getAll();
}
