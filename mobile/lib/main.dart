import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/application/states/bloc/task_bloc.dart';
import 'package:mobile/infrastructure/data_providers/task.dart';
import 'package:mobile/infrastructure/repositories/task.dart';

import 'presentation/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => TaskRemoteRepository(
            dataProvider: TaskRemoteDataProvider(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TaskBloc(
              repository: context.read<TaskRemoteRepository>(),
            )..add(
                FetchAllTasks(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Homepage(),
        ),
      ),
    );
  }
}
