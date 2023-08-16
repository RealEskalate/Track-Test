import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/todo/domain/entities/todo.dart';
import 'package:mobile/features/todo/presentation/bloc/todo_event.dart';

import '../bloc/todo_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  TodoAppPage();
  }
}
class TodoAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo App")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          print(state);
          if (state is TodoInitialState) {
            BlocProvider.of<TodoBloc>(context).add(LoadTodosEvent());
            return Center(child: CircularProgressIndicator());
          } else if (state is TodoLoadedState) {
            final todos = state.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  onTap: () {
                    _showUpdateTodoSheet(context, todo);
                  },
                );
              },
            );
          } else if (state is TodoErrorState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return Center(child: Text('Unknown state'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoSheet(BuildContext context) {
    String title = '';
    String description = '';
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Text('Add New Task', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                title = value;
              },
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                description = value;
              },
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && description.isNotEmpty) {
                  // Dispatch an AddTodoEvent to the bloc with the entered data
                  BlocProvider.of<TodoBloc>(context).add(
                    AddTodoEvent(TodoEntity(
                      title: title,
                      description: description,
                      status: false,
                      id: 'curr',
                      name: 'add',
                    )),
                  );
                  Navigator.pop(context); // Close the bottom sheet
                }
              },
              child: Text("Add Task"),
            ),
          ],
          ),
        );
      },
    );
  }

  void _showUpdateTodoSheet(BuildContext context, TodoEntity todo) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Update Task', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // BlocProvider.of<TodoBloc>(context).add(UpdateTodoEvent());
                  // Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text("Update Task"),
              ),
            ],
          ),
        );
      },
    );
  }
}
