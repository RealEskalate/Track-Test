import '../entities/home_page_entity.dart';

abstract class TaskRepository {
  Future<Task> createTask({
    required String title,
    required String description,
  });

  Future<Task> updateTask({
    required String id,
    required String title,
    required String description,
  });

  Future<Task> deleteTask({
    required String id,
  });

  Future<List<Task>> getAllTasks();
}
