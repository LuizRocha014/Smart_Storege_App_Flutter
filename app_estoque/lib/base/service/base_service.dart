import 'package:http/http.dart' as http;

class BaseService {
  final url = "http://192.168.56.1:5031";

  Future<dynamic> get(String urlcomplete, Map<String, String> map,
      {Map<String, String>? headers}) async {
    var response = await http.get(Uri.http(url,"api/$urlcomplete", map));
    return response.body;
  }

  Future<dynamic> post(
    String urlcomplete, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final urlFinal = url + urlcomplete;
    var response =
        await http.post(Uri.parse(urlFinal), headers: headers, body: body);
    return response.body;
  }
}
