import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/shared/error_handler.dart';
import '../models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> createTask({
    required String title,
    required String description,
  });

  Future<TaskModel> updateTask({
    required String id,
    required String title,
    required String description,
  });

  Future<TaskModel> deleteTask({
    required String id,
  });

  Future<AllTaskModel> getAllTasks();
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final http.Client client;
  final String baseUrl =
      "https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks";

  TaskRemoteDataSourceImpl({required this.client});

  Future<TaskModel> createTask({
    required String title,
    required String description,
  }) async {
    try {
      var body = json.encode(
        {
          'name': title.toString(),
          'description': description.toString(),
        },
      );
      final response = await client.post(
        Uri.parse(baseUrl),
        body: body,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        return TaskModel.fromJson(json.decode(response.body));
      } else {
        final errorMessage = ErrorHandler.handleError(response);
        throw Exception(errorMessage);
      }
    } catch (error) {
      final errorMessage = ErrorHandler.handleException(error);
      throw Exception(errorMessage);
    }
  }

  Future<TaskModel> updateTask({
    required String id,
    required String title,
    required String description,
  }) async {
    try {
      var body = json.encode(
        {
          'name': title.toString(),
          'description': description.toString(),
        },
      );
      final response = await client.put(
        Uri.parse("${baseUrl}/${id}"),
        body: body,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        return TaskModel.fromJson(json.decode(response.body));
      } else {
        final errorMessage = ErrorHandler.handleError(response);
        throw Exception(errorMessage);
      }
    } catch (error) {
      final errorMessage = ErrorHandler.handleException(error);
      throw Exception(errorMessage);
    }
  }

  Future<TaskModel> deleteTask({
    required String id,
  }) async {
    try {
      final response = await client.delete(
        Uri.parse("${baseUrl}/${id}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.body);

      if (response.statusCode == 201) {
        return TaskModel.fromJson(json.decode(response.body));
      } else {
        final errorMessage = ErrorHandler.handleError(response);
        throw Exception(errorMessage);
      }
    } catch (error) {
      final errorMessage = ErrorHandler.handleException(error);
      throw Exception(errorMessage);
    }
  }

  @override
  Future<AllTaskModel> getAllTasks() async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl),
        headers: {
          // "Authorization": "Bearer ${token.toString()}",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return AllTaskModel.fromJson(json.decode(response.body));
      } else {
        final errorMessage = ErrorHandler.handleError(response);
        throw Exception(errorMessage);
      }
    } catch (error) {
      final errorMessage = ErrorHandler.handleException(error);
      throw Exception(errorMessage);
    }
  }
}
