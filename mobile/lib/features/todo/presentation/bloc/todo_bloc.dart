import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/features/todo/presentation/bloc/todo_event.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/todo_usecase.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase addTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final GetAllTodosUseCase getAllTodosUseCase;

  TodoBloc({
    required this.addTodoUseCase,
    required this.updateTodoUseCase,
    required this.deleteTodoUseCase,
    required this.getAllTodosUseCase,
  }) : super(TodoInitialState()) {
      on<LoadTodosEvent>(_onLoadTodosEvent);
      on<AddTodoEvent>(_onAddTodoEvent);
      on<UpdateTodoEvent>(_onUpdateTodoEvent);
      on<DeleteTodoEvent>(_onDeleteTodoEvent);

  }

  void _onLoadTodosEvent(LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoInitialState());
    final result = await getAllTodosUseCase(NoParams() as TodoParams);
    emit(result.fold(
      (failure) => TodoErrorState('Failed to load todos'),
      (todos) => TodoLoadedState(todos),
    ));
  }

  void _onAddTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) async {
    final result = await addTodoUseCase(TodoParams(event.todo));
    _handleResult(result, emit);
  }

  void _onUpdateTodoEvent(UpdateTodoEvent event, Emitter<TodoState> emit) async {
    final result = await updateTodoUseCase(TodoParams(event.todo));
    _handleResult(result, emit);
  }

  void _onDeleteTodoEvent(DeleteTodoEvent event, Emitter<TodoState> emit) async {
    final result = await deleteTodoUseCase(event.id);
    _handleResult(result, emit);
  }

  void _handleResult(Either<Failure, void> result, Emitter<TodoState> emit) async {
    emit(result.fold(
      (failure) => TodoErrorState('Operation failed'),
      (_) => TodoInitialState(),
    ));
    _onLoadTodosEvent(LoadTodosEvent(), emit); // Refresh todos after an operation
  }
}



