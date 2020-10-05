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
      title: "Idea",
      home: Start_Screen(),
    );
  }
}
