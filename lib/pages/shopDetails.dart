import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopDetails extends StatefulWidget {
  List<String> imagesS = new List();
  List<String> numbersS = new List();
  List<String> kindsS = new List();
  List<String> qualitysS = new List();
  List<String> categorysS = new List();

  int numberOfPices;
  ShopDetails(
      {this.imagesS,
      this.numbersS,
      this.kindsS,
      this.qualitysS,
      this.categorysS});
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  bool hasData = false;
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  clearData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  deleteItem(int index) async {
    List<String> images = new List();
    List<String> numbers = new List();
    List<String> kinds = new List();
    List<String> qualitys = new List();
    List<String> categorys = new List();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    images = preferences.getStringList('images');
    numbers = preferences.getStringList('numbers');
    kinds = preferences.getStringList('kinds');
    qualitys = preferences.getStringList('qualitys');
    categorys = preferences.getStringList('categorys');

    images.removeAt(index);
    numbers.removeAt(index);
    kinds.removeAt(index);
    qualitys.removeAt(index);
    categorys.removeAt(index);

    preferences.setStringList('images', images);
    preferences.setStringList('numbers', numbers);
    preferences.setStringList('kinds', kinds);
    preferences.setStringList('qualitys', qualitys);
    preferences.setStringList('categorys', categorys);
  }

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getStringList('images') != 0) {
      widget.imagesS = preferences.getStringList('images');
      widget.numbersS = preferences.getStringList('numbers');
      widget.kindsS = preferences.getStringList('kinds');
      widget.qualitysS = preferences.getStringList('qualitys');
      widget.categorysS = preferences.getStringList('categorys');
      widget.numberOfPices = widget.categorysS.length;

      setState(() {
        hasData = true;
      });
    } else {
      setState(() {
        hasData = false;
      });
    }
  }

  @override
  void initState() {
    getData();

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
                  "Shop details",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
            ),
            body: hasData
                ? AnimatedList(
                    key: _key,
                    initialItemCount: widget.categorysS.length,
                    itemBuilder: (context, index, animation) {
                      return _buildItem(
                          widget.numbersS[index],
                          widget.kindsS[index],
                          widget.qualitysS[index],
                          widget.categorysS[index],
                          widget.imagesS[index],
                          animation,
                          index);
                    },
                  )
                : Center(child: CircularProgressIndicator())));
  }

  Widget _buildItem(String numberOfPices, String kindOfMobile, String quality,
      String caregoryOfmobile, String image, Animation animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Image.asset(
                        image,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 180,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: " عدد القطع : ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      TextSpan(
                                          text: numberOfPices,
                                          style: TextStyle(color: Colors.black))
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "  نوع الموبايل : ",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: kindOfMobile,
                                          style: TextStyle(color: Colors.blue))
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "  الجودة : ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      TextSpan(
                                          text: quality,
                                          style: TextStyle(color: Colors.black))
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "  القسم : ",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: caregoryOfmobile,
                                          style: TextStyle(color: Colors.blue))
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Expanded(
                      flex: 1,
                      child: Center(
                          child: IconButton(
                              iconSize: 40.0,
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  _removeItem(index);
                                  deleteItem(index);
                                  widget.numberOfPices--;
                                });
                              })),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  Container buildListTile(
    int i,
    context,
    String image,
    String numberOfPices,
    String kindOfMobile,
    String quality,
    String caregoryOfmobile,
  ) {
    return Container(
        height: 220,
        width: 100,
        child: Column(
          children: <Widget>[
            Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Image.asset(
                        image,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 180,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: " عدد القطع : ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      TextSpan(
                                          text: numberOfPices,
                                          style: TextStyle(color: Colors.black))
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "  نوع الموبايل : ",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: kindOfMobile,
                                          style: TextStyle(color: Colors.blue))
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "  الجودة : ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      TextSpan(
                                          text: quality,
                                          style: TextStyle(color: Colors.black))
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.grey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "  القسم : ",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: caregoryOfmobile,
                                          style: TextStyle(color: Colors.blue))
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Expanded(
                      flex: 1,
                      child: Center(
                          child: IconButton(
                              iconSize: 40.0,
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  _removeItem(i);
                                  deleteItem(i);
                                  widget.numberOfPices--;
                                });
                              })),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.red,
            )
          ],
        ));
  }

  void _removeItem(int i) {
    String removedImage = widget.imagesS.removeAt(i);
    String removednumber = widget.numbersS.removeAt(i);
    String removedkind = widget.kindsS.removeAt(i);
    String removedquality = widget.qualitysS.removeAt(i);
    String removedcategory = widget.categorysS.removeAt(i);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(removednumber, removedkind, removedquality,
          removedcategory, removedImage, animation, i);
    };
    _key.currentState.removeItem(i, builder);
  }
}
