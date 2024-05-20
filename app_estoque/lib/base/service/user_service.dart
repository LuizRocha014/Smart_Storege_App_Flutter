import 'package:app_estoque/base/service/base_service.dart';

class UserService extends BaseService {

Future<bool> login(String userName, String passWord) async{
try {
   final retorno = await get("Usuario/login",{"userName":userName,"passWord":passWord});
   if(retorno.toString().isEmpty ) throw Exception();
   return true;
} catch (_) {
  return false;
}

}

}