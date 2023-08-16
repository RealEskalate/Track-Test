
import 'dart:convert';

import '../models/todo_model.dart';
import 'package:http/http.dart' as http;

abstract class TodoDataSource {
  Future<void> addTodoData(TodoModel todo);
  Future<void> updateTodoData(TodoModel todo);
  Future<void> deleteTodoData(String id);
  Future<List<TodoModel>> getAllTodoData();
}

class TodoDataSourceImpl implements TodoDataSource {
  List<TodoModel> _todos = [];
  final http.Client client;

  final String apiUrl = 'https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks';

  TodoDataSourceImpl(this.client);

  @override
  Future<List<TodoModel>> getAllTodoData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse.map((data) => TodoModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
  @override
  Future<void> addTodoData(TodoModel todo) async {
    _todos.add(todo);
  }

  @override
  Future<void> updateTodoData(TodoModel todo) async {
    final index = _todos.indexWhere((element) => element.id == todo.id);
    if (index >= 0) {
      _todos[index] = todo;
    }
  }

  @override
  Future<void> deleteTodoData(String id) async {
    _todos.removeWhere((element) => element.id == id);
  }
}
