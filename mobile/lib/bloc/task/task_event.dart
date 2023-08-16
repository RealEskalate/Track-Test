part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final String title;
  final String description;
  const AddTask(this.title, this.description);
}

class DeleteTask extends TaskEvent {
  final int taskId;
  const DeleteTask(
    this.taskId,
  );
}
