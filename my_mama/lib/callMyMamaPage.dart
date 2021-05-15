import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'todoList.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:my_mama/dataModels.dart';

class CallMyMamaPage extends StatefulWidget {
  final Map<String, dynamic> dataQueries;
  CallMyMamaPage({Key key, this.dataQueries}) : super(key: key);

  @override
  _CallMyMamaPageState createState() =>
      _CallMyMamaPageState(dataQueries: dataQueries);
}

class _CallMyMamaPageState extends State<CallMyMamaPage> {
  final Map<String, dynamic> dataQueries;
  _CallMyMamaPageState({this.dataQueries});

  List mainList = new List();
  MultiSelectController controller = new MultiSelectController();

  @override
  void initState() {
    super.initState();

    mainList.add(ConfigActivity(name: "Gym", genre: "Sport", span: 10));
    mainList.add(ConfigActivity(name: "Run", genre: "Sport", span: 60));
    mainList.add(ConfigActivity(name: "Swim", genre: "Sport", span: 120));
    mainList.add(ConfigActivity(
        name: "Dinner with friends", genre: "Social", span: 150));

    controller.disableEditingWhenNoneSelected = true;
    controller.set(mainList.length);
  }

  void send() async {
    //
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
