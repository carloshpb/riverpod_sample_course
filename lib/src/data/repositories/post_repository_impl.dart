import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_datasource.dart';
import '../datasources/post_datasource_impl.dart';

part 'post_repository_impl.g.dart';

@riverpod
PostRepository postRepository(ref) {
  final postDataSource = ref.read(postDataSourceProvider);
  return PostRepositoryImpl._(postDataSource);
}

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl._(this._postDataSource);

  @override
  Future<List<Post>> fetchPosts() async {
    return await _postDataSource.getPosts();
  }

  @override
  Future<Post> fetchPost(int id) async {
    return await _postDataSource.getPost(id);
  }

  @override
  Future<Post> createPost(Post post) async {
    return await _postDataSource.createPost(post);
  }

  @override
  Future<Post> updatePost(int id, Post post) async {
    return await _postDataSource.updatePost(id, post);
  }

  @override
  Future<void> deletePost(int id) async {
    return await _postDataSource.deletePost(id);
  }
}
