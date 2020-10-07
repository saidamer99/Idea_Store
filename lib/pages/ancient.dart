import 'package:flutter/material.dart';

class Ancient extends StatefulWidget {
  @override
  _AncientState createState() => _AncientState();
}

class _AncientState extends State<Ancient> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ancient'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Ancient')],
        ),
      ),
    );
  }
}
