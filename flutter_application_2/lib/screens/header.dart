
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            // Icon(Icons.square_foot),
          Column(
            children: [
              Text("July 14, 2023"),
              Text("Hello, Abel"),
            ],         
          ),
          ],),
          Icon(Icons.notifications),
        ],
      ),
    );
  }
}