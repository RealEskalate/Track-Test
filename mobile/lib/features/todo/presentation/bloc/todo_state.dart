part of 'todo_bloc.dart';
abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}
class TodoInitialState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TodoEntity> todos;

  TodoLoadedState(this.todos);

  @override
  List<Object?> get props => [todos];
}

class TodoErrorState extends TodoState {
  final String errorMessage;

  TodoErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
