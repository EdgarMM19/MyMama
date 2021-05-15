import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'todoList.dart';

class CalendarPage extends StatefulWidget {
  final Map<String, dynamic> dataQueries;
  CalendarPage({Key key, this.dataQueries}) : super(key: key);

  @override
  _CalendarPageState createState() =>
      _CalendarPageState(dataQueries: this.dataQueries);
}

class _CalendarPageState extends State<CalendarPage> {
  final Map<String, dynamic> dataQueries;
  _CalendarPageState({this.dataQueries});

  @override
  Widget build(BuildContext context) {
    double padding = 25;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("MyMama",
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
            ],
          ),
        ),
        Expanded(child: TodoList(dataQueries: dataQueries)),
      ],
    );
  }
}
