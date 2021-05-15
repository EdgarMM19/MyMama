import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'dataModels.dart';
import 'scheduler.dart';

class TodoList extends StatefulWidget {
  final Map<String, dynamic> dataQueries;

  TodoList({this.dataQueries});

  @override
  _TodoListState createState() => _TodoListState(dataQueries: dataQueries);
}

class _TodoListState extends State<TodoList> {
  final Map<String, dynamic> dataQueries;
  _TodoListState({this.dataQueries});

  final List<TodoItem> items = [
    TodoItem(itemName: "Real", itemInitialMinute: 9*60, itemDuration: 1, itemType: "Math"),
    TodoItem(itemName: "Complexa", itemInitialMinute: 10*60, itemDuration: 1, itemType: "Math"),
    TodoItem(itemName: "Parallelism", itemInitialMinute: 11*60, itemDuration: 1, itemType: "Info"),
    TodoItem(itemName: "Real", itemInitialMinute: 13*60, itemDuration: 2, itemType: "Math")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
          future: dataQueries["consultaConfigs"](),
          builder: (context, snapshot) {
            List<TodoItem> acti = today_schedule(snapshot.data).map<TodoItem>(
                    (e) => TodoItem(itemName: e.config.name,
                                    itemInitialMinute: e.start,
                                    itemDuration: e.config.span,
                                    itemType: e.config.genre)).toList();
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: acti.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = acti[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: item,
                );
              },
            );
          },
        )
      );
  }
}

class TodoItem extends StatelessWidget {
  final String itemName;
  final int itemInitialMinute;
  final int itemDuration;
  final String itemType;
  final Random rng = Random();

  TodoItem({Key key, this.itemName, this.itemInitialMinute, this.itemDuration, this.itemType}) : super(key: key);

  Color randomColor() {

    int hashv = (int.parse(hash(this.itemName), radix: 16)~/1e30)%(64*64*64);
    int a = hashv%64;
    int b = (hashv~/64)%64;
    int c = (hashv~/64~/64)%64;
    return Color.fromRGBO(a%64 + 64, b%64 + 160, c%64 + 160, 1.0);
  }

  String minuteToString(int initialMinute) {
    int h = initialMinute~/60;
    int m = initialMinute%60;
    String H = h.toString();
    if (h < 10) H = "0" + H;
    String M = m.toString();
    if (m < 10) M = "0" + M;
    return H + ":" + M;
  }

  String hash(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(minuteToString(itemInitialMinute),
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal)
            )
        ),
        Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 40*max(itemDuration, 1),
                decoration: BoxDecoration(
                  color: randomColor(),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(itemName)
                  ),
                )
              )
            )
        ),)
      ])
    );
  }
}


