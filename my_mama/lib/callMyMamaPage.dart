import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'todoList.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'connection.dart';
import 'package:my_mama/connection.dart';
import 'package:http/http.dart' as http;

class CallMyMamaPage extends StatefulWidget {
  const CallMyMamaPage({Key key}) : super(key: key);

  @override
  _CallMyMamaPageState createState() => _CallMyMamaPageState();
}

class _CallMyMamaPageState extends State<CallMyMamaPage> {
  List mainList = new List();
  MultiSelectController controller = new MultiSelectController();

  @override
  void initState() {
    super.initState();

    mainList.add(Task("Gym", 10, 250, "Sport"));
    mainList.add(Task("Run", 60, 250, "Sport"));
    mainList.add(Task("Swim", 120, 250, "Sport"));
    mainList.add(Task("Dinner with friends", 180, 1200, "Social"));

    controller.disableEditingWhenNoneSelected = true;
    controller.set(mainList.length);
  }

  void send() async {
    await sendTasks(mainList);
    await Future.delayed(Duration(milliseconds: 500));
    List<Task> algo = await fetchTasks(http.Client());
    print(algo);
  }

  void delete() {
    var list = controller.selectedIndexes;
    list.sort((b, a) =>
        a.compareTo(b)); //reoder from biggest number, so it wont error
    list.forEach((element) {
      mainList.removeAt(element);
    });

    setState(() {
      controller.set(mainList.length);
    });
  }

  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //block app from quitting when selecting
        var before = !controller.isSelecting;
        setState(() {
          controller.deselectAll();
        });
        return before;
      },
      child: new Scaffold(
        appBar: new AppBar(
          title:
              new Text('Selected ${controller.selectedIndexes.length} tasks'),
          backgroundColor: Colors.teal,
        ),
        body: ListView.builder(
          itemCount: mainList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: MultiSelectItem(
                isSelecting: controller.isSelecting,
                onSelected: () {
                  setState(() {
                    controller.toggle(index);
                  });
                },
                child: Container(
                  child: ListTile(
                    title: new Text("${mainList[index].name}"),
                    subtitle: new Text(
                        "${mainList[index].type} for ${mainList[index].span} minutes"),
                  ),
                  decoration: controller.isSelected(index)
                      ? new BoxDecoration(color: Colors.grey[300])
                      : new BoxDecoration(),
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: new TextButton(
          onPressed: send,
          child: Text(
            "  Call myMama  ",
            style: TextStyle(color: Colors.white, fontSize: 45),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)),
        ),
      ),
    );
  }
}
