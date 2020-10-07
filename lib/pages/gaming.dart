import 'package:flutter/material.dart';

class Gaming extends StatefulWidget {
  @override
  _GamingState createState() => _GamingState();
}

class _GamingState extends State<Gaming> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gaming'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: ListView(
          children: <Widget>[Text('Gaming')],
        ),
      ),
    );
  }
}
