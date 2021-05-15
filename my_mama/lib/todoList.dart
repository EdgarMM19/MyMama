import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<TodoItem> items = List<TodoItem>.generate(
    1000,
    (i) => TodoItem(
      itemData: i.toString(),
      itemHour: i.toString(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500.0,
        height: 500.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: item,
            );
          },
        ));
  }
}

class TodoItem extends StatelessWidget {
  final dynamic itemData;
  final dynamic itemHour;
  const TodoItem({Key key, @required this.itemData, this.itemHour})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1000.0,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Text(itemHour,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                child: Text(itemData)),
          ],
        ));
  }
}
