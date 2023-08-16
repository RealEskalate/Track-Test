import 'dart:convert';

import 'package:http/http.dart' as http;
import '/models/task_model.dart';

class TaskApiService {
  final String baseUrl =
      'https://64db1ca9593f57e435b0778b.mockapi.io/api/v1'; // Replace with your API URL

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/tasks'));
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  Future<void> postTask(Task task) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(task.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode != 201) {
      throw Exception('Failed to add task');
    }
  }
}
