import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:componentes_lr/componentes_lr.dart';

abstract class IPermissionRepository extends IBaseRepository<Permission> {
  Future<bool> validaAcessoUsuario();
}
