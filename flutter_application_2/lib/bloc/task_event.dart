
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/model/task_model.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class TaskLoadAll extends TaskEvent {
  const TaskLoadAll();

  @override
  List<Object> get props => [];
}


class TaskCreate extends TaskEvent {
  final TaskModel task;

  const TaskCreate(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'Task Created {Task: $task}';
}

class TaskUpdate extends TaskEvent {
  final String id;
  final TaskModel task;

  const TaskUpdate(this.task, this.id);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'Task Updated {Task: $task}';
}

class TaskDelete extends TaskEvent {
  final String id;

  const TaskDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Task Deleted {course Id: $id}';
}