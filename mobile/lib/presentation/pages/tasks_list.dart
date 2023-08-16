import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:mobile/domain/models/task.model.dart';
import 'package:mobile/presentation/widgets/custom_button.dart';
import 'package:mobile/presentation/widgets/custom_t_field.dart';
import 'package:mobile/presentation/widgets/custombutton.dart';

import '../../application/states/bloc/task_bloc.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.only(
        left: 15,
        top: 20,
        right: 10,
      ),
      child: BlocConsumer<TaskBloc, TaskState>(
        listener: (_, state) {
          if (state is TaskActionCompleted) {
            print(state.message); //I'll if I have time such as snackbar
          }
        },
        builder: (context, state) {
          if (state is TaskActionInProgress) {
            return const Center(
                child: SpinKitCircle(
              color: Colors.blue,
              size: 20,
            ));
          }
          if (state is AllTasksFetched) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Todays Tasks",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    CustomButton(
                      title: "New Task",
                      textFlex: 2,
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      icon: Icons.add,
                      iconColor: Colors.white,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                          ),
                          builder: (context) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: AddTask(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Task(task: state.tasks[index]);
                    },
                    itemCount: state.tasks.length,
                  ),
                ),
              ],
            );
          }
          if (state is TaskActionFailed) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18,
                ),
              ),
            );
          }
          return const Center(
            child: Text(
              "sorry,Something went wrong",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
              ),
            ),
          );
        },
      ),
    ));
  }
}

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.task,
  });
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 20,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.status ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(
                    task.description,
                    style: TextStyle(
                      decoration:
                          task.status ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    DateFormat('MMMM d, y').format(task.createdAt),
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: task.status ? Colors.blue : null,
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                border: !task.status ? Border.all(color: Colors.grey) : null,
              ),
              child: task.status
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        size: 30,
                      ),
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}

class AddTask extends StatelessWidget {
  AddTask({super.key});
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add New Task",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 47, 108, 212),
                      fontWeight: FontWeight.w700),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            const Text("Title"),
            CustomTextField(
              textEditingController: titleController,
              labelText: "Add Title here",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required";
                }
                if (value.length < 3) {
                  return "Please enter valid name";
                }
                return null;
              },
            ),
            const Text("Description"),
            CustomTextField(
              textEditingController: descriptionController,
              labelText: "Add Description here",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required";
                }
                if (value.length < 3) {
                  return "Please enter valid name";
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomRoundButton(
                    backgroundColor: Colors.red.shade200,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    displaytext: const Text(
                      'Cancel',
                    ),
                    borderRadius: 6,
                  ),
                ),
                Expanded(
                  child: CustomRoundButton(
                    backgroundColor: Colors.blue.shade200,
                    onTap: () {
                      var state = formKey.currentState;
                      if (state!.validate()) {
                        var task = TaskModel(
                            createdAt: DateTime.now(),
                            title: titleController.text,
                            description: descriptionController.text,
                            status: false);
                        context.read<TaskBloc>().add(
                              AddTaskEvent(task: task),
                            );
                        Navigator.pop(context);
                      }
                    },
                    displaytext: const Text('Create'),
                    borderRadius: 6,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
