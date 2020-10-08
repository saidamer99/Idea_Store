import 'package:flutter/material.dart';

class Famous extends StatefulWidget {
  @override
  _FamousState createState() => _FamousState();
}

class _FamousState extends State<Famous> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent[200],
            title: Text('Famous'),
            centerTitle: true,
          ),
          backgroundColor: Colors.grey,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/login/wallpaper.jpg"),
                    fit: BoxFit.fill)),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              children: <Widget>[
                add_Cat(
                  'images/1.jpg',
                  '1',
                ),
                add_Cat(
                  'images/1.jpg',
                  '2',
                ),
                add_Cat(
                  'images/1.jpg',
                  '3',
                ),
                add_Cat(
                  'images/1.jpg',
                  '4',
                ),
                add_Cat(
                  'images/1.jpg',
                  '5',
                ),
                add_Cat(
                  'images/1.jpg',
                  '6',
                ),
                add_Cat(
                  'images/1.jpg',
                  '7',
                ),
                add_Cat(
                  'images/1.jpg',
                  '8',
                ),
                add_Cat(
                  'images/1.jpg',
                  "9",
                ),
                add_Cat(
                  'images/1.jpg',
                  "10",
                ),
                add_Cat(
                  'images/1.jpg',
                  "11",
                ),
                add_Cat(
                  'images/1.jpg',
                  "12",
                ),
                add_Cat(
                  'images/1.jpg',
                  "13",
                ),
                add_Cat(
                  'images/1.jpg',
                  "14",
                ),
                add_Cat(
                  'images/1.jpg',
                  "15",
                ),
              ],
            ),
          )),
    );
  }

  InkWell add_Cat(String image, String description) {
    return InkWell(
        onTap: () {},
        child: Card(
          color: Colors.black,
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, spreadRadius: 0.4)
                ],
                image: new DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(image))),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  width: 150,
                  bottom: 5,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          // color: Colors.black87,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 4,
                                spreadRadius: 0.4)
                          ], borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
