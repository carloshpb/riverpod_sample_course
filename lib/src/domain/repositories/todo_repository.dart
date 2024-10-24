import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
  Future<Todo> fetchTodoById(int id);
  Future<Todo> addTodo(Todo todo);
  Future<Todo> updateTodoById(int id, Todo todo);
  Future<void> removeTodoById(int id);
}
