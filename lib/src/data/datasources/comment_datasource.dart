import '../../domain/entities/comment.dart';

abstract class CommentDataSource {
  Future<List<Comment>> getComments();
  Future<Comment> getComment(int id);
  Future<Comment> createComment(Comment comment);
  Future<Comment> updateComment(int id, Comment comment);
  Future<void> deleteComment(int id);
}
