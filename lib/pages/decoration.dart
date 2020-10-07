import 'package:flutter/material.dart';

class Decorations extends StatefulWidget {
  @override
  _DecorationsState createState() => _DecorationsState();
}

class _DecorationsState extends State<Decorations> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Decorations'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Decorations')],
        ),
      ),
    );
  }
}
