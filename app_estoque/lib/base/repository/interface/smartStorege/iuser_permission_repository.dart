import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/models/smartStorege/userPermission/user_permission.dart';
import 'package:app_estoque/base/repository/interface/ibase_repository.dart';

abstract class IUserPermissionRepository
    extends IBaseRepository<UserPermission> {
  Future<List<Permission>> getPermissionUser();
}
