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
          body: Container(
            color: Colors.black,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: <Widget>[
                add_Cat(
                  'images//cat/Music.png',
                  'Music',
                ),
                add_Cat(
                  'images//cat/animal.jpg',
                  'Animals',
                ),
                add_Cat(
                  'images//cat/nature.jpg',
                  'Nature',
                ),
                add_Cat(
                  'images//cat/sport.jpg',
                  'Sports',
                ),
                add_Cat(
                  'images//cat/personaldevelopment.jpg',
                  'Awareness',
                ),
                add_Cat(
                  'images//cat/love.jpg',
                  'Love',
                ),
                add_Cat(
                  'images//cat/couple.jpg',
                  'Couples',
                ),
                add_Cat(
                  'images//cat/girls.jpg',
                  'Girls',
                ),
                add_Cat('images//cat//decoration.png', "Decoration"),
                add_Cat('images//cat//gamer.jpg', "Gaming"),
                add_Cat('images//cat//famous.jpg', "Famous"),
                add_Cat('images//cat//movies.jpg', "Movies"),
                add_Cat('images//cat//jobs.jpg', "Jobs"),
                add_Cat('images//cat//party.jpg', "Occasions"),
                add_Cat('images//cat//ancient.jpg', "Ancient"),
              ],
            ),
          ),
        ));
  }

  // InkWell buildCat(String image, String centerText, String description) {
  //   return InkWell(
  //     onTap: () {},
  //     child: Card(
  //       child: Container(
  //           height: 400,
  //           width: MediaQuery.of(context).size.width,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Stack(
  //                 children: <Widget>[
  //                   Container(
  //                       width: MediaQuery.of(context).size.width,
  //                       height: 400,
  //                       decoration: BoxDecoration(
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 color: Colors.black,
  //                                 blurRadius: 4,
  //                                 spreadRadius: 0.4)
  //                           ],
  //                           image: new DecorationImage(
  //                               fit: BoxFit.fill, image: AssetImage(image)))),
  //                   Center(
  //                     child: Positioned(
  //                       // right: MediaQuery.of(context).size.width / 2.5,
  //                       // top: 250,
  //                       child: Container(
  //                         padding: EdgeInsets.all(1),
  //                         decoration: BoxDecoration(
  //                           color: Colors.white70.withOpacity(0.001),
  //                           borderRadius: BorderRadius.circular(10),
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 color: Colors.black,
  //                                 blurRadius: 4,
  //                                 spreadRadius: 0.4)
  //                           ],
  //                         ),
  //                         child: Center(
  //                           child: Text(
  //                             centerText,
  //                             style:
  //                                 TextStyle(color: Colors.white, fontSize: 20),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Positioned(
  //                     bottom: 10,
  //                     left: 15,
  //                     right: 15,
  //                     child: Container(
  //                       padding: EdgeInsets.all(5),
  //                       width: MediaQuery.of(context).size.width,
  //                       decoration: BoxDecoration(
  //                           color: Colors.lightBlueAccent[100],
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 color: Colors.black,
  //                                 blurRadius: 4,
  //                                 spreadRadius: 0.4)
  //                           ],
  //                           borderRadius: BorderRadius.circular(10)),
  //                       child: Center(
  //                         child: Text(
  //                           description,
  //                           style: TextStyle(color: Colors.white, fontSize: 15),
  //                         ),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               )
  //             ],
  //           )),
  //     ),
  //   );
  // }

  InkWell add_Cat(String image, String description) {
    return InkWell(
        child: Card(
      color: Colors.black,
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 1, spreadRadius: 0.1)
            ],
            image: new DecorationImage(
                fit: BoxFit.fill, image: AssetImage(image))),
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
