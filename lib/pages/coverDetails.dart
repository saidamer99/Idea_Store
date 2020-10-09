import 'package:flutter/material.dart';

class CoverDetails extends StatefulWidget {
  @override
  _CoverDetailsState createState() => _CoverDetailsState();
}

class _CoverDetailsState extends State<CoverDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Stack(
                children: <Widget>[buildTopImage(), buildTopBar()],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              margin: EdgeInsets.only(right: 10, left: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildNumberOfPhones(),
                  SizedBox(
                    width: 20,
                  ),
                  buildNumberOfPhones(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int numberOfPhones = 0;
  Container buildNumberOfPhones() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      height: 80,
      width: 150,
      child: Center(
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildPositionedBottomAdd(50),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  numberOfPhones.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Padding(padding: EdgeInsets.only(right: 10)),
                buildPositionedBottomMines(50)
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool like = false;
  Container buildTopBar() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      height: 52,
      child: Positioned(
        top: 30,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Row(
                    children: <Widget>[
                      IconButton(
                          iconSize: 30.0,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  )),
                  IconButton(
                      iconSize: 30.0,
                      padding: EdgeInsets.only(left: 10),
                      icon: like
                          ? Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                      onPressed: () {
                        setState(() {
                          like = !like;
                        });
                      }),
                  IconButton(
                      iconSize: 30.0,
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack buildPositionedBottomAdd(double mdw) {
    return Stack(
      children: <Widget>[
        Center(
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: mdw,
                width: mdw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mdw),
                  color: Colors.white,
                ))),
        Center(
          child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  numberOfPhones++;
                });
              }),
        )
      ],
    );
  }

  Stack buildPositionedBottomMines(double mdw) {
    return Stack(
      children: <Widget>[
        Center(
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: mdw,
                width: mdw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mdw),
                  color: Colors.white,
                ))),
        Center(
          child: IconButton(
              padding: EdgeInsets.only(bottom: 15, right: 1),
              icon: Icon(
                Icons.minimize,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  numberOfPhones--;
                  if (numberOfPhones < 0) {
                    numberOfPhones = 0;
                  }
                });
              }),
        )
      ],
    );
  }

  Container buildTopImage() {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: GridTile(child: Image.asset('images/1.jpg')),
    );
  }
}
