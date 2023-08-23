import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile/presentation/pages/add_task.dart';
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
