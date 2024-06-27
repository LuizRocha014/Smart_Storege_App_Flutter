import 'package:app_estoque/base/models/user/user.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';

class UserService extends BaseService implements IUserService {
  @override
  Future<User?> login(String userName, String passWord) async {
    try {
      final String urlApi = "$url/Usuario/login";
      final retorno = await get(urlApi, query: {"userName": userName, "passWord": passWord});
      if (temErroRequisicao(retorno)) throw Exception();
      if (retorno.body.toString().isEmpty) throw Exception();
      final conta = User.fromJson(retorno.body);
      return conta;
    } catch (_) {
      return null;
    }
  }
}
