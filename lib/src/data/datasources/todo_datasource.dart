import '../../domain/entities/todo.dart';

abstract class TodoDataSource {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodo(int id);
  Future<Todo> createTodo(Todo todo);
  Future<Todo> updateTodo(int id, Todo todo);
  Future<void> deleteTodo(int id);
}
