import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/app_color.dart';
import '../controller/task_controller.dart';
import '../model/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    this.id,
    this.createdAt,
    this.description,
    this.status,
    this.title,
    this.newTask


  });
final id;
final title;
final description;
final createdAt;
final status;
final newTask;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
            child:   Container(
      height: 100,
      margin: EdgeInsets.only(bottom:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      // color:AppColor.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 16,
            decoration: BoxDecoration(
            color:AppColor.primary,

             borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10))
      ),
          ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(                                  
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                  title: Text(title),
                  subtitle: Text(description),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      fillColor: MaterialStatePropertyAll(AppColor.primary),
                      shape:CircleBorder(),
                      value: status, 
                    onChanged:(val){
                        DateTime date= new DateTime.now();
                        var newDt = DateFormat.yMMM().format(date);
                        final new_task=Task(
                          id: id, 
                          taskAction: TaskAction.UPDATE_TASK,
                          title: title,
                          description: description,
                          createdAt: newDt, 
                          status: !status);
                        newTask.taskEventSink.add(new_task);
                      },),
                  ),      
                  ),
                Padding(
                  padding: const EdgeInsets.only(left:16.0),
                  child: Text(createdAt),
                )                                
              ],
            ),
            ),
            
            
            ],
      ),
    ),
            onDismissed: (direction) {
              // setState(() {
              //   items.removeAt(index);
              // });
            },
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ), key: Key('myDismissible'), 
          );
  }
}
