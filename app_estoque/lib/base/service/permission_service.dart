import 'package:app_estoque/base/models/smartStorege/permission/permission.dart';
import 'package:app_estoque/base/repository/interface/smartStorege/ipermission_repository.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/ipermission_service.dart';
import 'package:app_estoque/utils/utils_exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionService extends BaseService implements IPermissionService {
  @override
  Future<List<Permission>> getAll({bool alteracaoNula = false}) async {
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
      await instanceManager
          .get<IPermissionRepository>()
          .createList(list.map((e) => e.toJson()));
      sharedPreferences.setString(
          "PermissionServiceUltimaData", "${DateTime.now()}");
      return list;
    } catch (_) {
      return [];
    }
  }
}
