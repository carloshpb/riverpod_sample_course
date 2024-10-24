import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/comment.dart';
import '../datasources/comment_datasource.dart';
import '../datasources/comment_datasource_impl.dart';
import '../../domain/repositories/comment_repository.dart';

part 'comment_repository_impl.g.dart';

@riverpod
CommentRepository commentRepository(ref) {
  final commentDataSource = ref.read(commentDataSourceProvider);
  return CommentRepositoryImpl._(commentDataSource);
}

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl._(this._commentDataSource);

  @override
  Future<List<Comment>> fetchComments() async {
    return await _commentDataSource.getComments();
  }

  @override
  Future<Comment> fetchComment(int id) async {
    return await _commentDataSource.getComment(id);
  }

  @override
  Future<Comment> createComment(Comment comment) async {
    return await _commentDataSource.createComment(comment);
  }

  @override
  Future<Comment> updateComment(int id, Comment comment) async {
    return await _commentDataSource.updateComment(id, comment);
  }

  @override
  Future<void> deleteComment(int id) async {
    return await _commentDataSource.deleteComment(id);
  }
}
