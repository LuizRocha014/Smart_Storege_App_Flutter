import 'package:app_estoque/base/dto/product_dto/product_dto.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/repository/interface/ibase_repository.dart';

abstract class IProductRepository extends IBaseRepository<Product> {
  Future<List<ProdutctDto>> getProdutos();
}
