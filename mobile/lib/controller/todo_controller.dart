import 'package:get/get.dart';
import 'package:mobile/data/remote_data.dart';
import 'package:mobile/model/todo_model.dart';

class TodoController extends GetxController {
  var isLoaded = false.obs;
  var todoList = [].obs;
  var isUpdated = false.obs;
  late var remoteData;
  @override
  void onInit() async {
    super.onInit();
    remoteData = RemoteData();
    await getTodoList();
  }

  Future<void> getTodoList() async {
    isLoaded(false);
    var res = await remoteData.getList();
    if (res != null) {
      todoList.value = res;
    }

    isLoaded(true);
  }

  Future<void> updateList(TodoModel todoModel) async {
    isUpdated = await remoteData.updateList(todoModel);
    if (isUpdated.value) {
      await getTodoList();
    }
  }

  Future<void> postList(TodoModel todo) async {
    await remoteData.postList(todo);
    await getTodoList();
  }

  Future<void> deleteList(TodoModel todo) async {
    await remoteData.deleteList(todoList);
  }
}
