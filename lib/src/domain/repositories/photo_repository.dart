import '../entities/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> fetchPhotos();
  Future<Photo> fetchPhoto(int id);
  Future<Photo> createPhoto(Photo photo);
  Future<Photo> updatePhoto(int id, Photo photo);
  Future<void> deletePhoto(int id);
}
