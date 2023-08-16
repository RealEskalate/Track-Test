import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/home/presentation/pages/home_page.dart';

import 'features/home/data/datasources/task_remote_datasource.dart';
import 'features/home/data/repositories/task_repository_impl.dart';
import 'features/home/domain/repositories/task_repository.dart';
import 'features/home/domain/usecases/task_usecase.dart';
import 'features/home/presentation/bloc/task_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final http.Client client = http.Client();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TaskRepository taskRepository = TaskRepositoryImpl(
        taskRemoteDataSource: TaskRemoteDataSourceImpl(client: client));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(
            taskUseCase: TaskUseCase(taskRepository: taskRepository),
          ),
          child: Container(),
        ),
      ],
      child: MaterialApp(
        title: 'Tasks',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Poppins",
            colorScheme:
                ColorScheme.fromSwatch().copyWith(primary: Color(0xFF3B4CA6))),
        home: HomePage(),
        // localizationsDelegates: [
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   MonthYearPickerLocalizations.delegate,
        // ],
      ),
    );
  }
}
