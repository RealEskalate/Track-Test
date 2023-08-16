import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/bloc/task/task_bloc.dart';
import 'package:mobile/data_provider/task_provider.dart';
import 'package:mobile/presentation/screens/home_page.dart';
import 'package:mobile/repository/task_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Task Tracker',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
