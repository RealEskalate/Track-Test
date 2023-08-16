import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> fetchTodos();
  Future<bool> addTodo(String title, String description);
  Future<bool> deleteTodo();
  Future<bool> updateTodo();
}