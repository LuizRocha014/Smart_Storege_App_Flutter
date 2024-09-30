import 'package:app_estoque/base/models/smartStorege/userPermission/user_permission.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iuser_permission_repository.dart';

class UserPermissionRepository extends BaseRepository<UserPermission>
    implements IUserPermissionRepository {
  UserPermissionRepository(super.infosTableDatabase, super.fromJson);
}
