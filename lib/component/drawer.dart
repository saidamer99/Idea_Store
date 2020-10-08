import 'dart:ui';

import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/login/wallpaper.jpg'))),
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      iconSize: 60,
                      color: Colors.red,
                      icon: Icon(Icons.person),
                      onPressed: () {}),
                  Text(
                    'mayar',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('go');
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "الصفحة الرئيسية",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("Categories");
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              leading: Icon(
                Icons.list,
                color: Colors.white,
              ),
              title: Text(
                "الأقسام",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              child: Divider(
                color: Colors.red,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("startFromHelp");
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              leading: Icon(
                Icons.help,
                color: Colors.white,
              ),
              title: Text(
                "مساعدة",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              leading: Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: Text(
                "حول التطبيق",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("login");
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "تسجيل الدخول",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
