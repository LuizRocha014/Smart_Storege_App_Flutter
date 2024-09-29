import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/icategory_repository.dart';

class CategoryRepository extends BaseRepository implements ICategoryRepository {
  CategoryRepository(super.infosTableDatabase, super.fromJson);
}
