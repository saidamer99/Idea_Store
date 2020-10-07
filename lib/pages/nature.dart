import 'package:flutter/material.dart';

class Nature extends StatefulWidget {
  @override
  _NatureState createState() => _NatureState();
}

class _NatureState extends State<Nature> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nature'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Nature')],
        ),
      ),
    );
  }
}
