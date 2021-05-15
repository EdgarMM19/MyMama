import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'dart:collection';


class ConfigActivity {
  String name;
  String genre;
  int span;

  ConfigActivity({this.name, this.genre, this.span});

  ConfigActivity.fromJson(Map<String, dynamic> json) {
    this.name = json["name"] as String;
    this.genre = json["genre"] as String;
    this.span = json["span"] as int;
  }

  Map<String, dynamic> toJson() => {
    "name": this.name,
    "genre": this.genre,
    "span": span,
    "type": 0
  };
}

class ConfigFixedActivity extends ConfigActivity {
  List<int> whenMinut;
  List<int> whenDia;

  ConfigFixedActivity({this.name, this.genre, this.span, this.whenMinut, this.whenDia});

  ConfigFixedActivity.fromJson(Map<String, dynamic> json) {
    this.name = json["name"] as String;
    this.genre = json["genre"] as String;
    this.span = json["span"] as int;
    this.whenMinut = json["whenMinut"] as List<int>;
    this.whenDia = json["whenDia"] as List<int>;
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "genre": genre,
    "span": span,
    "type": 1,
    "whenMinut": whenMinut,
    "whenDia": whenDia,
  };

}

class ConfigFixedActivityFreeHour extends ConfigActivity {
  List<int> whenDia;

  ConfigFixedActivityFreeHour({this.name, this.genre, this.span, this.whenDia});

  ConfigFixedActivityFreeHour.fromJson(Map<String, dynamic> json) {
    this.name = json["name"] as String;
    this.genre = json["genre"] as String;
    this.span = json["span"] as int;
    this.whenDia = json["whenDia"] as List<int>;
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "genre": genre,
    "span": span,
    "type": 2,
    "whenDia": whenDia,
  };
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