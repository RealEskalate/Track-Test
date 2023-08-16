import 'dart:convert';

import 'package:mobile/domain/models/task.model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/infrastructure/constants.dart';

class TaskRemoteDataProvider {
  Future<List<TaskModel>> fetchTasks() async {
    try {
      print("Fetch all task request is comming");
      const url = apiUrl;
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var encodedResponse = jsonDecode(response.body);

        List<TaskModel> tasks = [];
        for (dynamic json in encodedResponse) {
          DateTime? parseDate;
          String dateString = json["createdAt"];
          if (dateString.isNotEmpty) {
            parseDate = DateTime.parse(dateString);
          }

          tasks.add(
            TaskModel(
                createdAt: parseDate ?? DateTime.now(),
                title: json["title"],
                status: json["status"],
                description: json["description"]),
          );
        }

        return tasks;
      } else {
        throw Exception("Failed to fetch tasks");
      }
    } catch (e) {
      print("the error is ");
      print(
        e.toString(),
      );
      throw Exception("Failed to fetch tasks");
    }
  }

  Future<int> addTask(TaskModel task) async {
    try {
      const url = apiUrl;
      final response = await http.post(
        Uri.parse('$url/signup'),
        headers: {
          "accept": "application/json",
          "content-type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: json.encode(
          task.toJson(),
        ),
      );
      if (response.statusCode == 201) {
        return 0;
      }
    } catch (e) {
      print(e.toString());
    }
    return 1;
  }

  Future<int> updateTask(TaskModel task) async {
    const url = apiUrl;
    try {
      var response = await http.put(
        Uri.parse("$url/$task.id"),
        headers: {
          "accept": "application/json",
          "content-type": "application/json",
        },
        body: json.encode(task.toJson()),
      );
      if (response.statusCode == 204) {
        return 0;
      } else {
        return 1;
      }
    } catch (e) {
      print(
        e.toString(),
      );
      return 1;
    }
  }

  Future<int> deleteTask(String id) async {
    const url = apiUrl;
    try {
      var response = await http.delete(
        Uri.parse("$url/quote/$id"),
      );
      if (response.statusCode == 204) {
        return 0;
      } else {
        return 1;
      }
    } catch (e) {
      print(
        e.toString(),
      );
      return 1;
    }
  }
}
