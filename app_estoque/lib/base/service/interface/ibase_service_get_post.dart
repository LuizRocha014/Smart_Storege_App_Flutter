import 'package:app_estoque/base/service/interface/ibase_service_get.dart';

abstract class IBaseServiceGetGetAndPost<T> implements IBaseServiceGet {
  @override
  Future<List<T>> getAll();
  Future<List<T>> postMethod();
}
