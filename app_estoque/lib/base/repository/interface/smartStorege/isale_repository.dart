import 'package:app_estoque/base/models/smartStorege/product/product.dart';
import 'package:app_estoque/base/models/smartStorege/venda/sale.dart';
import 'package:componentes_lr/componentes_lr.dart';

abstract class ISaleRepository extends IBaseRepository<Sale> {
  Future<String> getValortotalVendas();
  Future<List<Sale>> getVendas();
  Future<List<Sale>> getItensAsync();
  Future<List<Product>> getProduct(String saleId);
}
