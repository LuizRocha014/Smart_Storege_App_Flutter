import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/repository/base_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ipermission_repository.dart';

class PermissionRepository extends BaseRepository<Permission>
    implements IPermissionRepository {
  PermissionRepository(super.infosTableDatabase, super.fromJson);
}
