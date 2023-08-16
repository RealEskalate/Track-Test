import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/app_color.dart';

import '../controller/task_controller.dart';
import '../model/task_model.dart';

class BottomSheetForm extends StatelessWidget {
   BottomSheetForm({
    super.key,
   this.newTask
  }); 
final  newTask;
final descriptionController=TextEditingController();
final titleController=TextEditingController();

  get http => null;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        height: MediaQuery.of(context).size.height*0.5,
        child:Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),   color: Colors.white,
        
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Add New Todos",
            style: TextStyle(fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 8,
            ),
            Text("Title"),
    
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color:const Color.fromARGB(255, 241, 240, 240),
                borderRadius: BorderRadius.circular(10)
              ),
             child: TextField(
                controller: titleController,
                cursorColor: Colors.black,
              decoration: InputDecoration(
                
                border: InputBorder.none,
                hintText: "Add title here",
                focusedBorder: InputBorder.none,
              ),
              )),
            
    
            Text("Description"),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 241, 240, 240),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: descriptionController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Add description here",
                focusedBorder: InputBorder.none,
              ),
              )),
            
              SizedBox(
                height: 80,
              ),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                      ),
                      foregroundColor:MaterialStatePropertyAll(Colors.white)
                      ,
                      padding: MaterialStatePropertyAll(EdgeInsets.all(14)),
                      backgroundColor:MaterialStateProperty.all(AppColor.secondary) ,
                    ),
                    onPressed: null,
                   child: Text("cancle")),
                ),
                SizedBox(
                  width: 20,
                ),
                  Expanded(
                   
                    child: ElevatedButton(
                       style:ButtonStyle(
                        shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                      ),
                                            foregroundColor:MaterialStatePropertyAll(Colors.white)
,
                      padding: MaterialStatePropertyAll(EdgeInsets.all(14)),

                      backgroundColor: MaterialStatePropertyAll(AppColor.primary)
                    ),
                      onPressed: () async {
                        DateTime date= new DateTime.now();
                        int _id =  date.millisecondsSinceEpoch;
                        var newDt = DateFormat.yMMM().format(date);
                        final new_task=Task(
                          id: 'andom${newDt}', 
                          taskAction: TaskAction.ADD_TASK,
                          title: titleController.text,
                          description: descriptionController.text,
                          createdAt: newDt, 
                          status: false);


                          var postData={
                            "id":new_task.id,
                          "title": new_task.title,
                          "description": new_task.description,
                          "createdAt": new_task.createdAt, 
                          "status": new_task.status };
                         final response = await http.post(
                               Uri.parse("https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks"),
                                      body: json.encode(postData),
                                   headers: {'Content-Type': 'application/json'},
                                           );
                        newTask.taskEventSink.add(new_task);
                      },
                                   child: Text("Create")),
                  )
              ],
            )
    
            
          ],
        ),
      
        )
      ),
    );
  }
}