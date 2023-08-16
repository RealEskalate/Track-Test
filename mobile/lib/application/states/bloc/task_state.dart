part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

class AllTasksFetched extends TaskState {
  final List<TaskModel> tasks;
  AllTasksFetched({
    required this.tasks,
  });
}

class TaskActionInProgress extends TaskState {}

class TaskActionCompleted extends TaskState {
  final String message;
  TaskActionCompleted({required this.message});
}

class TaskActionFailed extends TaskState {
  final String message;
  TaskActionFailed({required this.message});
}
