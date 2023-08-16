import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF3B4CA6),
                // You can add an image or initials to the avatar if needed
                // child: Icon(Icons.person),
              ),
              SizedBox(width: 16), // Add some spacing between avatar and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat("MMMM d, y")
                        .format(DateTime.now()), // Format the date
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    "Hello, Yohannes",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
              Spacer(), // Expands the space between "Hello" and the notification icon
              Align(
                child: IconButton(
                  onPressed: () {
                    // Handle the notification icon tap
                  },
                  icon: Icon(Icons.notifications),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
