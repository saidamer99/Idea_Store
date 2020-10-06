import 'package:app_idea/component/drawer.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {})
            ],
          ),
          // drawer: MyDrawer(),
          body: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            children: <Widget>[
              buildCat('images//cat/ancient.jpg', 'Ancient', 'where are you'),
              buildCat('images//cat/ancient.jpg', 'Ancient', 'where are you'),
              buildCat('images//cat/ancient.jpg', 'Ancient', 'where are you'),
              buildCat('images//cat/ancient.jpg', 'Ancient', 'where are you'),
              buildCat('images//cat/ancient.jpg', 'Ancient', 'where are you'),
              buildCat('images//cat/ancient.jpg', 'Ancient', 'where are you'),
              buildCat('images//cat/ancient.jpg', 'Ancient', 'where are you'),
              buildCat('images//cat/ancient.jpg', 'Ancient', 'where are you'),
            ],
          ),
        ));
  }

  InkWell buildCat(String image, String centerText, String description) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 4,
                                  spreadRadius: 0.4)
                            ],
                            image: new DecorationImage(
                                fit: BoxFit.fill, image: AssetImage(image)))),
                    Positioned(
                      right: MediaQuery.of(context).size.width / 2.5,
                      top: 250,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(0.001),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 4,
                                spreadRadius: 0.4)
                          ],
                        ),
                        child: Center(
                          child: Text(
                            centerText,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      right: 15,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent[100],
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 4,
                                  spreadRadius: 0.4)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            description,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
