import 'package:flutter/material.dart';

import '../../data/data_provider/todo_data_provider.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({Key? key}) : super(key: key);

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  String updateBtn = 'Update';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update todo'),
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
                    setState(() {
                      updateBtn = '...Updating';
                    });
                    if (await TodoDataProvider().addTodo(titleController.text, descriptionController.text )){
                      setState(() {
                        updateBtn = 'Done';
                      });
                    }
                    else{
                      setState(() {
                        updateBtn = 'Retry';
                      });
                    }
                  },
                      child: Text(updateBtn)),
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
