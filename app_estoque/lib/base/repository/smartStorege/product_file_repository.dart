import 'package:componentes_lr/componentes_lr.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_file_repository.dart';

class ProductFileRepository extends BaseRepository
    implements IProductFileRepository {
  ProductFileRepository(super.infosTableDatabase, super.fromJson);
}
