import 'package:app_estoque/base/models/smartStorege/userPermission/user_permission.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/iuser_permission_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iuser_permission_service.dart';
import 'package:app_estoque/utils/infos_statica.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPermissionService extends BaseService
    implements IUserPermissionService {
  @override
  Future<List<UserPermission>> getAll() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String urlApi = "$url/api/UserPermission/GetAll";
      final ultimaData =
          sharedPreferences.getString("UserPermissionUltimaData") ?? "";
      final retorno = await get(urlApi,
          query: {'userId': loggerUser.id, 'ultData': ultimaData});
      if (temErroRequisicao(retorno)) throw Exception();
      final list = (retorno.body as List)
          .map((e) => UserPermission.fromJson(e as Map<String, dynamic>))
          .toList();
      await instanceManager
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
