import 'package:app_idea/items.dart';
import 'package:app_idea/pages/shopDetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoverDetails extends StatefulWidget {
  @override
  _CoverDetailsState createState() => _CoverDetailsState();
}

class _CoverDetailsState extends State<CoverDetails> {
  List<String> images = new List();
  List<String> numbers = new List();
  List<String> kinds = new List();
  List<String> qualitys = new List();
  List<String> categorys = new List();

  clearPreferances() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('images');
    preferences.remove('kinds');
    preferences.remove('numbers');
    preferences.remove('qualitys');
    preferences.remove('categorys');
  }

  saveList(String image, String number, String kind, String quality,
      String category) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getStringList('images') != null) {
      images.addAll(preferences.getStringList('images'));
      numbers.addAll(preferences.getStringList('numbers'));
      kinds.addAll(preferences.getStringList('kinds'));
      qualitys.addAll(preferences.getStringList('qualitys'));
      categorys.addAll(preferences.getStringList('categorys'));

      images.add(image);
      numbers.add(number);
      kinds.add(kind);
      qualitys.add(quality);
      categorys.add(category);
    } else {
      images.add(image);
      numbers.add(number);
      kinds.add(kind);
      qualitys.add(quality);
      categorys.add(category);

      preferences.setStringList('images', images);
      preferences.setStringList('numbers', numbers);
      preferences.setStringList('kinds', kinds);
      preferences.setStringList('qualitys', qualitys);
      preferences.setStringList('categorys', categorys);
    }
  }

  getImagesList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    images = preferences.getStringList('images');
  }

  getNumbersList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    numbers = preferences.getStringList('numbers');
  }

  getKindsList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    kinds = preferences.getStringList('kinds');
  }

  getQualitysList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    qualitys = preferences.getStringList('qualitys');
  }

  getCategorysList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    categorys = preferences.getStringList('categorys');
  }

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
                      onPressed: () async {
                        saveList('images/1.jpg', 'number', 'kind', 'quality',
                            'category');
                        saveList('images/2.jpg', 'number', 'kind', 'quality',
                            'category');
                        getImagesList();
                        getKindsList();
                        getNumbersList();
                        getQualitysList();
                        getCategorysList();

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ShopDetails(
                            imagesS: images,
                            numbersS: numbers,
                            kindsS: kinds,
                            qualitysS: qualitys,
                            categorysS: categorys,
                          );
                        }));
                      }),
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
