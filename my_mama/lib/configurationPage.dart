import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_http_request.dart';
import 'package:my_mama/calendarPage.dart';
import 'package:my_mama/dataModels.dart';
import 'todoList.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'dataModels.dart';

class ConfigurationPage extends StatefulWidget {
  final Map<String, dynamic> dataQueries;
  ConfigurationPage({Key key, this.dataQueries}) : super(key: key);

  @override
  _ConfigurationPageState createState() =>
      _ConfigurationPageState(dataQueries: dataQueries);
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final Map<String, dynamic> dataQueries;
  _ConfigurationPageState({this.dataQueries});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Configuration",
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal)),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: LangButton(),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(
          text: "Sport",
          dataQueries: dataQueries,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(
          text: "Meal",
          dataQueries: dataQueries,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(
          text: "Hygiene",
          dataQueries: dataQueries,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(
          text: "Homework",
          dataQueries: dataQueries,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(
          text: "Lectures",
          dataQueries: dataQueries,
        ),
      ),
    ]));
  }
}

class LangButton extends StatefulWidget {
  @override
  _LangButtonState createState() => _LangButtonState();
}

class _LangButtonState extends State<LangButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          textColor: Colors.black,
          child: Row(children: [
            Icon(Icons.language, color: Colors.teal),
            Text("  Language"),
          ]),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Container(
                    height: 400.0,
                    width: 360.0,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Language",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                            child: Text(
                                "At the moment only in English \n sorry International Hackers:("))
                      ],
                    ),
                  ),
                );
              },
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ));
  }
}

class SportButton extends StatefulWidget {
  String text;
  final Map<String, dynamic> dataQueries;

  SportButton({this.text, this.dataQueries});
  @override
  _SportButtonState createState() =>
      _SportButtonState(text: this.text, dataQueries: dataQueries);
}

class _SportButtonState extends State<SportButton> {
  String text;
  final Map<String, dynamic> dataQueries;

  _SportButtonState({this.text, this.dataQueries});
  IconData icon;
  Color bg = Colors.teal;
  @override
  void initState() {
    super.initState();
    if (text == "Sport") {
      icon = Icons.pedal_bike;
      bg = const Color(0xFFF08080);
    } else if (text == "Meal") {
      icon = Icons.fastfood;
      bg = const Color(0xFF90EE90);
    } else if (text == "Hygiene") {
      icon = Icons.clean_hands;
      bg = const Color(0xFF87CEFA);
    } else if (text == "Homework") {
      icon = Icons.book;
      bg = const Color(0xFFFFA07A);
    } else if (text == "Lectures") {
      icon = Icons.library_books;
      bg = const Color(0xFFF0E68C);
    }
  }

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          textColor: Colors.black,
          child: Row(children: [
            Icon(icon, color: bg),
            Text("  " + text),
          ]),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  child: Container(
                    height: 600.0,
                    width: 360.0,
                    child: ListView(
                      children: [
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Add " + text + " activity",
                            style: TextStyle(
                                fontSize: 24,
                                color: bg,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20),
                        const Divider(
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: SportForm(
                            type: text,
                            dataQueries: dataQueries,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: TaskList(
                            type: text,
                            dataQueries: dataQueries,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ));
  }
}

class SportForm extends StatefulWidget {
  String type;
  final Map<String, dynamic> dataQueries;

  SportForm({this.type, this.dataQueries});

  @override
  _SportFormState createState() =>
      _SportFormState(type: this.type, dataQueries: dataQueries);
}

class _SportFormState extends State<SportForm> {
  String type; // type
  final Map<String, dynamic> dataQueries;

  _SportFormState({this.type, this.dataQueries});
  bool hourPresent = false;
  final _formKey = GlobalKey<FormState>();
  final days = List.filled(7, false); // dies de la setmana
  TimeOfDay time = TimeOfDay.now(); // hora

  TextEditingController timeCtl = TextEditingController(); //
  TextEditingController timeCtlName = TextEditingController(); // name

  TextEditingController timeCtl2 = TextEditingController(); // duration

  Color bg = Colors.teal;
  @override
  void initState() {
    super.initState();
    if (type == "Sport") {
      bg = const Color(0xFFF08080);
    } else if (type == "Meal") {
      bg = const Color(0xFF90EE90);
    } else if (type == "Hygiene") {
      bg = const Color(0xFF87CEFA);
    } else if (type == "Homework") {
      bg = const Color(0xFFFFA07A);
    } else if (type == "Lectures") {
      bg = const Color(0xFFF0E68C);
    }
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: timeCtlName, // add this line.

            decoration: const InputDecoration(
              hintText: 'Enter task name',
            ),
            validator: (value) {
              return null;
            },
          ),
          TextFormField(
            controller: timeCtl, // add this line.
            decoration: InputDecoration(
              labelText: 'Start time (if one preferred)',
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              TimeOfDay picked =
                  await showTimePicker(context: context, initialTime: time);
              if (picked != null && picked != time) {
                hourPresent = true;
                var now = DateTime.now();

                var dt = DateTime(
                    now.year, now.month, now.day, picked.hour, picked.minute);
                String _formattetime = DateFormat.Hm().format(dt);
                timeCtl.text = _formattetime; // add this line.
                setState(() {
                  time = picked;
                });
              }
            },
          ),
          TextFormField(
            controller: timeCtl2, // add this line.
            decoration: new InputDecoration(
                labelText: "Enter the activity duration in minutes"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          WeekdaySelector(
            onChanged: (int day) {
              setState(() {
                // Use module % 7 as Sunday's index in the array is 0 and
                // DateTime.sunday constant integer value is 7.
                final index = (day + 6) % 7;
                // We "flip" the value in this example, but you may also
                // perform validation, a DB write, an HTTP call or anything
                // else before you actually flip the value,
                // it's up to your app's needs.
                days[index] = !days[index];
              });
            },
            values: days,
          ),
          Center(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(bg)),
              onPressed: () {
                bool daysPresent = false;
                List<int> daysInt = [];
                for (int i = 0; i < 7; ++i) {
                  if (days[i]) {
                    daysInt.add(i);
                    daysPresent = true;
                  }
                }
                if (hourPresent && daysPresent) {
                  //ConfigFixedActivity
                  dataQueries["addConfig"](ConfigFixedActivity(
                      name: timeCtlName.text,
                      genre: type,
                      span: int.parse(timeCtl2.text),
                      whenDia: daysInt,
                      whenMinut: List.filled(
                          daysInt.length, time.hour * 60 + time.minute)));
                } else if (daysPresent) {
                  //ConfigFreeHour
                  dataQueries["addConfig"](ConfigFixedActivityFreeHour(
                    name: timeCtlName.text,
                    genre: type,
                    span: int.parse(timeCtl2.text),
                    whenDia: daysInt,
                  ));
                } else {
                  //ConfigActivityFreeHour
                  dataQueries["addConfig"](ConfigActivityFreeHour(
                    name: timeCtlName.text,
                    genre: type,
                    span: int.parse(timeCtl2.text),
                  ));
                }
                Navigator.of(context).pop();
              },
              child: Text('Create task'),
            ),
          )),
        ],
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  final String type;
  final Map<String, dynamic> dataQueries;

  TaskList({this.type, this.dataQueries});
  @override
  _TaskListState createState() =>
      _TaskListState(type: this.type, dataQueries: dataQueries);
}

class _TaskListState extends State<TaskList> {
  String type;
  final Map<String, dynamic> dataQueries;

  _TaskListState({this.type, this.dataQueries});

  Color bg = Colors.teal;
  @override
  void initState() {
    super.initState();
    if (type == "Sport") {
      bg = const Color(0xFFF08080);
    } else if (type == "Meal") {
      bg = const Color(0xFF90EE90);
    } else if (type == "Hygiene") {
      bg = const Color(0xFF87CEFA);
    } else if (type == "Homework") {
      bg = const Color(0xFFFFA07A);
    } else if (type == "Lectures") {
      bg = const Color(0xFFF0E68C);
    }
  }

  List<ConfigActivity> calculateAct(List<ConfigActivity> a) {
    List<ConfigActivity> mainList = [];
    for (var act in a) {
      if (type.toLowerCase() == act.genre.toLowerCase()) {
        mainList.add(act);
      }
    }
    return mainList;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dataQueries["consultaConfigs"](),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<ConfigActivity> mainList = calculateAct(snapshot.data);
            return Container(
                height: 300,
                child: ListView.builder(
                  // Let the ListView know how many items it needs to build.
                  itemCount: mainList.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = mainList[index];
                    // hacerlo bonito
                    return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Container(
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(16.0),
                              color: bg,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  item.name.toUpperCase(),
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text("Duration ${item.span} minutes")
                              ],
                            )));
                  },
                ));
          } else {
            print(snapshot.error);
            return Placeholder();
          }
        });
  }
}
