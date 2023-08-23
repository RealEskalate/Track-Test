import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile/presentation/pages/tasks_list.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          toolbarHeight: 120,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                width: 60, // specify the width
                height: 60, // specify the height
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                      color: Colors.grey,
                      width:
                          2.0), // this makes it "empty" with a visible border
                  borderRadius:
                      BorderRadius.circular(16.0), // this rounds the corners
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Text(
                    DateFormat('MMMM d, y').format(
                      DateTime.now(),
                    ),
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  const Row(
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Yohannes",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_add_outlined),
              ),
            )
          ],
        ),
      ),
      body: const TasksList(),
    );
  }
}
