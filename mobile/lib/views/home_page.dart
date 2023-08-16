import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/app_color.dart';
import 'package:mobile/controller/task_controller.dart';
import 'package:mobile/model/task_model.dart';

import '../widgets/app_bottomsheet.dart';
import '../widgets/task_item.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newTask=TaskBloc();
  var taskInial=[];
  @override
  void initState(){

    final new_task=Task(
                          id: "random", 
                          taskAction: TaskAction.RELOAD,
                          title: "titleController.text",
                          description: "descriptionController.text",
                          createdAt: "newDt", 
    );
         newTask.taskEventSink.add(new_task);

  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newTask=TaskBloc();
    return Scaffold(
      appBar: AppBar(
          title: ListTile(
            
            leading: Container(
              height: 40,
              width:40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color:const Color.fromARGB(255, 184, 184, 184)
              ),
              
            ),
            title: Text("July 14,2023",style: TextStyle(
              color:Colors.grey,
              fontSize: 10
              
            ),),
            subtitle: Row(
              children: [
             Text("Hello,",
            style: TextStyle(
              ),
            
            ),
            Text("Yohannes",
            style: TextStyle(
              fontWeight: FontWeight.bold),
            
            ),
          
              ],
            )
          ),
          actions: [
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 16),
              child:  IconButton(onPressed: (){
            // newTask.taskEventSink.add(TaskAction.ADD_TASK);

              },
             icon:Icon(
              CupertinoIcons.bell
            //  Icons.notifications 
             ) )
          

              )
            
          ],
        ),
           body:SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text("Today's Tasks",
               style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
               )
               ) ,
               ElevatedButton(
                style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.primary),
                ),
                onPressed: ()=>showModalBottomSheet(context: context, 
                isScrollControlled: true,
                builder: (context)=>Padding(
                  padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
                  // padding: const EdgeInsets.all(8.0),
                  child:  BottomSheetForm(newTask: newTask,),
                )), 
               child:const Text("+ new Task",style: 
               TextStyle(color: Colors.white)
               ,))
              ],
            )
          ,
          SizedBox(
            height: 800,
            child: StreamBuilder<List<TaskModel>>(
              stream: newTask.taskStream,

              builder: (context, snapshot) {
                print(newTask.tasks);
                print(snapshot);
                if (snapshot.hasData) {
                print('jjjjjj${snapshot.data!.length}');
                    return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (cnx,idx){
                    return TaskItem(
                      id:snapshot.data![idx].id,
                      title:snapshot.data![idx].title,
                      description:snapshot.data![idx].description,
                      createdAt:snapshot.data![idx].createdAt,
                      status:snapshot.data![idx].status,
                      newTask: newTask, 
                    );
                  });
              
                }
                else{
                  return Center(
                    child: Text("No Task Added"),
                  );
                }
              }
            ),
          )
          
          ],
          
        ),
      ) ,


  //     Container(
  //       child: ListView.builder(
  //   itemCount: 7,
  //   padding: const EdgeInsets.symmetric(vertical: 16),
  //   itemBuilder: (BuildContext context, index) {
  //     return Dismissible(
  //                  background: Container(
  //               color: Colors.blue,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(15),
  //                 child: Row(
  //                   children: const [
  //                     Icon(Icons.favorite, color: Colors.red),
  //                     SizedBox(
  //                       width: 8.0,
  //                     ),
  //                     Text('Move to favorites',
  //                         style: TextStyle(color: Colors.white)),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             secondaryBackground: Container(
  //               color: Colors.red,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(15),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: const [
  //                     Icon(Icons.delete, color: Colors.white),
  //                     SizedBox(
  //                       width: 8.0,
  //                     ),
  //                     Text('Move to trash',
  //                         style: TextStyle(color: Colors.white)),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //       key: Key('item {items[index]}'),
  //       onDismissed: (DismissDirection direction) {
  //         if (direction == DismissDirection.startToEnd) {
  //           print("Add to favorite");
  //         } else {
  //           print('Remove item');
  //         }
 
  //         // setState(() {
  //         //   items.removeAt(index);
  //         // });
  //       },
  //       child: ListTile(
  //               leading: const Icon(
  //                 Icons.card_giftcard_rounded,
  //                 color: Colors.black,
  //               ),
  //               title: Text(
  //                 "items[index]",
  //                 style: TextStyle(
  //                     color: Colors.black.withOpacity(.6), fontSize: 18),
  //               ),
  //               subtitle: Text(
  //                 "This Gift is For you",
  //                 style: TextStyle(color: Colors.green.withOpacity(.6)),
  //               ),
  //             ),
  //     );
  //   }
  // ),
  //     ),
    
    );
  }
}