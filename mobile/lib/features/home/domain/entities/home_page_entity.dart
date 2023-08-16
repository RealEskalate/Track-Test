import '../../data/models/task_model.dart';

class Task {
  final DateTime createdAt;
  final String id;
  final String title;
  final String description;
  final bool status;

  Task({
    required this.createdAt,
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Task.fromData(Data data) {
    return Task(
      id: data.id!,
      createdAt: DateTime.parse(data.createdAt!),
      description: data.description!,
      status: data.status!,
      title: data.title!,
    );
  }
}
