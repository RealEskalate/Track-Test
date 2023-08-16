part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {
  final Task task;

  TaskSuccess({required this.task});

  @override
  List<Object?> get props => [task];
}

class TaskFailure extends TaskState {
  final String errorMessage;

  TaskFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

// class UpdateTaskInitial extends TaskState {}

// class UpdateTaskLoading extends TaskState {}

// class UpdateTaskSuccess extends TaskState {
//   final TaskEntity feedingSchedule;

//   UpdateTaskSuccess({required this.feedingSchedule});

//   @override
//   List<Object?> get props => [feedingSchedule];
// }

// class UpdateTaskFailure extends TaskState {
//   final String errorMessage;

//   UpdateTaskFailure({required this.errorMessage});

//   @override
//   List<Object?> get props => [errorMessage];
// }

// class DeleteTaskInitial extends TaskState {}

// class DeleteTaskLoading extends TaskState {}

// class DeleteTaskSuccess extends TaskState {
//   final TaskEntity feedingSchedule;

//   DeleteTaskSuccess({required this.feedingSchedule});

//   @override
//   List<Object?> get props => [feedingSchedule];
// }

// class DeleteTaskFailure extends TaskState {
//   final String errorMessage;

//   DeleteTaskFailure({required this.errorMessage});

//   @override
//   List<Object?> get props => [errorMessage];
// }

class GetAllTasksInitial extends TaskState {}

class GetAllTasksLoading extends TaskState {}

class GetAllTasksSuccess extends TaskState {
  final List<Task> tasks;

  GetAllTasksSuccess({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class GetAllTasksFailure extends TaskState {
  final String errorMessage;

  GetAllTasksFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
