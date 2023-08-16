import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/model/task_model.dart';

enum TaskAction{
  ADD_TASK,
  DELETE_TASK,
  UPDATE_TASK,
  RELOAD,
  AFTER
}
class TaskBloc {
  
  List<TaskModel> tasks= <TaskModel>[];
  final _stateController=StreamController<List<TaskModel>>();
  StreamSink<List<TaskModel>> get taskSink=>_stateController.sink;
  Stream<List<TaskModel>> get taskStream=> _stateController.stream;

final _eventController=StreamController<Task>();
  StreamSink<Task> get taskEventSink=>_eventController.sink;
  Stream<Task> get taskEventStream=> _eventController.stream;
   TaskBloc(){
    taskEventStream.listen((event) async{
      if (event.taskAction==TaskAction.RELOAD) {
        tasks=await getTask();
        taskSink.add(tasks);
      }
    // else  if (event.taskAction==TaskAction.AFTER) {
    //     print(tasks.length);
    //     // tasks.removeAt(tasks.length-1);
    //     taskSink.add(tasks);
    //   }
    //  else
    else  if(event.taskAction==TaskAction.ADD_TASK){
      // var tasks= await getTask();
    
        TaskModel tsk=new TaskModel(
          id:event.id,
          createdAt: event.createdAt,
          title:event.title,
          description: event.description,
          status: event.status);
        tasks.add(tsk);
        taskSink.add(tasks);
        print("kkkkkkk");
         final response = await http.post(
                    Uri.parse("https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks"),
                      body: json.encode(tsk.toJson()),
                      headers: {'Content-Type': 'application/json'},
                      );
              print(response.statusCode);    
      }
      else if(event.taskAction==TaskAction.UPDATE_TASK){
        TaskModel tsk=new TaskModel(
          id:event.id,createdAt: 
          event.createdAt,title:event.title,
          description: event.description,status: event.status);
        for (var i = 0; i < tasks.length; i++) {
          if (tasks[i].id==event.id) {
            tasks.removeAt(i);
            break;
          }
        }
        tasks.add(tsk);
        taskSink.add(tasks);
        print(tasks);
   final apiUrl = 'https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks/${event.id}'; // Replace with your API endpoint
      
      final response = await http.put(
        Uri.parse(apiUrl),
        body: json.encode(tsk.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.statusCode);
      }
    });
   }
   Future<List<TaskModel>> getTask() async{
    
    var client=http.Client();
    List<TaskModel> newTask=[];

    try {
         print("hjjjhhg");
      var response=await http.get(Uri.parse("https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks"));
   print("hjjjhhgjjjj");
  //  print(response.body);
    if (response.statusCode==200) {
      var jsonString=response.body;
      var jsonMap=json.decode(jsonString);
      // final List<TaskModel> taskList = jsonMap.map((json) => TaskModel.fromJson(json)).toList();
      print(jsonMap.length);
      // print(taskList);
      List<TaskModel> task=[];
      for (var i = 0; i < jsonMap.length; i++) {
      TaskModel tsk=   TaskModel(

         title:jsonMap[i]["title"],
          id:jsonMap[i]["id"],
        createdAt: jsonMap[i]["createdAt"],
        description: jsonMap[i]["description"],
        status: jsonMap[i]["status"]);
       
        task.add(tsk);
      }
        taskSink.add(task);

      // newTask=TaskModel.fromJson(jsonMap);

      return task;
    }
    } catch (e) {
      return newTask;
    }
    return newTask;
   }
}