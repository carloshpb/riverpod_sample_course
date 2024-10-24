import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
  Future<Post> fetchPost(int id);
  Future<Post> createPost(Post post);
  Future<Post> updatePost(int id, Post post);
  Future<void> deletePost(int id);
}
