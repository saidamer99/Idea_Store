import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Start_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Carousel(
            images: [
              Image.asset(
                "images/s3.jpg",
                fit: BoxFit.fill,
              ),
              Image.asset(
                "images/s2.jpg",
                fit: BoxFit.fill,
              ),
              Image.asset(
                "images/s1.jpg",
                fit: BoxFit.fill,
              )
            ],
            autoplay: false,
            showIndicator: false,
          ),
        ),
      ),
    );
  }
}
