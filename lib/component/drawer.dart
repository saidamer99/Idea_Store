import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  bool issignin = false;

  getpref() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    username = preference.getString("User");
    if (username != null) {
      setState(() {
        issignin = true;
      });
    }
  }

  clearpref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("User");
  }

  @override
  void initState() {
    getpref();
    super.initState();
    print(issignin);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/login/wallpaper.jpg'))),
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      iconSize: 40,
                      color: issignin ? Colors.green : Colors.white70,
                      icon: Icon(Icons.account_circle),
                      onPressed: () {}),
                  Text(
                    issignin ? username : "UserName",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {
                while (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
              ),
              leading: Icon(
                Icons.home,
                color: Colors.white70,
              ),
              title: Text(
                "الصفحة الرئيسية",
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("Categories");
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
              ),
              leading: Icon(
                Icons.list,
                color: Colors.white70,
              ),
              title: Text(
                "الأقسام",
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ),
            Container(
              child: Divider(
                color: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("startFromHelp");
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
              ),
              leading: Icon(
                Icons.help,
                color: Colors.white70,
              ),
              title: Text(
                "مساعدة",
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("about");
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
              ),
              leading: Icon(
                Icons.info,
                color: Colors.white70,
              ),
              title: Text(
                "حول التطبيق",
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("order");
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
              ),
              leading: Icon(
                Icons.attach_file,
                color: Colors.white70,
              ),
              title: Text(
                "طلب خاص ",
                style: TextStyle(fontSize: 15, color: Colors.white70),
              ),
            ),
            issignin
                ? ListTile(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                    ),
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.white70,
                    ),
                    title: Text(
                      "تسجيل الخروج",
                      style: TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                  )
                : ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed("login");
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                    ),
                    leading: Icon(
                      Icons.person,
                      color: Colors.white70,
                    ),
                    title: Text(
                      "تسجيل الدخول",
                      style: TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                  ),
          ]),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        setState(() {
          issignin = false;
          clearpref();
          Navigator.of(context).pop();
        });
      },
    );

    Widget cancelButton = new FlatButton(
      child: Text(
        "Cancel",
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.black45,
      title: Text(
        "تسجيل الخروج",
        style: TextStyle(color: Colors.redAccent, fontSize: 12),
        textAlign: TextAlign.center,
      ),
      content: Text(
        "هل تريد حقا تسجيل الخروج؟؟",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.center,
      ),
      actions: [okButton, cancelButton],
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
