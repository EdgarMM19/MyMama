import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'dart:collection';


class ConfigActivity {
  String name;
  String genre;
  int span;

  ConfigActivity({this.name, this.genre, this.span});
}

class ConfigFixedActivity extends ConfigActivity {
  List<int> whenMinut;
  List<int> whenDia;
}

class ConfigFixedActivityFreeHour extends ConfigActivity {
  List<int> whenDia;
}

class Activity{
  ConfigActivity config;
  int start;
}

/*class SharedPrederencesClient {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void save(HashMap<DateTime, WeightPoint> data) async {
    setState(() {
      _prefs.then((SharedPreferences pref) {
        pref.setString("data",
            jsonEncode(data.values.map((e) => e.toJson()).toList())
        );
      });
    });
  }
}*/