import 'package:app_idea/pages/coverDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category.dart';

class CoverList extends StatefulWidget {
  final List<String> images;
  final List<String> descriptions;
  final String category;

  CoverList({this.images, this.descriptions, this.category});
  @override
  _CoverListState createState() => _CoverListState();
}

class _CoverListState extends State<CoverList> {
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  gettoshow() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getStringList("images").length > 0) {
      Categories.show = true;
    } else {
      Categories.show = false;
    }
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            title: Text(
              widget.category,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {})
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return add_Cat(widget.images[index], widget.descriptions[index]);
          },
        ),
      ),
    );
  }

  InkWell add_Cat(String image, String description) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CoverDetails(
              image: image,
              category: widget.category,
            );
          }));
        },
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
