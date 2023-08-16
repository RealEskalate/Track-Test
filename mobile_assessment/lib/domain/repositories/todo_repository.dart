import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> fetchTodos();
  Future<bool> addTodo(String title, String description);
  Future<bool> deleteTodo(String id);
  Future<bool> updateTodo(String title, String description, String id);
}