import 'package:flutter/material.dart';

class Sports extends StatefulWidget {
  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sports'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Sports')],
        ),
      ),
    );
  }
}
