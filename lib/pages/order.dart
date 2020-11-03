import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order extends StatefulWidget {
  @override
  _Start_ScreenState createState() => _Start_ScreenState();
}

class _Start_ScreenState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Carousel(
            images: [
              Image.asset(
                "images/or1.jpg",
                fit: BoxFit.fill,
              ),
              Image.asset(
                "images/or2.jpg",
                fit: BoxFit.fill,
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "images/or3.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Positioned(
                        bottom: 60,
                        left: MediaQuery.of(context).size.width - 100,
                        width: 120,
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                  text: TextSpan(
                                      text: "متابعة",
                                      style: TextStyle(
                                          color: Colors.blue[500],
                                          fontSize: 25))),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.blue[500],
                                size: 30,
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).popAndPushNamed("go_order");

                            ////////////////////////////////////////
                            ///
                            ///
                            ///
                          },
                        )),
                  )
                ],
              ),
            ],
            autoplay: false,
            showIndicator: true,
            dotBgColor: Colors.white12,
            dotIncreasedColor: Colors.black,
            dotColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
