part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final TaskModel task;
  AddTaskEvent({required this.task});
}

class UpdateTask extends TaskEvent {
  final TaskModel task;
  UpdateTask({required this.task});
}

class DeleteTask extends TaskEvent {
  final String id;
  DeleteTask({required this.id});
}

class FetchAllTasks extends TaskEvent {}
