import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'dart:collection';


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