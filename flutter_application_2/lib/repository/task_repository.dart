
import 'package:flutter_application_2/data-provider/task_data_provider.dart';
import 'package:flutter_application_2/model/task_model.dart';

class TaskRepository{
  TaskDataProvider taskDataProvider = TaskDataProvider();

  Future<TaskModel> createTask(TaskModel task){
    return taskDataProvider.createTask(task);
  }

  Future<List<TaskModel>> getTasks(){
    return taskDataProvider.fetchTasks();
  }

}