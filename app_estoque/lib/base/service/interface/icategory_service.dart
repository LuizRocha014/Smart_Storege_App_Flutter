import 'package:app_estoque/base/models/smartStorege/category/category.dart';

abstract class ICategoryService {
  Future<List<Category>> getAll();
}
