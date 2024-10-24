import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample_course/src/core/extensions/response_extension.dart';
import '../../domain/entities/post.dart';
import 'post_datasource.dart';

part 'post_datasource_impl.g.dart';

@riverpod
PostDataSource postDataSource(ref) => PostDataSourceImpl._();

class PostDataSourceImpl implements PostDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json'
  };

  PostDataSourceImpl._();

  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');
    final result = json.decode(response.body);
    if (result is List) {
      for (var item in result) {
        if (item is! Map<String, dynamic>) {
          throw FormatException('Invalid item in list: $item');
        }
      }
      return List<Post>.from(result.map((item) => Post.fromJson(item)));
    } else {
      throw FormatException('Expected a list but got: ${result.runtimeType}');
    }
  }

  @override
  Future<Post> getPost(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');
    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Post.fromJson(result);
  }

  @override
  Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {
        ...defaultHeaders,
        'charset': 'utf-8',
      },
      body: jsonEncode(post),
    );
    response.handleResponse('POST');
    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Post.fromJson(result);
  }

  @override
  Future<Post> updatePost(int id, Post post) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {
        ...defaultHeaders,
        'charset': 'utf-8',
      },
      body: jsonEncode(post),
    );
    response.handleResponse('POST');
    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Post.fromJson(result);
  }

  @override
  Future<void> deletePost(int id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts/$id'),
    );
    response.handleResponse('DELETE');
  }
}
