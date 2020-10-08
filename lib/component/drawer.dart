import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Directionality(
                textDirection: TextDirection.ltr,
                child: UserAccountsDrawerHeader(
                  accountName: null,
                  accountEmail: null,
                  currentAccountPicture: CircleAvatar(
                      foregroundColor: Colors.black,
                      child: Center(
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.yellow[400],
                        ),
                      ),
                      backgroundColor: Colors.black12.withOpacity(0.3)),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/said.jpg"),
                          fit: BoxFit.cover)),
                )),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('go');
              },
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text(
                "الصفحة الرئيسية",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("Categories");
              },
              leading: Icon(
                Icons.list,
                color: Colors.blue,
              ),
              title: Text(
                "الأقسام",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Divider(
                color: Colors.black,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("startFromHelp");
              },
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
              title: Text(
                "مساعدة",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.info,
                color: Colors.blue,
              ),
              title: Text(
                "حول التطبيق",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("login");
              },
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text(
                "تسجيل الدخول",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
