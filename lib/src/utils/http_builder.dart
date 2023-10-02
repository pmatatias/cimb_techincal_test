import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = 'https://jsonplaceholder.typicode.com';

abstract class HttpBuilder {
  Future<http.Response> getHandler(
      {required String path, Map<String, String>? headers});
  Future<http.Response> putHandler(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, String>? headers});
  Future<http.Response> deleteHandler(
      {required String path, Map<String, String>? headers});
  Future<http.Response> postHandler(
      {required Object? body,
      Map<String, String>? headers,
      required String path});
}

class HttpBuilderImpl implements HttpBuilder {
  const HttpBuilderImpl();

  @override
  Future<http.Response> getHandler(
      {required String path, Map<String, String>? headers}) async {
    final url = Uri.parse(baseUrl + path);

    print(url);
    final resp = await http.get(url, headers: headers);
    if (resp.statusCode == 200) {
      return resp;
    } else {
      throw ('Something went wrong with code ${resp.statusCode}\n${resp.reasonPhrase}');
    }
  }

  @override
  Future<http.Response> putHandler(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    final url = Uri.parse(baseUrl + path);
    print(url);
    final resp = await http.put(url, headers: headers, body: jsonEncode(body));
    if (resp.statusCode == 200) {
      return resp;
    } else {
      throw ('Something went wrong with code ${resp.statusCode}\n${resp.reasonPhrase}');
    }
  }

  @override
  Future<http.Response> deleteHandler(
      {required String path, Map<String, String>? headers}) async {
    final url = Uri.parse(baseUrl + path);

    final resp = await http.delete(url, headers: headers);
    if (resp.statusCode == 200) {
      return resp;
    } else {
      throw ('Something went wrong with code ${resp.statusCode}\n${resp.reasonPhrase}');
    }
  }

  @override
  Future<http.Response> postHandler({
    required Object? body,
    Map<String, String>? headers,
    required String path,
  }) async {
    final url = Uri.parse(baseUrl + path);

    final resp = await http.post(
      url,
      headers: headers ?? {'content-type': 'application/json'},
      body: jsonEncode(body),
    );
    if (resp.statusCode == 201) {
      return resp;
    } else {
      throw ('Something went wrong with code ${resp.statusCode}\n${resp.reasonPhrase}');
    }
  }
}
