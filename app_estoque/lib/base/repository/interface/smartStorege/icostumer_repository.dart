import 'package:app_estoque/base/models/smartStorege/Customer/costumer.dart';
import 'package:componentes_lr/componentes_lr.dart';

abstract class ICostumerRepository extends IBaseRepository<Costumer> {
  Future<List<Costumer>> getCostumers();
  Future<List<Costumer>> getCustomerSync();
}
