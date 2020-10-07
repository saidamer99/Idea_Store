import 'package:app_idea/pages/category.dart';
import 'package:app_idea/pages/home.dart';
import 'package:app_idea/pages/start.dart';
import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Cairo"),
      title: "Idea",
      home: Home(),
      routes: {
        "go": (context) {
          return Home();
        },
        "Categories": (context) {
          return Categories();
        },
        "start": (context) {
          return Start_Screen();
        }
      },
    );
  }
}
