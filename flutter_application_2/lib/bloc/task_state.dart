import 'package:flutter_application_2/model/task_model.dart';
import 'package:equatable/equatable.dart';

abstract class TaskState {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {}

class TaskOperationSuccess extends TaskState {
  final Iterable<TaskModel> tasks;

  TaskOperationSuccess([this.tasks = const []]);

  @override
  List<Object> get props => [tasks];
}

class TaskOperationFailure extends TaskState {}