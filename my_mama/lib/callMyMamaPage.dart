import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'todoList.dart';

class CallMyMamaPage extends StatefulWidget {
  const CallMyMamaPage({Key key}) : super(key: key);

  @override
  _CallMyMamaPageState createState() => _CallMyMamaPageState();
}

class _CallMyMamaPageState extends State<CallMyMamaPage> {
  @override
  Widget build(BuildContext context) {
    double padding = 25;
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("MyMama",
                  style: TextStyle(
                      fontSize: 72.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
            ],
          ),
        ),
        Padding(
            padding:
            EdgeInsets.symmetric(horizontal: padding, vertical: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TodoList()
              ],
            )
        ),
      ],
    );
  }
}
