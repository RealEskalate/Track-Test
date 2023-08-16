import 'package:mobile/controller/task_controller.dart';

class TaskModel {
  String? createdAt;
  String? title;
  String? description;
  bool? status;
  String? id;

  TaskModel(
      {this.createdAt, this.title, this.description, this.status, this.id});

  TaskModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
class Task {
  Task({
     this.id,
    required this.taskAction,
     this.title,
     this.description,
     this.createdAt,
     this.status,
  });
  String? id;
  TaskAction taskAction;
  String? title;
  String? description;
  String? createdAt;
  bool? status;}
