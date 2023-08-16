import 'package:equatable/equatable.dart';
import 'package:mobile/features/todo/domain/entities/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class LoadTodosEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoEntity todo;

  const AddTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final TodoEntity todo;

  const UpdateTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;

  const DeleteTodoEvent(this.id);

  @override
  List<Object?> get props => [id];
}
