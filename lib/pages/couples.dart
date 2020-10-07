import 'package:flutter/material.dart';

class Couples extends StatefulWidget {
  @override
  _CouplesState createState() => _CouplesState();
}

class _CouplesState extends State<Couples> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Couples'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Couples')],
        ),
      ),
    );
  }
}
