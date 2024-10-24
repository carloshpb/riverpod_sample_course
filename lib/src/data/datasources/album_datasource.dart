import '../../domain/entities/album.dart';

abstract class AlbumDataSource {
  Future<List<Album>> getAlbums();
  Future<Album> getAlbum(int id);
}
