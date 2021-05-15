import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'todoList.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
                color: Colors.teal)
              ),
            ],
          ),
        ),
        Expanded(
          child: TodoList()
        ),
      ],
    );
  }
}
