import '../entities/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> fetchAlbums();
  Future<Album> fetchAlbum(int id);
}
