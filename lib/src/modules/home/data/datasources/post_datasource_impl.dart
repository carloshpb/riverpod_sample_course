import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/api_service.dart';

part 'post_datasource.g.dart';

class PostDataSourceImpl {
  final ApiService apiService;

  PostDataSource(this.apiService);

  Future<List<Map<String, dynamic>>> getPosts() async {
    return await apiService.get('/posts');
  }

  Future<Map<String, dynamic>> getPost(int id) async {
    return await apiService.get('/posts/$id');
  }

  Future<Map<String, dynamic>> createPost(Map<String, dynamic> post) async {
    return await apiService.post('/posts', post);
  }

  Future<Map<String, dynamic>> updatePost(
      int id, Map<String, dynamic> post) async {
    return await apiService.put('/posts/$id', post);
  }

  Future<void> deletePost(int id) async {
    return await apiService.delete('/posts/$id');
  }
}

@riverpod
PostDataSource postDataSource(PostDataSourceRef ref) {
  final apiService = ref.watch(apiServiceProvider);
  return PostDataSource(apiService);
}
