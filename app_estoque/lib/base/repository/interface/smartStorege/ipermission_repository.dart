import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/repository/interface/ibase_repository.dart';

abstract class IPermissionRepository extends IBaseRepository<Permission> {
  Future<bool> validaAcessoUsuario();
}
