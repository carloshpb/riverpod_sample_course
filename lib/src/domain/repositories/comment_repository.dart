import '../entities/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> fetchComments();
  Future<Comment> fetchComment(int id);
  Future<Comment> createComment(Comment comment);
  Future<Comment> updateComment(int id, Comment comment);
  Future<void> deleteComment(int id);
}
