import 'dart:convert';
import 'dart:typed_data';

import 'package:app_estoque/utils/request_manager.dart';

class BaseService {
  late String url = "http://192.168.6.137:5001";
  late final int pageSize;
  late final Duration timeout;
  late final RequestManager requestManager;
  BaseService() {
    timeout = const Duration(seconds: 30);
    pageSize = 500;
    requestManager = RequestManager();
  }

  //Override do método post para tratar caso o token não esteja autorizado
  Future<ResponseAPI> post<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final queryString =
        query?.entries.map((e) => "${e.key}=${e.value}").join("&");
    final urlUri =
        Uri.parse(url + (queryString != null ? "?$queryString" : ""));
    headers ??= {};
    if (body != null) {
      headers.addAll({"Content-Type": contentType ?? "application/json"});
    }
    final response = await requestManager.post(
      urlUri,
      headers: headers,
      body: body == null ? null : jsonEncode(body),
    );
    if (response.statusCode != 401) return response;
    // final String token = await getToken(getTokenForcado: true);
    // headers.remove("Authorization");
    // headers.addAll({"Authorization": "Bearer $token"});
    return await requestManager.post(
      urlUri,
      headers: headers,
      body: body == null ? null : jsonEncode(body),
    );
  }

  Future<ResponseAPI> postMultipartRequestBase64(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    required Uint8List uint,
    required String fileName,
    Map<String, String>? fields,
  }) async {
    return await requestManager.postMultipartRequestBase64(
      url,
      headers: headers,
      query: query,
      uint: uint,
      fileName: fileName,
      fields: fields,
    );
  }

  //Override do método put para tratar caso o token não esteja autorizado
  Future<ResponseAPI> put<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final queryString =
        query?.entries.map((e) => "${e.key}=${e.value}").join("&");
    final urlUri =
        Uri.parse(url + (queryString != null ? "?$queryString" : ""));
    headers ??= {};
    final response = await requestManager.put(
      urlUri,
      headers: headers,
      body: body == null ? null : jsonEncode(body),
    );
    if (response.statusCode != 401) return response;
    // final String token = await getToken(getTokenForcado: true);
    // headers.remove("Authorization");
    // headers.addAll({"Authorization": "Bearer $token"});
    return await requestManager.put(
      urlUri,
      headers: headers,
      body: body == null ? null : jsonEncode(body),
    );
  }

  //Override do método post para tratar caso o token não esteja autorizado
  Future<ResponseAPI> get(
    String url, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    int priority = 0,
  }) async {
    final queryString =
        query?.entries.map((e) => "${e.key}=${e.value}").join("&");
    final urlUri =
        Uri.parse(url + (queryString != null ? "?$queryString" : ""));
    headers ??= {};
    final response = await requestManager
        .get(
          urlUri,
          headers: headers,
          priority: priority,
        )
        .timeout(timeout);
    if (response.statusCode != 403) return response;
    // final String token = await getToken(getTokenForcado: true);
    // headers.remove("Authorization");
    // headers.addAll({"Authorization": "Bearer $token"});
    return await requestManager.get(
      urlUri,
      headers: headers,
    );
  }

  // Future<List<dynamic>> getSinc(dynamic repository, dynamic model) async {
  //   try {
  //     int pagina = 1;
  //     int quantidadeTentativaBusca = 0;
  //     List<dynamic> list = [];
  //     final String rulFormat = "$url/v1/AprAssinaturaApr/Get";
  //     //final token = await getToken();
  //     do {
  //       final retorno = await get(
  //         rulFormat,
  //         query: {
  //           "ultimaData": null,
  //           "limit": pageSize,
  //           "index": pagina,
  //         },
  //         // headers: {"Authorization": "Bearer $token"},
  //       );
  //       // Tenta buscar 3 vezes caso ocorra erro, se não conseguir passa para a próxima página
  //       if (temErroRequisicao(retorno) && quantidadeTentativaBusca <= 3) {
  //         quantidadeTentativaBusca++;
  //         continue;
  //       } else {
  //         list = (retorno.body as List).map((e) => model.fromJson(e as Map<String, dynamic>)).toList();
  //         repository.createList(list.map((e) => e.toJson()));
  //         quantidadeTentativaBusca = 0;
  //       }
  //       pagina++;
  //     } while (list.length == pageSize);

  //     return list;
  //   } catch (e) {
  //     return [];
  //   }
  // }

  bool temErroRequisicao(ResponseAPI retorno) => retorno.hasError;
}
