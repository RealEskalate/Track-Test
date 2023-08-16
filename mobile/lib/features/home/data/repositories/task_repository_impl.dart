import '../../domain/entities/home_page_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_remote_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepositoryImpl({required this.taskRemoteDataSource});

  @override
  Future<Task> createTask({
    required String title,
    required String description,
  }) async {
    // Convert the parameters to the appropriate format if needed
    // Call the remote data source to create the feeding schedule
    final response = await taskRemoteDataSource.createTask(
      title: title,
      description: description,
    );
    return Task(
      createdAt: DateTime.parse(response.createdAt.toString()) ??
          DateTime.now(), // Using a default value if createdAt is nullable
      id: response.id ?? "", // Using an empty string if id is nullable
      title: response.title ?? "", // Using an empty string if title is nullable
      description: response.description ??
          "", // Using an empty string if description is nullable
      status: response.status ??
          false, // Using a default value if status is nullable
    );
    // return Task(createdAt: response.createdAt, description: response.description, title: response.title, status: response.status, id: response.id);
  }

  @override
  Future<Task> updateTask({
    required String id,
    required String title,
    required String description,
  }) async {
    // Convert the parameters to the appropriate format if needed
    // Call the remote data source to create the feeding schedule
    final response = await taskRemoteDataSource.updateTask(
      id: id,
      title: title,
      description: description,
    );

    return response.message ?? '';
  }

  @override
  Future<Task> deleteTask({
    required String id,
  }) async {
    // Convert the parameters to the appropriate format if needed
    // Call the remote data source to create the feeding schedule
    final response = await taskRemoteDataSource.deleteTask(
      id: id,
    );

    return response.message ?? '';
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final response = await taskRemoteDataSource.getAllTasks();
    List<Task> taskDataEntities =
        response.data!.map((data) => Task.fromData(data)).toList();

    return taskDataEntities;
  }
}
