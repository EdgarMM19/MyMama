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
    return TextButton(
      child: Text("PRESS HERE"),
      onPressed: () {
        print("Mhan pitjat");
      },
    );
  }
}
