import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample_course/src/core/extensions/response_extension.dart';
import '../../domain/entities/user.dart';
import 'user_datasource.dart';

part 'user_datasource_impl.g.dart';

@riverpod
UserDataSource userDataSource(ref) => UserDataSourceImpl._();

class UserDataSourceImpl implements UserDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
  };

  UserDataSourceImpl._();

  @override
  Future<List<User>> getUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is List) {
      return List<User>.from(result.map((item) => User.fromJson(item)));
    } else {
      throw FormatException('Expected a list but got: ${result.runtimeType}');
    }
  }

  @override
  Future<User> getUser(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return User.fromJson(result);
  }
}
