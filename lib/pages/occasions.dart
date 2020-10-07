import 'package:flutter/material.dart';

class Occasions extends StatefulWidget {
  @override
  _OccasionsState createState() => _OccasionsState();
}

class _OccasionsState extends State<Occasions> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Occasions'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Occasions')],
        ),
      ),
    );
  }
}
