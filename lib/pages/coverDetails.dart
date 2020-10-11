import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoverDetails extends StatefulWidget {
  @override
  _CoverDetailsState createState() => _CoverDetailsState();
}

class _CoverDetailsState extends State<CoverDetails> {
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
  String default_Choise = "عادية";
  int default_index = 0;
  List<Mychoice> choises = [
    Mychoice(index: 0, choise: "عادية"),
    Mychoice(index: 1, choise: "متوسطة"),
    Mychoice(index: 2, choise: "عالية")
  ];
  String choose = "";

  saveList(String image, String number, String kind, String quality,
      String category) async {
    List<String> images = new List();
    List<String> numbers = new List();
    List<String> kinds = new List();
    List<String> qualitys = new List();
    List<String> categorys = new List();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getStringList('images').length > 0) {
      images = preferences.getStringList('images');
      numbers = preferences.getStringList('numbers');
      kinds = preferences.getStringList('kinds');
      qualitys = preferences.getStringList('qualitys');
      categorys = preferences.getStringList('categorys');

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
                  Divider(
                    color: Colors.grey,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    "الجودة :",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: choises
                                  .map((data) => RadioListTile(
                                        title: Text('${data.choise}'),
                                        groupValue: default_index,
                                        value: data.index,
                                        onChanged: (value) {
                                          setState(() {
                                            default_Choise = data.choise;
                                            default_index = data.index;
                                            choose = data.choise;
                                          });
                                        },
                                        activeColor: Colors.redAccent,
                                      ))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Divider(
                    color: Colors.grey,
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
                          " إرسال الطلبية",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  share(context);
                },
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
                          " شراء التصميم",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {},
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
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        saveList('images/1.jpg', 'number', 'kind', 'quality',
                            'category');
                        saveList('images/2.jpg', 'number', 'kind', 'quality',
                            'category');
                      }),
                  IconButton(
                      iconSize: 30.0,
                      icon: Icon(
                        Icons.assignment,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('shop');
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

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(
        "for example :From User : model :12_ Count : 2 _Kind :samsung galaxy s10....",
        subject: "User",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
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

class Mychoice {
  String choise;
  int index;
  Mychoice({this.index, this.choise});
}
