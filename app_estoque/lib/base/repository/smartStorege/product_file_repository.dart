import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_file_repository.dart';

class ProductFileRepository extends BaseRepository
    implements IProductFileRepository {
  ProductFileRepository(super.infosTableDatabase, super.fromJson);
}
