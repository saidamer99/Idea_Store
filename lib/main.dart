import 'package:app_idea/pages/ancient.dart';
import 'package:app_idea/pages/animal.dart';
import 'package:app_idea/pages/awareness.dart';
import 'package:app_idea/pages/category.dart';
import 'package:app_idea/pages/couples.dart';
import 'package:app_idea/pages/decoration.dart';
import 'package:app_idea/pages/famous.dart';
import 'package:app_idea/pages/gaming.dart';
import 'package:app_idea/pages/girls.dart';
import 'package:app_idea/pages/home.dart';
import 'package:app_idea/pages/jobs.dart';
import 'package:app_idea/pages/love.dart';
import 'package:app_idea/pages/movies.dart';
import 'package:app_idea/pages/music.dart';
import 'package:app_idea/pages/nature.dart';
import 'package:app_idea/pages/occasions.dart';
import 'package:app_idea/pages/sport.dart';
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
        'music': (context) {
          return Music();
        },
        'animal': (context) {
          return Animal();
        },
        'nature': (context) {
          return Nature();
        },
        'sports': (context) {
          return Sports();
        },
        'awareness': (context) {
          return Awareness();
        },
        'love': (context) {
          return Love();
        },
        'couples': (context) {
          return Couples();
        },
        'girls': (context) {
          return Girls();
        },
        'decorations': (context) {
          return Decorations();
        },
        'gaming': (context) {
          return Gaming();
        },
        'famous': (context) {
          return Famous();
        },
        'movies': (context) {
          return Movies();
        },
        'jobs': (context) {
          return Jobs();
        },
        'occasions': (context) {
          return Occasions();
        },
        'ancient': (context) {
          return Ancient();
        },
      },
    );
  }
}
