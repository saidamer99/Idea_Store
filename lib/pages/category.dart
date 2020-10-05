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
          drawer: MyDrawer(),
          body: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              InkWell(
                child: Container(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            "images/said.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("samsung");
                },
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          "images/said.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
