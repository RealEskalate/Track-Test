import 'package:dartz/dartz.dart';
import 'package:mobile/core/errors/failures.dart';

import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, void>> addTodo(TodoEntity todo);
  Future<Either<Failure, void>> updateTodo(TodoEntity todo);
  Future<Either<Failure, void>> deleteTodoById(String id);
  Future<Either<Failure, List<TodoEntity>>> getAllTodos();
}
