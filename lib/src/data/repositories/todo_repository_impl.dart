import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_datasource.dart';
import '../datasources/todo_datasource_impl.dart';

part 'todo_repository_impl.g.dart';

@riverpod
TodoRepository todoRepository(ref) {
  final todoDataSource = ref.read(todoDataSourceProvider);
  return TodoRepositoryImpl._(todoDataSource);
}

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl._(this.dataSource);

  @override
  Future<List<Todo>> fetchTodos() {
    return dataSource.getTodos();
  }

  @override
  Future<Todo> fetchTodoById(int id) {
    return dataSource.getTodo(id);
  }

  @override
  Future<Todo> addTodo(Todo todo) {
    return dataSource.createTodo(todo);
  }

  @override
  Future<Todo> updateTodoById(int id, Todo todo) {
    return dataSource.updateTodo(id, todo);
  }

  @override
  Future<void> removeTodoById(int id) {
    return dataSource.deleteTodo(id);
  }
}
