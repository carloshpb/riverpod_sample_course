import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample_course/src/core/extensions/response_extension.dart';
import '../../domain/entities/photo.dart';
import 'photo_datasource.dart';

part 'photo_datasource_impl.g.dart';

@riverpod
PhotoDataSource photoDataSource(ref) => PhotoDataSourceImpl._();

class PhotoDataSourceImpl implements PhotoDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
  };

  PhotoDataSourceImpl._();

  @override
  Future<List<Photo>> getPhotos() async {
    final response = await http.get(
      Uri.parse('$baseUrl/photos'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is List) {
      return List<Photo>.from(result.map((item) => Photo.fromJson(item)));
    } else {
      throw FormatException('Expected a list but got: ${result.runtimeType}');
    }
  }

  @override
  Future<Photo> getPhoto(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/photos/$id'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Photo.fromJson(result);
  }

  @override
  Future<Photo> createPhoto(Photo photo) async {
    final response = await http.post(
      Uri.parse('$baseUrl/photos'),
      headers: {...defaultHeaders, 'charset': 'utf-8'},
      body: jsonEncode(photo),
    );
    response.handleResponse('POST');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Photo.fromJson(result);
  }

  @override
  Future<Photo> updatePhoto(int id, Photo photo) async {
    final response = await http.put(
      Uri.parse('$baseUrl/photos/$id'),
      headers: {...defaultHeaders, 'charset': 'utf-8'},
      body: jsonEncode(photo),
    );
    response.handleResponse('PUT');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Photo.fromJson(result);
  }

  @override
  Future<void> deletePhoto(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/photos/$id'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('DELETE');
  }
}
