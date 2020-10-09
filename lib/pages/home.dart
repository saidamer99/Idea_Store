import 'package:app_idea/component/category_home.dart';
import 'package:app_idea/component/drawer.dart';
import 'package:app_idea/pages/nature.dart';
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
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: AppBar(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(15))),
                    title: Text(
                      "Idea",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                    actions: <Widget>[
                      IconButton(icon: Icon(Icons.search), onPressed: () {})
                    ],
                  ),
                ),
                drawer: MyDrawer(),
                body: ListView(
                  children: <Widget>[
                    Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Carousel(
                          // overlayShadow: true,
                          // defaultImage: Colors.black,
                          // boxFit: BoxFit.contain,
                          // borderRadius: true,
                          // animationDuration: Duration(milliseconds: 3000),
                          // autoplayDuration: Duration(milliseconds: 6000),
                          // animationCurve: Curves.slowMiddle,
                          autoplay: true,
                          images: [
                            Image.asset(
                              "images/1.jpg",
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              "images/1.jpg",
                              fit: BoxFit.contain,
                            ),
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
                          dotSpacing: 40,
                          dotIncreasedColor: Colors.blue,
                          indicatorBgPadding: 15,
                          dotBgColor: Colors.grey.withOpacity(0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "الأقسام",
                        style: TextStyle(fontSize: 30, color: Colors.redAccent),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        height: 200,
                        width: 200,
                        child: CategoriesHome()),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'أخر المنتجات',
                        style: TextStyle(fontSize: 30, color: Colors.redAccent),
                      ),
                    ),
                    Container(
                      height: 400,
                      color: Colors.grey,
                      child: GridView(
                          padding: EdgeInsets.all(5),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          children: <Widget>[
                            buildCard('images/1.jpg', 'nature'),
                            buildCard('images/2.jpg', 'nature'),
                            buildCard('images/3.jpg', 'nature'),
                            buildCard('images/1.jpg', 'nature'),
                            buildCard('images/2.jpg', 'nature'),
                            buildCard('images/3.jpg', 'nature'),
                          ]),
                    ),
                  ],
                )),
          )
        : Start_Screen();
  }

  InkWell buildCard(String image, String category) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Image.asset(
              image,
              fit: BoxFit.fill,
            )),
            Container(
                child: Text(
              category,
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
          ],
        ),
      ),
    );
  }
}
