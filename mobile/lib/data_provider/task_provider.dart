import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/model/task.dart';

class TaskProvider {
  final url = "https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks";

// Get all Tasks
  Future<List<Task>> getTasks() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("###############33333333333333333333333333");
      final tasks = jsonDecode(response.body) as List;
      return tasks.map((task) => Task.fromJson(task)).toList();
    } else {
      final err = jsonDecode(response.body);
      throw Exception(err["msg"]);
    }
  }

// Add
  Future<Task> addTask(title, description) async {
    final http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "title": title,
          "description": description,
        }));
    if (response.statusCode == 201) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add your Review");
    }
  }

  // Delete
  Future<Task> deleteTask(int taskId) async {
    final http.Response response = await http.delete(Uri.parse("$url/$taskId"));
    if (response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      final err = jsonDecode(response.body);
      throw Exception(err["message"]);
    }
  }
}
