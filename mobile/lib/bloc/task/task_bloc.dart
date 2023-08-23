import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/model/task.dart';
import 'package:mobile/repository/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskRepository taskRepository;
  TaskBloc(this.taskRepository) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final data = await taskRepository.getTasks();
        emit(TaskLoaded(
          tasks: data,
        ));
      } on TaskError catch (e) {
        emit(TaskError(error: e.toString()));
      } catch (e) {
        emit(const TaskError(error: 'something went wrong'));
      }
    });

    on<AddTask>((event, emit) async {
      try {
        final op = await taskRepository.addTask(event.title, event.description);

        final data = await taskRepository.getTasks();
        emit(TaskLoaded(
          tasks: data,
        ));
      } on TaskError catch (e) {
        emit(TaskError(error: e.toString()));
      } catch (e) {
        emit(const TaskError(error: 'something went wrong'));
      }
    });

    on<DeleteTask>((event, emit) async {
      try {
        final op = await taskRepository.deleteTask(event.taskId);
        final data = await taskRepository.getTasks();
        emit(TaskLoaded(
          tasks: data,
        ));
      } on TaskError catch (e) {
        emit(TaskError(error: e.toString()));
      } catch (e) {
        emit(const TaskError(error: 'something went wrong'));
      }
    });
  }
}
