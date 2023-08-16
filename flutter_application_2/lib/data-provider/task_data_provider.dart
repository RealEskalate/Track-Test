import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_2/model/task_model.dart';
import 'package:http/http.dart' as http;

class TaskDataProvider{

  final String _baseUrl = "https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks";

   Future<TaskModel> createTask(TaskModel task) async {
    print(task.title);
    final http.Response response =
        await http.post(Uri.parse(_baseUrl),
            headers: <String, String>{
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "title": task.title,
              "description": task.description,
              "status": task.status,
              "createdAt": task.createdAt,
            }));

    if (response.statusCode == 201) {
      return TaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }
  

  Future<List<TaskModel>> fetchTasks() async {
    
    try{
        final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final tasks = jsonDecode(response.body) as List;
        return tasks.map((c) => TaskModel.fromJson(c)).toList();
      } else {
        print("Could not view all");
        throw Exception("Could not fetch tasks");
      }
      }on SocketException{
        throw("Connection Error");
      }
  } 
}