import 'package:flutter/material.dart';
import 'package:my_mama/calendarPage.dart';
import 'package:my_mama/callMyMamaPage.dart';
import 'package:my_mama/configurationPage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MyMama',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
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
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 1);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget> [
          Container(child: ConfigurationPage()),
          Container(child: CalendarPage()),
          Container(child: CallMyMamaPage()),
        ]
      )
    );
  }
}
