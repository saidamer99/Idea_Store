import 'package:app_idea/component/category_home.dart';
import 'package:app_idea/component/drawer.dart';
import 'package:app_idea/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isStart = false;
  getStart() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var temp = preferences.getBool('start');
    if (temp != null) {
      setState(() {
        isStart = preferences.getBool('start');
        print(isStart);
      });
    }
  }

  @override
  void initState() {
    getStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isStart
        ? Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Idea",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.search), onPressed: () {})
                  ],
                ),
                drawer: MyDrawer(),
                body: ListView(
                  children: <Widget>[
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Carousel(
                        autoplay: true,
                        images: [
                          Image.asset(
                            "images/1.jpg",
                            fit: BoxFit.contain,
                          ),
                          Image.asset(
                            "images/2.jpg",
                            fit: BoxFit.contain,
                          ),
                          Image.asset(
                            "images/3.jpg",
                            fit: BoxFit.contain,
                          )
                        ],
                        dotSize: 7,
                        dotIncreasedColor: Colors.blue,
                        indicatorBgPadding: 15,
                        dotBgColor: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "الأقسام",
                        style: TextStyle(fontSize: 30, color: Colors.blue),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        height: 200,
                        width: 200,
                        child: Categories_Home()),
                  ],
                )),
          )
        : Start_Screen();
  }
}
