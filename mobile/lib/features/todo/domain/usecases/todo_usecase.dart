import 'package:dartz/dartz.dart';
import 'package:mobile/core/usecase/usecase.dart';

import '../../../../core/errors/failures.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';


class AddTodoUseCase  extends Usecase<void, TodoParams>{
  final TodoRepository repository;

  AddTodoUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.addTodo(params.todo);
  }
}


class UpdateTodoUseCase extends Usecase<void, TodoParams>{
  final TodoRepository repository;

  UpdateTodoUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.updateTodo(params.todo);
  }
}

class TodoParams extends Params{
  final TodoEntity todo;

  TodoParams(this.todo);
  
  @override
  List<Object?> get props => [todo];
}

class DeleteTodoUseCase extends Usecase<void, String>{
  final TodoRepository repository;

  DeleteTodoUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.deleteTodoById(params);
  }
}

class GetAllTodosUseCase extends Usecase<List<TodoEntity>, TodoParams>{
  final TodoRepository repository;

  GetAllTodosUseCase(this.repository);

  Future<Either<Failure, List<TodoEntity>>> call(params) async {
    return await repository.getAllTodos();
  }
}
