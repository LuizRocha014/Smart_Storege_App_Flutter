import 'package:app_estoque/base/models/user/user.dart';

abstract class IUserService {
  Future<User?> login(String userName, String passWord);
}
