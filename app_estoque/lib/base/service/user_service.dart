import 'package:app_estoque/base/models/acesso/acesso.dart';
import 'package:app_estoque/base/models/user/user.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';

class UserService extends BaseService implements IUserService {
  @override
  Future<User?> login(String userName, String passWord) async {
    try {
      final String urlApi = "$url/api/Usuario/login";
      final retorno = await get(urlApi, query: {"userName": userName, "passWord": passWord});
      if (temErroRequisicao(retorno)) throw Exception();
      if (retorno.body.toString().isEmpty) throw Exception();
      final conta = User.fromJson(retorno.body);
      return conta;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Acessos?>> buscaAcessos() async {
    try {
      final String urlApi = "$url/api/Acesso/GetAcessos";
      final retorno = await get(urlApi);
      if (temErroRequisicao(retorno)) throw Exception();
      final list = (retorno.body as List).map((e) => Acessos.fromJson(e as Map<String, dynamic>)).toList();
      return list;
    } catch (_) {
      return [];
    }
  }
}
