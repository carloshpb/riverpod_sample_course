import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample_course/src/core/extensions/response_extension.dart';
import '../../domain/entities/todo.dart';
import 'todo_datasource.dart';

part 'todo_datasource_impl.g.dart';

@riverpod
TodoDataSource todoDataSource(ref) => TodoDataSourceImpl._();

class TodoDataSourceImpl implements TodoDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
  };

  TodoDataSourceImpl._();

  @override
  Future<List<Todo>> getTodos() async {
    final response = await http.get(
      Uri.parse('$baseUrl/todos'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is List) {
      return List<Todo>.from(result.map((item) => Todo.fromJson(item)));
    } else {
      throw FormatException('Expected a list but got: ${result.runtimeType}');
    }
  }

  @override
  Future<Todo> getTodo(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Todo.fromJson(result);
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    final response = await http.post(
      Uri.parse('$baseUrl/todos'),
      headers: {
        ...defaultHeaders,
        'charset': 'utf-8',
      },
      body: jsonEncode(todo.toJson()), // Convert Todo to JSON
    );
    response.handleResponse('POST');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Todo.fromJson(result);
  }

  @override
  Future<Todo> updateTodo(int id, Todo todo) async {
    final response = await http.put(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {
        ...defaultHeaders,
        'charset': 'utf-8',
      },
      body: jsonEncode(todo.toJson()), // Convert Todo to JSON
    );
    response.handleResponse('PUT');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Todo.fromJson(result);
  }

  @override
  Future<void> deleteTodo(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/todos/$id'),
    );
    response.handleResponse('DELETE');
  }
}
