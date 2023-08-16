import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/task/task_bloc.dart';

class ListSlider extends StatefulWidget {
  const ListSlider({super.key});

  @override
  State<ListSlider> createState() => _ListSliderState();
}

class _ListSliderState extends State<ListSlider> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoaded) {
          return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final item = state.tasks[index];
                return Dismissible(
                  key: Key(item.taskId as String),
                  onDismissed: (direction) {
                    BlocProvider.of<TaskBloc>(context)
                        .add(DeleteTask(item.taskId));
                    setState(() {});
                    items.removeAt(index);
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    title: Text(item.name),
                  ),
                );
              });
        }

        if (state is TaskLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Center(
          child: Text('Something went wrong!'),
        );
      },
    );
  }
}
