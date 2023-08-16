import 'package:flutter/material.dart';
import 'package:mobile_assessment/data/data_provider/todo_data_provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add todo'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(fontSize: 15.0),
          controller: titleController,
          decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Color(0xFFF5F5F5),
          labelText: 'Title',
        ),

        ),
        ),
    Padding(
    padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(fontSize: 15.0),
        controller: descriptionController,
        decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Color(0xFFF5F5F5),
        labelText: 'Description',
    ),

    ),
    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: ()async {
                if (await TodoDataProvider.addTodo(titleController.text, descriptionController.text )){

                }
              },
              child: Text('Create')),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text('Cancel')),
            ],
          )
    ]

      ));
  }
}



