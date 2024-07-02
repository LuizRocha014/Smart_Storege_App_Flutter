import 'package:app_estoque/base/models/acesso/acesso.dart';
import 'package:app_estoque/base/models/user/user.dart';

abstract class IUserService {
  Future<User?> login(String userName, String passWord);
  Future<List<Acessos?>> buscaAcessos();
}
