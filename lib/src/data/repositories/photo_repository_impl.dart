import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/photo.dart';
import '../../domain/repositories/photo_repository.dart';
import '../datasources/photo_datasource.dart';
import '../datasources/photo_datasource_impl.dart';

part 'photo_repository_impl.g.dart';

@riverpod
PhotoRepository photoRepository(ref) {
  final photoDataSource = ref.read(photoDataSourceProvider);
  return PhotoRepositoryImpl._(photoDataSource);
}

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl._(this._photoDataSource);

  @override
  Future<List<Photo>> fetchPhotos() async {
    return await _photoDataSource.getPhotos();
  }

  @override
  Future<Photo> fetchPhoto(int id) async {
    return await _photoDataSource.getPhoto(id);
  }

  @override
  Future<Photo> createPhoto(Photo photo) async {
    return await _photoDataSource.createPhoto(photo);
  }

  @override
  Future<Photo> updatePhoto(int id, Photo photo) async {
    return await _photoDataSource.updatePhoto(id, photo);
  }

  @override
  Future<void> deletePhoto(int id) async {
    return await _photoDataSource.deletePhoto(id);
  }
}
