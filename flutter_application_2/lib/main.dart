import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/task_bloc.dart';
import 'package:flutter_application_2/bloc/task_event.dart';
import 'package:flutter_application_2/bloc/task_state.dart';
import 'package:flutter_application_2/screens/header.dart';
import 'package:flutter_application_2/screens/task.dart';
import 'package:flutter_application_2/screens/task_card.dart';
import 'package:flutter_application_2/data-provider/task_data_provider.dart';
import 'package:flutter_application_2/model/task_model.dart';
import 'package:flutter_application_2/repository/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  final TaskRepository taskRepository = TaskRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(taskRepository: taskRepository) ,
      child: const MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TaskDataProvider taskDataProvider = TaskDataProvider();
  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(const TaskLoadAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Task(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (_, state) {
                if (state is TaskLoading) {
                  return const CircularProgressIndicator();
                } else if (state is TaskOperationSuccess) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (_, _idx) => Dismissible(
                          // Each Dismissible must contain a Key. Keys allow Flutter to
                          // uniquely identify widgets.
                          key: Key(_idx.toString()),
                          // Provide a function that tells the app
                          // what to do after an item has been swiped away.
                          onDismissed: (direction) {
                            // Remove the item from the data source.
                            // setState(() {
                            //   state.tasks;
                            // });

                            // Then show a snackbar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('Dismissed')));
                          },
                          // Show a red background as the item is swiped away.
                          background: Container(color: Colors.red),
                          child: TaskCard(
                            title: state.tasks.elementAt(_idx).title,
                            description: state.tasks.elementAt(_idx).description,
                            date: state.tasks.elementAt(_idx).createdAt,
                            status: state.tasks.elementAt(_idx).status,
                          ),
                        )),
                  );
                }
                return Text("No Tasks");
              },
            ),
          ],
        )
      ),
    );
  }
}
