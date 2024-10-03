import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/models/smartStorege/userPermission/user_permission.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ipermission_repository.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iuser_permission_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/base/models/smartStorege/user/user.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends BaseService implements IUserService {
  @override
  Future<User?> login(String userName, String passWord) async {
    try {
      final String urlApi = "$url/api/User/Login";
      final retorno = await get(urlApi,
          query: {"userName": userName, "PassWord": passWord});
      if (temErroRequisicao(retorno)) throw Exception();
      if (retorno.body.toString().isEmpty) throw Exception();
      final conta = User.fromJson(retorno.body);
      await buscaAcessos();
      await buscaUserPermission(conta.id);
      return conta;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Permission?>> buscaAcessos() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String urlApi = "$url/api/Permission/GetAcessos";
      final ultimaData =
          sharedPreferences.getString("PermissionServiceUltimaData") ?? "";

      final retorno = await get(urlApi, query: {'ultData': ultimaData});
      if (temErroRequisicao(retorno)) throw Exception();
      final list = (retorno.body as List)
          .map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList();
      instanceManager
          .get<IPermissionRepository>()
          .createList(list.map((e) => e.toJson()));
      sharedPreferences.setString(
          "PermissionServiceUltimaData", "${DateTime.now()}");
      return list;
    } catch (_) {
      return [];
    }
  }

  @override
  Future<List<UserPermission?>> buscaUserPermission(String userId) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String urlApi = "$url/api/UserPermission/GetAll";
      final ultimaData =
          sharedPreferences.getString("UserPermissionUltimaData") ?? "";
      final retorno =
          await get(urlApi, query: {'userId': userId, 'ultData': ultimaData});
      if (temErroRequisicao(retorno)) throw Exception();
      final list = (retorno.body as List)
          .map((e) => UserPermission.fromJson(e as Map<String, dynamic>))
          .toList();
      instanceManager
          .get<IUserPermissionRepository>()
          .createList(list.map((e) => e.toJson()));
      sharedPreferences.setString(
          "UserPermissionUltimaData", "${DateTime.now()}");
      return list;
    } catch (_) {
      return [];
    }
  }
}
