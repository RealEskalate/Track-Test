import '../entities/home_page_entity.dart';
import '../repositories/task_repository.dart';

class TaskUseCase {
  final TaskRepository taskRepository;

  TaskUseCase({required this.taskRepository});

  Future<List<Task>> getAllTask() async {
    return await taskRepository.getAllTasks();
  }

  Future<Task> createTask({
    required String title,
    required String description,
  }) async {
    try {
      // Call the feedingScheduleRepository method to create feeding schedule
      final result = await taskRepository.createTask(
        description: description,
        title: title,
      );

      // Return the entity representing the successful message
      return result;
    } catch (e) {
      print(e.toString());
      // Handle any errors and return an entity representing the failure
      // return Task(
      //     message: "Failed to create feeding schedule");
      return Task(
          createdAt: DateTime.now(),
          description: "no",
          id: '10',
          status: false,
          title: 'test');
    }
  }

  Future<String> updateTask({
    required String id,
    required String title,
    required String description,
  }) async {
    try {
      // Call the feedingScheduleRepository method to create feeding schedule
      final result = await taskRepository.updateTask(
       description: description,
        title: title,
        id: id,
      );

      // Return the entity representing the successful message
      return result;
    } catch (e) {
      print(e.toString());
      // Handle any errors and return an entity representing the failure
      return "Failed to update feeding schedule";
    }
  }

  Future<String> deleteTask({
    required String id,
  }) async {
    try {
      // Call the feedingScheduleRepository method to create feeding schedule
      final result = await taskRepository.deleteTask(
        id: id,
      );

      // Return the entity representing the successful message
      return result;
    } catch (e) {
      print(e.toString());
      // Handle any errors and return an entity representing the failure
      return.toString();
    }
  }
}
