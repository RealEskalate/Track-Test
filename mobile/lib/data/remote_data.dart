import 'dart:convert';

import '../model/todo_model.dart';
import 'package:http/http.dart' as http;

class RemoteData {
  String baseUrl = "https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks";

  Future<TodoModel> postList(TodoModel todo) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(todo.toJson()),
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to post todo");
    }
  }

  Future<List<TodoModel>> getList() async {
    final response = await http.get(
      Uri.parse(baseUrl),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final todos = <TodoModel>[];
      for (var todo in json) {
        todos.add(TodoModel.fromJson(todo));
      }

      return todos;
    } else {
      throw Exception("Failed to get todos");
    }
  }

  Future<void> deleteList(TodoModel todo) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$todo.id"),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to delete todo");
    }
  }

  Future<bool> updateList(TodoModel todo) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$todo.id"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(todo.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to update todo");
    }
  }
}
