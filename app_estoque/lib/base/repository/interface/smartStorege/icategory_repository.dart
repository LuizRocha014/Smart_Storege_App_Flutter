import 'package:app_estoque/base/models/smartStorege/category/category.dart';
import 'package:app_estoque/base/repository/interface/ibase_repository.dart';

abstract class ICategoryRepository extends IBaseRepository<Category> {
  Future<List<Category>> getAllListCategory();
}
