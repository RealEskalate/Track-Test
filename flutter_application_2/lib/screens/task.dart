import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/task_bloc.dart';
import 'package:flutter_application_2/bloc/task_event.dart';
import 'package:flutter_application_2/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Task extends StatefulWidget {
  const Task();

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addNewTask() {
    showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text("Add New Task"),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextButton(onPressed: ()=>{Navigator.of(context).pop()}, child: Text("Cancel")),
            TextButton(onPressed: ()=>{
              BlocProvider.of<TaskBloc>(context).add(TaskCreate(TaskModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  status: false,
                  createdAt: DateTime.now().toIso8601String(),
              ))),
              Navigator.of(context).pop()
            }, child: Text("Create"))
          ],)

        ],
      );
    });
  }

  



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("Today's tasks"),
        TextButton(onPressed: addNewTask, child: Text("+ New Task"))
        ],
      ),
    );
  }
}