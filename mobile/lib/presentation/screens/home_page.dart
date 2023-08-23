import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/bloc/task/task_bloc.dart';
import 'package:mobile/data_provider/task_provider.dart';
import 'package:mobile/presentation/widgets/list_slider.dart';
import 'package:mobile/repository/task_repository.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TaskRepository taskRepository = TaskRepository(TaskProvider());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return RepositoryProvider.value(
      value: taskRepository,
      child: BlocProvider(
        create: (context) => TaskBloc(taskRepository)..add(LoadTasks()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: screenHeight * 0.08,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.05),
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.13,
                    height: screenWidth * 0.13,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQc0slekZ9XFM4E-8HD67qmooXoiryocZW8v4ow6ntCw&s"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "july 14 2023",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: screenHeight * 0.016,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.006,
                        ),
                        Row(
                          children: [
                            Text(
                              "Hello, ",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: screenHeight * 0.021,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Abeni27 F.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenHeight * 0.021,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildText(
                          txt: "Today's Task",
                          size: screenHeight * 0.030,
                          color: Colors.black.withOpacity(0.8),
                          screenWidth: screenWidth,
                          pad: 0),
                      OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.05,
                                        left: screenWidth * 0.05,
                                        right: screenWidth * 0.05),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: buildText(
                                              txt: "Add New TAsk",
                                              size: screenHeight * 0.0190,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              screenWidth: screenWidth,
                                              pad: 2),
                                        ),
                                        SizedBox(height: screenHeight * 0.05),
                                        buildText(
                                            txt: "Titel",
                                            size: screenHeight * 0.018,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            screenWidth: screenWidth,
                                            pad: 0),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: "Add Title",
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.05),
                                        buildText(
                                            txt: "Description",
                                            size: screenHeight * 0.018,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            screenWidth: screenWidth,
                                            pad: 0),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: "Add Description",
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.1),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              OutlinedButton(
                                                onPressed: () {},
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  minimumSize: Size(
                                                      screenWidth * 0.37,
                                                      screenHeight * 0.054),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50), // <-- Radius
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: screenHeight *
                                                            0.017,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  width: screenWidth * 0.05),
                                              OutlinedButton(
                                                onPressed: () {
                                                  BlocProvider.of<TaskBloc>(
                                                          context)
                                                      .add(AddTask("Jump",
                                                          "Jumping for an hour"));
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.blue,
                                                  minimumSize: Size(
                                                      screenWidth * 0.37,
                                                      screenHeight * 0.054),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50), // <-- Radius
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Create',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: screenHeight *
                                                            0.017,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ));
                              });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize:
                              Size(screenWidth * 0.25, screenHeight * 0.04),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(50), // <-- Radius
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: screenHeight * 0.025,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'New Task',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenHeight * 0.017,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
// List view for the Tasks
                ListSlider()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildText(
      {required String txt,
      required double size,
      required double screenWidth,
      required Color color,
      required double pad}) {
    return Padding(
      padding: EdgeInsets.all(pad),
      child: Text(
        txt,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: size,
        ),
      ),
    );
  }
}
