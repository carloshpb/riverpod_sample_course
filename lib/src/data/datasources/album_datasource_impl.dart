import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample_course/src/core/extensions/response_extension.dart';
import '../../domain/entities/album.dart';
import 'album_datasource.dart';

part 'album_datasource_impl.g.dart';

@riverpod
AlbumDataSource albumDataSource(ref) => AlbumDataSourceImpl._();

class AlbumDataSourceImpl implements AlbumDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
  };

  AlbumDataSourceImpl._();

  @override
  Future<List<Album>> getAlbums() async {
    final response = await http.get(
      Uri.parse('$baseUrl/albums'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is List) {
      return List<Album>.from(result.map((item) => Album.fromJson(item)));
    } else {
      throw FormatException('Expected a list but got: ${result.runtimeType}');
    }
  }

  @override
  Future<Album> getAlbum(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/albums/$id'),
      headers: {...defaultHeaders},
    );
    response.handleResponse('GET');

    final result = json.decode(response.body);
    if (result is! Map<String, dynamic>) {
      throw FormatException('Expected a map but got: ${result.runtimeType}');
    }
    return Album.fromJson(result);
  }
}
