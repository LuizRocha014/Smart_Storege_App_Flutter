import 'package:app_estoque/base/models/smartStorege/user/user.dart';

abstract class IUserService {
  Future<User?> login(String userName, String passWord);
  Future<String?> carregaCep(String cep);
}
