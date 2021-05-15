import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'package:my_mama/dataModels.dart';
import 'todoList.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'connection.dart';
import 'dataModels.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
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
                    fontSize: 72.0,
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
        child: SportButton(text: "Sport"),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(text: "Meal"),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(text: "Higiene"),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(text: "Homework"),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SportButton(text: "Lectures"),
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
  SportButton({this.text});
  @override
  _SportButtonState createState() => _SportButtonState(text: this.text);
}

class _SportButtonState extends State<SportButton> {
  String text;
  _SportButtonState({this.text});
  IconData icon;
  @override
  void initState() {
    super.initState();
    if (text == "Sport") {
      icon = Icons.pedal_bike;
    } else if (text == "Meal") {
      icon = Icons.fastfood;
    } else if (text == "Higiene") {
      icon = Icons.clean_hands;
    } else if (text == "Homework") {
      icon = Icons.book;
    } else if (text == "Lectures") {
      icon = Icons.library_books;
    }
  }

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          textColor: Colors.black,
          child: Row(children: [
            Icon(icon, color: Colors.teal),
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
                                color: Colors.teal,
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
                          child: SportForm(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: TaskList(type: text),
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
  @override
  _SportFormState createState() => _SportFormState();
}

class _SportFormState extends State<SportForm> {
  final _formKey = GlobalKey<FormState>();
  final days = List.filled(7, true);

  TextEditingController timeCtl = TextEditingController();
  TextEditingController timeCtl2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
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
              TimeOfDay time = TimeOfDay.now();
              FocusScope.of(context).requestFocus(new FocusNode());

              TimeOfDay picked =
                  await showTimePicker(context: context, initialTime: time);
              if (picked != null && picked != time) {
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
            validator: (value) {},
          ),
          TextFormField(
            controller: timeCtl2, // add this line.
            decoration: new InputDecoration(
                labelText: "Enter the activity duration in minutes"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: (value) {},
          ),
          WeekdaySelector(
            onChanged: (int day) {
              setState(() {
                // Use module % 7 as Sunday's index in the array is 0 and
                // DateTime.sunday constant integer value is 7.
                final index = day % 7;
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
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal)),
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
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
  String type;
  TaskList({this.type});
  @override
  _TaskListState createState() => _TaskListState(type: this.type);
}

class _TaskListState extends State<TaskList> {
  List mainList = new List();
  String type;
  _TaskListState({this.type});

  @override
  void initState() {
    super.initState();

    mainList.add(ConfigActivity(name: "Gym", genre: "Sport", span: 10));
  }

  Widget build(BuildContext context) {
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.teal,
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
  }
}
