import 'package:mobile/data_provider/task_provider.dart';
import 'package:mobile/model/task.dart';

class TaskRepository {
  final TaskProvider _dataProvider;
  TaskRepository(this._dataProvider);

  Future<List<Task>> getTasks() async {
    return await _dataProvider.getTasks();
  }

  Future<Task> addTask(title, description) async {
    return await _dataProvider.addTask(title, description);
  }

  Future<Task> deleteTask(taskId) async {
    return await _dataProvider.deleteTask(taskId);
  }
}
