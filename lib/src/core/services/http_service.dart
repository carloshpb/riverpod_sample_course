import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';

import '../errors/http_exception.dart';

part 'http_service.g.dart';

@riverpod
HttpService httpService(HttpServiceRef ref, String url) =>
    HttpService._(baseUrl: url);

class HttpService {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  HttpService._({required this.baseUrl, Map<String, String>? defaultHeaders})
      : defaultHeaders = defaultHeaders ?? {'Content-Type': 'application/json'};

  Future<http.Response> get(String endpoint,
      {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {...defaultHeaders, ...?headers},
    );
    _handleResponse(response, 'GET');
    return response;
  }

  Future<http.Response> post(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {...defaultHeaders, ...?headers},
      body: jsonEncode(body),
    );
    _handleResponse(response, 'POST');
    return response;
  }

  Future<http.Response> put(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {...defaultHeaders, ...?headers},
      body: jsonEncode(body),
    );
    _handleResponse(response, 'PUT');
    return response;
  }

  Future<http.Response> delete(String endpoint,
      {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: {...defaultHeaders, ...?headers},
    );
    _handleResponse(response, 'DELETE');
    return response;
  }

  void _handleResponse(http.Response response, String httpMethod) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        code: response.statusCode,
        httpMethod: httpMethod,
        header: response.headers.toString(),
        body: response.body,
      );
    }
  }
}
