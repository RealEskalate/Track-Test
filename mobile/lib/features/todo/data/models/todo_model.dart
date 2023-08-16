import '../../domain/entities/todo.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    required String id,
    required String name,
    required String title,
    required String description,
    required bool status,
  }) : super(
          id: id,
          title: title,
          name: name,
          description: description,
          status: status,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status,
    };
  }
}