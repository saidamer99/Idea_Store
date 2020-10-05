import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Start_Screen extends StatelessWidget {
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
                "images/s1.jpg",
                fit: BoxFit.fill,
              ),
              Image.asset(
                "images/s2.jpg",
                fit: BoxFit.fill,
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "images/s3.jpg",
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
                                      text: "انطلق",
                                      style: TextStyle(
                                          color: Colors.blue[500],
                                          fontSize: 25))),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.blue[500],
                                size: 50,
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("go");
                          },
                        )),
                  )
                ],
              ),
            ],
            autoplay: false,
            showIndicator: true,
            dotBgColor: Colors.white24,
            dotIncreasedColor: Colors.blue,
            dotColor: Colors.pink,
          ),
        ),
      ),
    );
  }
}
