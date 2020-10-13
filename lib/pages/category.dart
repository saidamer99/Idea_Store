import 'dart:io';

import 'package:app_idea/component/drawer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Files.dart';

class Categories extends StatefulWidget {
  List<String> imagesS = new List();
  List<String> numbersS = new List();
  List<String> kindsS = new List();
  List<String> qualitysS = new List();
  List<String> categorysS = new List();

  int numberOfPices;
  @override
  _CategoriesState createState() => _CategoriesState();
}

openMusic(context) {
  return Navigator.of(context).pushNamed('music');
}

openAnimal(context) {
  return Navigator.of(context).pushNamed('animal');
}

openNature(context) {
  return Navigator.of(context).pushNamed('nature');
}

openSports(context) {
  return Navigator.of(context).pushNamed('sports');
}

openAwareness(context) {
  return Navigator.of(context).pushNamed('awareness');
}

openLove(context) {
  return Navigator.of(context).pushNamed('love');
}

openCouples(context) {
  return Navigator.of(context).pushNamed('couples');
}

openGirls(context) {
  return Navigator.of(context).pushNamed('girls');
}

openDecorations(context) {
  return Navigator.of(context).pushNamed('decorations');
}

openGaming(context) {
  return Navigator.of(context).pushNamed('gaming');
}

openFamous(context) {
  return Navigator.of(context).pushNamed('famous');
}

openMovies(context) {
  return Navigator.of(context).pushNamed('movies');
}

openJobs(context) {
  return Navigator.of(context).pushNamed('jobs');
}

openOccasions(context) {
  return Navigator.of(context).pushNamed('occasions');
}

openAncient(context) {
  return Navigator.of(context).pushNamed('ancient');
}

class _CategoriesState extends State<Categories> {
  var username;
  File_class file_class;

  getuser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString("User");
    file_class = new File_class(username);
  }

  void share(BuildContext buildContext) async {
    Directory dir = await getApplicationSupportDirectory();
    File testFile = new File("${dir.path}/${username.toString()}.txt");
    if (!await testFile.exists()) {
      await testFile.create(recursive: true);
    }
    ShareExtend.share(testFile.path, "file");
  }

  bool hasData = false;
  String content = "";
  get_save_Data() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getStringList('images').length != 0 ||
        preferences.getStringList("images") != null) {
      widget.imagesS = preferences.getStringList('images');
      widget.numbersS = preferences.getStringList('numbers');
      widget.kindsS = preferences.getStringList('kinds');
      widget.qualitysS = preferences.getStringList('qualitys');
      widget.categorysS = preferences.getStringList('categorys');
      widget.numberOfPices = widget.categorysS.length;

      setState(() {
        hasData = true;
        for (int i = 0; i < widget.categorysS.length; i++) {
          content = content +
              "${widget.imagesS[i]} \n ${widget.numbersS[i]}  \n ${widget.kindsS[i]}\n ${widget.qualitysS[i]} \n ${widget.categorysS[i]} \n \n \n";
        }
        file_class
            .writeData("from " + username.toString() + " : \n \n" + content);
        content = "";
      });
    } else {
      setState(() {
        hasData = false;
        content = "";
        file_class.writeData(content);
      });
    }
  }

  bool show = false;
  gettoshow() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getStringList("images").length > 0) {
        show = true;
      } else {
        show = false;
      }
    });
  }

  @override
  void initState() {
    getuser();
    gettoshow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent[200],
            title: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: show
                ? IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      get_save_Data();
                      share(context);
                    })
                : IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
            actions: <Widget>[
              show
                  ? IconButton(
                      icon: Icon(
                        Icons.assignment,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('shop');
                      })
                  : SizedBox(),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
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
                add_Cat('images//cat/Music.png', 'Music', openMusic),
                add_Cat('images//cat/animal.jpg', 'Animals', openAnimal),
                add_Cat('images//cat/nature.jpg', 'Nature', openNature),
                add_Cat('images//cat/sport.jpg', 'Sports', openSports),
                add_Cat('images//cat/personaldevelopment.jpg', 'Awareness',
                    openAwareness),
                add_Cat('images//cat/love.jpg', 'Love', openLove),
                add_Cat('images//cat/couple.jpg', 'Couples', openCouples),
                add_Cat('images//cat/girls.jpg', 'Girls', openGirls),
                add_Cat('images//cat//decoration.png', "Decoration",
                    openDecorations),
                add_Cat('images//cat//gamer.jpg', "Gaming", openGaming),
                add_Cat('images//cat//famous.jpg', "Famous", openFamous),
                add_Cat('images//cat//movies.jpg', "Movies", openMovies),
                add_Cat('images//cat//jobs.jpg', "Jobs", openJobs),
                add_Cat('images//cat//party.jpg', "Occasions", openOccasions),
                add_Cat('images//cat//ancient.jpg', "Ancient", openAncient),
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

  InkWell add_Cat(String image, String description, openCategory) {
    return InkWell(
        onTap: () {
          openCategory(context);
        },
        child: Card(
          color: Colors.black,
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 1, spreadRadius: 0.1)
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
