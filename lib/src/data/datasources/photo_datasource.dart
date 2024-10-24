import '../../domain/entities/photo.dart';

abstract class PhotoDataSource {
  Future<List<Photo>> getPhotos();
  Future<Photo> getPhoto(int id);
  Future<Photo> createPhoto(Photo photo);
  Future<Photo> updatePhoto(int id, Photo photo);
  Future<void> deletePhoto(int id);
}
