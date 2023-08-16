import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assessment/presentation/screens/addtodo.dart';

import '../../data/data_provider/todo_data_provider.dart';
import '../../domain/entities/todo_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = TodoDataProvider();
    List<TodoEntity> todos =  [TodoEntity(id: '1', title: 'Going to the gym', description: "lorem ipsum", status: true),
      TodoEntity(id: '2', title: 'Write daily plan', description: "lorem ipsum", status: false)];
    final fetched = TodoDataProvider().fetchTodos();


    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.person
          ),
          backgroundColor: Colors.grey,
          title: const Text('Hello Name'),

            
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Todays Task'),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                AddTodo()
                        ),
                          // (Route<dynamic> route) => false,
                        );
                      },
                      child: Text('New Task'))
                ],
              ),
            ),
            IconButton(onPressed: ()async{
              Future<List<TodoEntity>> tasks = (await TodoDataProvider().fetchTodos()) as Future<List<TodoEntity>>;
              setState(() {
                todos = tasks as List<TodoEntity>;
              });
            }, icon: Icon(Icons.refresh)),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todos[index];
                  return CheckboxListTile(
                    value: todo.status,
                    onChanged: (bool? value){
                    setState(() {
                      todos[index].status = value!;
                    });
                  },
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}
