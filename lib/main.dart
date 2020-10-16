import 'package:app_idea/pages/category.dart';
import 'package:app_idea/pages/coverDetails.dart';
import 'package:app_idea/pages/coverList.dart';
import 'package:app_idea/pages/home.dart';
import 'package:app_idea/pages/login.dart';
import 'package:app_idea/pages/shopDetails.dart';
import 'package:app_idea/pages/start.dart';
import 'package:app_idea/pages/startrFromHelp.dart';
import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        },
        'startFromHelp': (context) {
          return StartScreenFromHelp();
        },
        'coverList': (context) {
          return CoverList();
        },
        "login": (context) {
          return Login();
        },
        "details": (context) {
          return CoverDetails();
        },
        "shop": (context) {
          return ShopDetails();
        }
      },
    );
  }
}
