import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_estoque/utils/transaction_manager.dart';
import 'package:http/http.dart' as http;

class RequestManager {
  final http.Client client = http.Client();
  final TransactionManager _transactionManager = TransactionManager();

  static final RequestManager _instance = RequestManager._internal();
  factory RequestManager() => _instance;
  RequestManager._internal();

  Future<ResponseAPI> get(
    Uri url, {
    Map<String, String>? headers,
    int priority = 0,
  }) async {
    final response = await client.get(url, headers: headers).timeout(const Duration(minutes: 1));

    return ResponseAPI.response(response);
  }

  Future<ResponseAPI> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final response =
        await client.post(url, headers: headers, body: body, encoding: encoding).timeout(const Duration(minutes: 1));
    return ResponseAPI.response(response);
  }

  Future<ResponseAPI> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    final response =
        await client.put(url, headers: headers, body: body, encoding: encoding).timeout(const Duration(minutes: 1));
    return ResponseAPI.response(response);
  }

  Future<ResponseAPI> postMultipartRequest(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    required File file,
    Map<String, String>? fields,
  }) async {
    final queryString = query?.entries.map((e) => "${e.key}=${e.value}").join("&");
    final urlUri = Uri.parse(url + (queryString != null ? "?$queryString" : ""));
    headers ??= {};
    final request = http.MultipartRequest("POST", urlUri);
    request.headers.addAll(headers);
    request.files.add(
      http.MultipartFile.fromBytes(
        "file",
        await file.readAsBytes(),
        filename: file.path.split("/").last,
      ),
    );
    if (fields != null) {
      request.fields.addAll(fields);
    }
    final sendResponse = await _transactionManager
        .runTransaction<http.StreamedResponse>(() async => await request.send().timeout(const Duration(minutes: 1)));
    final response =
        await _transactionManager.runTransaction<http.Response>(() async => http.Response.fromStream(sendResponse));
    return ResponseAPI.response(response);
  }

  Future<ResponseAPI> postMultipartRequestBase64(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    required Uint8List uint,
    required String fileName,
    Map<String, String>? fields,
  }) async {
    final queryString = query?.entries.map((e) => "${e.key}=${e.value}").join("&");
    final urlUri = Uri.parse(url + (queryString != null ? "?$queryString" : ""));
    headers ??= {};
    final request = http.MultipartRequest("POST", urlUri);
    request.headers.addAll(headers);
    request.files.add(
      http.MultipartFile.fromBytes(
        "file",
        uint,
        filename: fileName,
      ),
    );
    if (fields != null) {
      request.fields.addAll(fields);
    }
    final sendResponse = await _transactionManager
        .runTransaction<http.StreamedResponse>(() async => await request.send().timeout(const Duration(minutes: 1)));
    final response =
        await _transactionManager.runTransaction<http.Response>(() async => http.Response.fromStream(sendResponse));
    return ResponseAPI.response(response);
  }
}

class ResponseAPI {
  dynamic body;
  late int statusCode;
  String? statusText;
  ResponseAPI(this.body, this.statusCode, {this.statusText});
  ResponseAPI.response(http.Response response) {
    try {
      body = jsonDecode(response.body);
    } catch (_) {
      body = response.body;
    }
    statusCode = response.statusCode;
    statusText = response.reasonPhrase;
  }
  // @override
  bool get hasError => statusCode != 200;

  bool get unauthorized => statusCode == 401;
}
