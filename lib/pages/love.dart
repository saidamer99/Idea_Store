import 'package:flutter/material.dart';

class Love extends StatefulWidget {
  @override
  _LoveState createState() => _LoveState();
}

class _LoveState extends State<Love> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Love'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Love')],
        ),
      ),
    );
  }
}
