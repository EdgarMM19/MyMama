import 'dart:math';

import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<TodoItem> items = List<TodoItem>.generate(
    100,
    (i) => TodoItem(
      itemData: i.toString(),
      itemHour: i.toString(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: item,
            );
          },
        )
      );
  }
}

class TodoItem extends StatelessWidget {
  final dynamic itemData;
  final dynamic itemHour;
  final Random rng = Random();

  TodoItem({Key key, @required this.itemData, this.itemHour}) : super(key: key);

  Color randomColor() {
    return Color.fromRGBO(rng.nextInt(64) + 64, rng.nextInt(64) + 160, rng.nextInt(64) + 160, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(itemHour + ":00",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal)
            )
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: randomColor(),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(itemData),
                )
            )
        ),
      ])
    );
  }
}


