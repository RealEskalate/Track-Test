import 'package:dartz/dartz.dart';
import 'package:mobile/features/todo/data/models/todo_model.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/datasource.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, void>> addTodo(TodoEntity todo) async {
    try {
      await dataSource.addTodoData(todo as TodoModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add todo'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTodo(TodoEntity todo) async {
    try {
      await dataSource.updateTodoData(todo as TodoModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update todo'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodoById(String id) async {
    try {
      await dataSource.deleteTodoData(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete todo'));
    }
  }
  
  @override
  Future<Either<Failure, List<TodoEntity>>> getAllTodos() async {
    try {
      final todos = await dataSource.getAllTodoData(); // Replace with actual data source method
      return Right(todos);
    } catch (e) {
      return Left(ServerFailure('Failed to get all todos'));
    }
  }
}
