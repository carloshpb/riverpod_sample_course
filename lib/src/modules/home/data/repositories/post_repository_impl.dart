import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../datasources/post_datasource.dart';

part 'post_repository_impl.g.dart';

class PostRepositoryImpl {
  final PostDataSource dataSource;

  PostRepository(this.dataSource);

  Future<List<Post>> getPosts() async {
    final data = await dataSource.getPosts();
    return data.map((e) => Post.fromJson(e)).toList();
  }

  Future<Post> getPost(int id) async {
    final data = await dataSource.getPost(id);
    return Post.fromJson(data);
  }

  Future<Post> createPost(Post post) async {
    final data = await dataSource.createPost(post.toJson());
    return Post.fromJson(data);
  }

  Future<Post> updatePost(Post post) async {
    final data = await dataSource.updatePost(post.id, post.toJson());
    return Post.fromJson(data);
  }

  Future<void> deletePost(int id) async {
    await dataSource.deletePost(id);
  }
}

@riverpod
PostRepository postRepository(PostRepositoryRef ref) {
  final dataSource = ref.watch(postDataSourceProvider);
  return PostRepository(dataSource);
}
