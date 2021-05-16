import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'package:my_mama/callMyMamaPage.dart';
import 'package:my_mama/configurationPage.dart';
import 'package:my_mama/dataModels.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MyMama',
      theme: new ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
        backgroundColor: const Color(0xFFFAF0),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    setState(() {
      _prefs.then((SharedPreferences prefs) {
        prefs.clear();
        prefs.setString("data", jsonEncode([]));
        prefs.setString(
            "data",
            jsonEncode([
              ConfigActivityOneTime(
                  name: "Not supposed to be seen",
                  span: 42,
                  genre: "Random",
                  whenDia: -1,
                  whenMinut: 10 * 60),
            ]));
      });
    });
  }

  Future<List<ConfigActivity>> consultaConfigs() {
    return _prefs.then((SharedPreferences pref) {
      List<ConfigActivity> listConfig =
          jsonDecode(pref.getString("data")).map<ConfigActivity>((e) {
        if (e["type"] == 1) return ConfigFixedActivity.fromJson(e);
        if (e["type"] == 2) return ConfigFixedActivityFreeHour.fromJson(e);
        if (e["type"] == 3) return ConfigActivityFreeHour.fromJson(e);
        if (e["type"] == 4) return ConfigActivityOneTime.fromJson(e);
      }).toList();
      return listConfig;
    });
  }

  void addConfig(ConfigActivity newConfig) async {
    List<ConfigActivity> data = await consultaConfigs();
    data.add(newConfig);
    setState(() {
      _prefs.then((SharedPreferences pref) {
        pref.setString(
            "data", jsonEncode(data.map((e) => e.toJson()).toList()));
      });
    });
  }

  void deleteConfig(ConfigActivity delConfig) async {
    List<ConfigActivity> data = await consultaConfigs();
    data.remove(delConfig);
    setState(() {
      _prefs.then((SharedPreferences pref) {
        pref.setString(
            "data", jsonEncode(data.map((e) => e.toJson()).toList()));
      });
    });
  }

  void saveConfigs(List<ConfigActivity> configs) async {
    setState(() {
      _prefs.then((SharedPreferences pref) {
        pref.setString(
            "data", jsonEncode(configs.map((e) => e.toJson()).toList()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Function> dataQueries = {
      "addConfig": addConfig,
      "consultaConfigs": consultaConfigs,
      "saveConfigs": saveConfigs,
      "deleteConfig": deleteConfig
    };

    final PageController controller = PageController(initialPage: 1);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: <Widget>[
          ConfigurationPage(dataQueries: dataQueries),
          CalendarPage(dataQueries: dataQueries),
          CallMyMamaPage(dataQueries: dataQueries),
        ]));
  }
}
