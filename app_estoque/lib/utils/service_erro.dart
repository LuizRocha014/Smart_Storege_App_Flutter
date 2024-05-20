import 'package:http/http.dart';

mixin ErrorService{

 bool temErroServive(Response responde){
  try {
    if(responde.statusCode == 200) {
      return false;
    } else {
      return true;
    }
  } catch (_) {
    return true;
  }
 }

 bool logonCorreto(Response responde){
  try {
    if(responde.body == "true") {
      return true;
    } else {
      return false;
    }
  } catch (_) {
    return false;
  }
 }

}