import 'package:flutter/material.dart';

class Girls extends StatefulWidget {
  @override
  _GirlsState createState() => _GirlsState();
}

class _GirlsState extends State<Girls> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Girls'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Girls')],
        ),
      ),
    );
  }
}
