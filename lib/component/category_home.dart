import 'package:flutter/material.dart';

class Categories_Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              spreadRadius: 0.4)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/cat/sport.jpg")))),
                new Text("Sport", textScaleFactor: 1.5)
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              spreadRadius: 0.4)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/cat/couple.jpg")))),
                new Text("Couple ", textScaleFactor: 1.5)
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              spreadRadius: 0.4)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/cat/jobs.jpg")))),
                new Text("Jobs", textScaleFactor: 1.5)
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              spreadRadius: 0.4)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/cat/girls.jpg")))),
                new Text("Girls", textScaleFactor: 1.5)
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              spreadRadius: 0.4)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/cat/building.jpg")))),
                new Text("Building", textScaleFactor: 1.5)
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              spreadRadius: 0.4)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/cat/gamer.jpg")))),
                new Text("Gamers", textScaleFactor: 1.5)
              ],
            )),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                              spreadRadius: 0.4)
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/said.jpg")))),
                new Text("I'm sorry said", textScaleFactor: 1.5)
              ],
            )),
          ),
        ),
      ],
    );
  }
}
