import 'package:flutter_application_2/repository/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc({required this.taskRepository}) : super(TaskLoading());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is TaskLoadAll) {
      yield TaskLoading();
      try {
        final tasks = await taskRepository.getTasks();
        yield TaskOperationSuccess(tasks);
      } catch (_) {
        yield TaskOperationFailure();
      }
    }

   
    if (event is TaskCreate) {
      try {
        await taskRepository.createTask(event.task);
        yield TaskLoading();
        final tasks = await taskRepository.getTasks();
        yield TaskOperationSuccess(tasks);
      } catch (e) {
        print("Bloc error");
        print(e.toString());
        // yield TaskOperationFailure();
      }
    }

  }
}