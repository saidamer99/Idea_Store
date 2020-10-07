import 'package:flutter/material.dart';

class Awareness extends StatefulWidget {
  @override
  _AwarenessState createState() => _AwarenessState();
}

class _AwarenessState extends State<Awareness> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Awareness'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Awareness')],
        ),
      ),
    );
  }
}
