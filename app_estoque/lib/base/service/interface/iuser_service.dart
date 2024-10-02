import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/models/smartStorege/user/user.dart';
import 'package:app_estoque/base/models/smartStorege/userPermission/user_permission.dart';

abstract class IUserService {
  Future<User?> login(String userName, String passWord);
  Future<List<Permission?>> buscaAcessos();
  Future<List<UserPermission?>> buscaUserPermission(String userId);
}
