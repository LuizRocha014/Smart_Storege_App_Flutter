import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iproduct_service.dart';

class ProductService extends BaseService implements IProducService {
  @override
  Future<List<Product>> getAll() async {
    return [];
  }

  @override
  Future<List<Product>> postMethod() async {
    return [];
  }
}
