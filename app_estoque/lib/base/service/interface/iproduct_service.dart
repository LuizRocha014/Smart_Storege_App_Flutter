import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:componentes_lr/componentes_lr.dart';

abstract class IProductService extends IBaseServicePostAndGet<Product> {
  Future<bool> updateItem(Product item);
}
