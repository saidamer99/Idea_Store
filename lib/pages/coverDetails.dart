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

  int numberOfPhones = 0;
  String dropdownValuetype = 'لاشيء';
  List<String> spinnerItemstype = [
    'لاشيء',
    'Samsung',
    'Sony',
    'Hwawei',
    'Oppo',
    'iphone',
  ];
  String dropdownValuemodel = 'لاشيء';
  List<String> spinnerItemsmodel = [
    'لاشيء',
    'Samsung',
    'Sony',
    'Hwawei',
    'Oppo',
    'iphone',
  ];
  bool show = false;

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
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(40)),
              child: Text(
                "ادخل تفاصيل الشراء",
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "عدد القطع :",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                        width: 40, child: Text(numberOfPhones.toString())),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                numberOfPhones++;
                              });
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Icon(
                              Icons.minimize,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (numberOfPhones != 0) numberOfPhones--;
                              });
                            },
                          )),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.redAccent[100],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                    ))
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "نوع الموبايل :",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Dropdowntype(spinnerItemstype),
                    )),
                  ],
                ),
              ),
            ),
            show
                ? Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "الموديل :",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Dropdownmodel(spinnerItemsmodel),
                          )),
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: 50,
                  ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "الجودة :",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 5),
                    leading: Radio(),
                    title: Text(
                      "عادية",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Divider(
                    color: Colors.blue,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 5),
                    leading: Radio(
                      activeColor: Colors.redAccent,
                    ),
                    title: Text(
                      "متوسطة",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Divider(
                    color: Colors.blue,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 5),
                    leading: Radio(
                      activeColor: Colors.redAccent,
                    ),
                    title: Text(
                      "عالية",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        Text(
                          " تأكيد الشراء",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shop,
                          color: Colors.white,
                        ),
                        Text(
                          " متابعة",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  saveList("images/1.jpg", "2", "samsung", "عادية", "famous");
                },
              ),
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
                        Icons.assignment,
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

  Container buildTopImage() {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: GridTile(child: Image.asset('images/1.jpg')),
    );
  }

  Dropdowntype(List<String> spinneritems) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          DropdownButton<String>(
            value: dropdownValuetype,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.red, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropdownValuetype = data;
                if (dropdownValuetype != "لاشيء") {
                  show = true;
                } else {
                  show = false;
                }
              });
            },
            items: spinneritems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }

  Dropdownmodel(List<String> spinneritems) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          DropdownButton<String>(
            value: dropdownValuemodel,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.red, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropdownValuemodel = data;
                if (dropdownValuetype != "لاشيء") {
                  show = true;
                } else {
                  show = false;
                }
              });
            },
            items: spinneritems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
