import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {

  final String? title;
  final String? description;
  final String? date;
  bool? status;

  TaskCard({required this.title, required this.description, required this.date, required this.status});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  

  @override
  Widget build(BuildContext context) {
    String? description = widget.description;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text( widget.title ?? ""),
          Text(description ?? "", overflow: TextOverflow.ellipsis),
          Text(widget.date ?? ""),
            ],
          ),
        ),
        
        Checkbox(value: widget.status, onChanged: (bool? value) => { setState((){widget.status = value!;}) }),
      ],
    );
  }
}