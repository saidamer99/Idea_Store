import 'package:flutter/material.dart';

class Famous extends StatefulWidget {
  @override
  _FamousState createState() => _FamousState();
}

class _FamousState extends State<Famous> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Famous'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Famous')],
        ),
      ),
    );
  }
}
