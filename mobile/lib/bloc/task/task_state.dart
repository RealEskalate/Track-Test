part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  const TaskLoaded({
    required this.tasks,
  });
}

class TaskError extends TaskState {
  final String error;
  const TaskError({
    required this.error,
  });
}
