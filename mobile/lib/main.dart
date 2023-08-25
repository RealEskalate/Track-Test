import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/todo/data/datasources/datasource.dart';
import 'package:mobile/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:mobile/features/todo/domain/usecases/todo_usecase.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/todo/presentation/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    http.Client client = http.Client();
    TodoRepositoryImpl repo = TodoRepositoryImpl(TodoDataSourceImpl(client)); 
    return BlocProvider(
      create: (context) =>  TodoBloc(addTodoUseCase: AddTodoUseCase(repo), updateTodoUseCase: UpdateTodoUseCase(repo), deleteTodoUseCase: DeleteTodoUseCase(repo), getAllTodosUseCase: GetAllTodosUseCase(repo),),
      child: MaterialApp(
      title: 'Dropdown Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    )
    );
  }
}
