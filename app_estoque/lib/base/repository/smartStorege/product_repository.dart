import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iproduct_repository.dart';

class ProductRepository extends BaseRepository<Product>
    implements IProductRepository {
  ProductRepository(super.infosTableDatabase, super.fromJson);
}
