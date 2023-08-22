import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:mobile/constant/text_and_color.dart';
import 'package:mobile/controller/todo_controller.dart';
import 'package:mobile/model/todo_model.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final todoController = Get.put(TodoController());
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Tasks",
                  style: boldLarge,
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textColor: Colors.white,
                    color: appPrimaryColor,
                    elevation: 2,
                    onPressed: () => Get.bottomSheet(
                          Container(
                            width: double.infinity,
                            // color: Colors.white,
                            child: Column(
                              children: [
                                Text(
                                  'Add New Todos',
                                  style: boldLarge,
                                ),
                                Text('title'),
                                TextField(),
                                Text('Description'),
                                TextField()
                                // ElevatedButton(
                                //     onPressed: () {
                                //       Get.back(canPop: true);
                                //     },
                                //     child: Text('Add'))
                              ],
                            ),
                          ),
                          backgroundColor: Colors.white,
                          isDismissible: false,
                        ),
                    child: const Row(
                      children: [Icon(Icons.add), Text('New Task')],
                    ))
              ],
            ),
            Obx(
              () => todoController.isLoaded.value
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: todoController.todoList.length,
                          itemBuilder: (context, index) => Dismissible(
                                key: Key(todoController.todoList[index].id),
                                onDismissed: (direction) async {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    await todoController.deleteList(
                                        todoController.todoList[index]);
                                  }
                                },
                                child: Card(
                                  surfaceTintColor: Colors.white,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: appPrimaryColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 50),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${todoController.todoList[index].name}',
                                                  style: boldText,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${todoController.todoList[index].description}',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(height: 1.5),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(DateFormat.yMMMd().format(
                                                    DateTime.parse(
                                                        todoController
                                                            .todoList[index]
                                                            .createdAt)))
                                              ]),
                                        ),
                                      ),
                                      Checkbox(
                                        onChanged: (value) {
                                          todoController.updateList(TodoModel(
                                              createdAt: todoController
                                                  .todoList[index].createdAt,
                                              name: todoController
                                                  .todoList[index].name,
                                              description: todoController
                                                  .todoList[index].description,
                                              status: !todoController
                                                  .todoList[index].status,
                                              id: todoController
                                                  .todoList[index].id));
                                        },
                                        value: todoController
                                            .todoList[index].status,
                                        shape: CircleBorder(),
                                      )
                                    ],
                                  ),
                                ),
                              )))
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ]),
        ));
  }

  AppBar appBarWidget() {
    return AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: smallText,
                ),
                Text.rich(TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(fontSize: 16),
                    children: <InlineSpan>[
                      TextSpan(text: 'Henok', style: boldText)
                    ])),
              ],
            )
          ],
        ),
        const Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_none_outlined),
          ),
        )
      ]),
    );
  }
}
