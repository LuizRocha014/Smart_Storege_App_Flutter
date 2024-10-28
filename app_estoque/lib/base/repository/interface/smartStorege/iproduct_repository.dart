import 'package:app_estoque/base/models/dto/product_dto/product_dto.dart';
import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:componentes_lr/componentes_lr.dart';

abstract class IProductRepository extends IBaseRepository<Product> {
  Future<List<ProdutctDto>> getProdutos();
}
