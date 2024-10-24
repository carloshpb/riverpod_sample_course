import '../../domain/entities/post.dart';

abstract class PostDataSource {
  Future<List<Post>> getPosts();
  Future<Post> getPost(int id);
  Future<Post> createPost(Post post);
  Future<Post> updatePost(int id, Post post);
  Future<void> deletePost(int id);
}
