import '../../domain/models/task.model.dart';
import '../data_providers/task.dart';

class TaskRemoteRepository {
  final TaskRemoteDataProvider dataProvider;

  TaskRemoteRepository({required this.dataProvider});

  Future<List<TaskModel>> fetchTasks() async {
    return await dataProvider.fetchTasks();
  }

  Future<int> addTask(TaskModel task) async {
    return await dataProvider.addTask(task);
  }

  Future<int> updateTask(TaskModel task) async {
    return await dataProvider.updateTask(task);
  }

  Future<int> deleteQuote(String id) async {
    return await dataProvider.deleteTask(id);
  }
}
