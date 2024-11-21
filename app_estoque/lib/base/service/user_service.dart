import 'package:app_estoque/base/models/dto/endereco/endereco_dto.dart';
import 'package:app_estoque/base/service/base_service.dart';
import 'package:app_estoque/base/service/interface/iuser_service.dart';
import 'package:app_estoque/base/models/smartStorege/user/user.dart';

class UserService extends BaseService implements IUserService {
  @override
  Future<User?> login(String userName, String passWord) async {
    try {
      final String urlApi = "$url/api/User/Login";
      final retorno = await get(urlApi, query: {"userName": userName, "PassWord": passWord});
      if (temErroRequisicao(retorno)) throw Exception();
      if (retorno.body.toString().isEmpty) throw Exception();
      final conta = User.fromJson(retorno.body);
      return conta;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Endereco?> carregaCep(String cep) async {
    try {
      final String urlApi = "https://viacep.com.br/ws/$cep/json/";
      final retorno = await get(urlApi, query: {});
      if (temErroRequisicao(retorno)) throw Exception();
      if (retorno.body.toString().isEmpty) throw Exception();
      final endereco = Endereco.fromJson(retorno.body);
      return endereco;
    } catch (_) {
      return null;
    }
  }
}
