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
                            image: AssetImage("images/cat/Music.png")))),
                new Text(
                  "Music",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                            image: AssetImage("images/cat/animal.jpg")))),
                new Text(
                  "Animals",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                            image: AssetImage("images/cat/nature.jpg")))),
                new Text(
                  "Nature",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                            image: AssetImage("images/cat/sport.jpg")))),
                new Text(
                  "Sports",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                            image: AssetImage(
                                "images/cat/personaldevelopment.jpg")))),
                new Text(
                  "Awareness",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                            image: AssetImage("images/cat/love.jpg")))),
                new Text(
                  "Love",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                new Text(
                  "Couples",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                new Text(
                  "Girls",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                            image: AssetImage("images/cat/decoration.png")))),
                new Text(
                  "Decoration",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                new Text(
                  "Gaming",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
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
                            image: AssetImage("images//cat//famous.jpg")))),
                new Text(
                  "Famous",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                            image: AssetImage("images/cat/movies.jpg")))),
                new Text(
                  "Movies",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                new Text(
                  "Jobs",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                            image: AssetImage("images/cat/party.jpg")))),
                new Text(
                  "Occasions",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                            image: AssetImage("images/cat/ancient.jpg")))),
                new Text(
                  "Ancient",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }
}
