import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'todoList.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:http/http.dart' as http;

class CallMyMamaPage extends StatefulWidget {
  final Map<String, dynamic> dataQueries;
  CallMyMamaPage({Key key, this.dataQueries}) : super(key: key);

  @override
  _CallMyMamaPageState createState() => _CallMyMamaPageState(dataQueries: dataQueries);
}

class _CallMyMamaPageState extends State<CallMyMamaPage> {
  final Map<String, dynamic> dataQueries;
  _CallMyMamaPageState({this.dataQueries});


  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
