import 'package:app_idea/component/drawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                height: 200,
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
              )
            ],
          )),
    );
  }
}
