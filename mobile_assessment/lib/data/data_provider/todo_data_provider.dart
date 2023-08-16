import 'dart:convert';

import 'package:mobile_assessment/domain/entities/todo_entity.dart';
import 'package:mobile_assessment/domain/repositories/todo_repository.dart';
import 'package:http/http.dart' as http;

class TodoDataProvider implements TodoRepository{
  String endPoint = "https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks";
  @override
  Future<bool> addTodo(String title, String description) async {
    var url = Uri.parse(endPoint);
    var body = {
      'title': title,
      'description': description
    };

    var response = await http.post(url, headers: {
      'Content-Type': 'application/json'
    }, body: body);

    if (response.statusCode == 200){
      return true;
    }
    return false;
  }

  @override
  Future<bool> deleteTodo() {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoEntity>> fetchTodos() async {
    var url = Uri.parse(endPoint);
    var response = await http.get(url);

    if (response.statusCode == 200){
      List<TodoEntity> todos = [];
      Iterable resBody = jsonDecode(response.body);
      for (var todo in resBody){
        TodoEntity t = TodoEntity(title: todo['name'], description: todo['description'], status: todo['status']);
        todos.add(t);
      }
      return todos;
    }
    return [];
  }


  @override
  Future<bool> updateTodo() {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}