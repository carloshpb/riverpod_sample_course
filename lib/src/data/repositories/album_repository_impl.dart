import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/album.dart';
import '../../domain/repositories/album_repository.dart';
import '../datasources/album_datasource.dart';
import '../datasources/album_datasource_impl.dart';

part 'album_repository_impl.g.dart';

@riverpod
AlbumRepository albumRepository(ref) {
  final albumDataSource = ref.read(albumDataSourceProvider);
  return AlbumRepositoryImpl._(albumDataSource);
}

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl._(this._albumDataSource);

  @override
  Future<List<Album>> fetchAlbums() async {
    return await _albumDataSource.getAlbums();
  }

  @override
  Future<Album> fetchAlbum(int id) async {
    return await _albumDataSource.getAlbum(id);
  }
}
