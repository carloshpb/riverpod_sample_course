import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample_course/src/core/extensions/response_extension.dart';
import '../../domain/entities/comment.dart';
import 'comment_datasource.dart';

part 'comment_datasource_impl.g.dart';

@riverpod
CommentDataSource commentDataSource(ref) => CommentDataSourceImpl._();

class CommentDataSourceImpl implements CommentDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
  };

  CommentDataSourceImpl._();

  @override
  Future<List<Comment>> getComments() async {
    final response = await http.get(
      Uri.parse('$baseUrl/comments'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is List) {
      return List<Comment>.from(result.map((item) => Comment.fromJson(item)));
    } else {
      throw FormatException('Expected a list but got: ${result.runtimeType}');
    }
  }

  @override
  Future<Comment> getComment(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/comments/$id'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Comment.fromJson(result);
  }

  @override
  Future<Comment> createComment(Comment comment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/comments'),
      headers: {
        ...defaultHeaders,
        'charset': 'utf-8',
      },
      body: jsonEncode(comment.toJson()), // Convert Comment to JSON
    );
    response.handleResponse('POST');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Comment.fromJson(result);
  }

  @override
  Future<Comment> updateComment(int id, Comment comment) async {
    final response = await http.put(
      Uri.parse('$baseUrl/comments/$id'),
      headers: {
        ...defaultHeaders,
        'charset': 'utf-8',
      },
      body: jsonEncode(comment.toJson()), // Convert Comment to JSON
    );
    response.handleResponse('PUT');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Comment.fromJson(result);
  }

  @override
  Future<void> deleteComment(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/comments/$id'),
    );
    response.handleResponse('DELETE');
  }
}
