import 'dart:core';
import 'dart:io';

import 'package:app_idea/component/category_home.dart';
import 'package:app_idea/component/drawer.dart';
import 'package:app_idea/pages/start.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isStart = false;
  Dio dio = new Dio();
  bool _isDownloading = false;
  bool _finishDownload = false;
  String downloadMessage = 'Initializing';
  double _percentage = 0;
  var lastProduction;
  var animals;
  var music;
  var nature;
  var sport;
  var awareness;
  var love;
  var couples;
  var girls;
  var decoration;
  var games;
  var movies;
  var famous;
  var jops;
  var occasions;
  var ancient;

  initFolders() async {
    var directory = await getApplicationDocumentsDirectory();
    await makeFilder('${directory.path}/animals/');
    await makeFilder('${directory.path}/music/');
    await makeFilder('${directory.path}/nature/');
    await makeFilder('${directory.path}/sport/');
    await makeFilder('${directory.path}/awareness/');
    await makeFilder('${directory.path}/love/');
    await makeFilder('${directory.path}/couples/');
    await makeFilder('${directory.path}/girls/');
    await makeFilder('${directory.path}/decoration/');
    await makeFilder('${directory.path}/games/');
    await makeFilder('${directory.path}/famous/');
    await makeFilder('${directory.path}/movies/');
    await makeFilder('${directory.path}/jops/');
    await makeFilder('${directory.path}/occasion/');
    await makeFilder('${directory.path}/ancient/');
    await makeFilder('${directory.path}/lastProduction/');
  }

  Future makeFilder(String directory) async {
    var folder = Directory(directory);
    if (await folder.exists()) {
      print(folder.path);
    } else {
      final Directory newAnimalsFolder = await folder.create(recursive: true);
    }
  }

  getimageToSave(List animals, String uploadPath) {
    animals.forEach((element) {
      String image = element['image_name'];
      download(image, ' http://10.0.2.2:8080/idea/upload/$uploadPath/$image');
    });
  }

  Scaffold downloadFace(
      List lastProduction,
      List animals,
      List music,
      List nature,
      List sport,
      List awareness,
      List love,
      List couples,
      List girls,
      List decoration,
      List games,
      List movies,
      List famous,
      List jops,
      List occasions,
      List ancient) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () async {
                await specificDownload(animals, 'animals');
                await specificDownload(lastProduction, 'lastProduction');
                await specificDownload(music, 'music');
                await specificDownload(nature, 'nature');
                await specificDownload(sport, 'sport');
                await specificDownload(awareness, 'awareness');
                await specificDownload(love, 'love');
                await specificDownload(couples, 'couples');
                await specificDownload(girls, 'girls');
                await specificDownload(decoration, 'decoration');
                await specificDownload(games, 'games');
                await specificDownload(movies, 'movies');
                await specificDownload(famous, 'famous');
                await specificDownload(jops, 'jops');
                await specificDownload(occasions, 'occasions');
                await specificDownload(ancient, 'ancient');
                _finishDownload = !_finishDownload;
              },
              label: Text('Download'),
              icon: Icon(Icons.file_download),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              downloadMessage ?? "",
              style: Theme.of(context).textTheme.headline,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: _percentage,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            _finishDownload
                ? FloatingActionButton.extended(
                    onPressed: () {
                      _isDownloading = !_isDownloading;
                    },
                    label: Text(' العودة '))
                : Text('')
          ],
        ),
      ),
    );
  }

  Future specificDownload(List downloadList, String preferencesKey) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getInt(preferencesKey) < downloadList.length) {
      List temp;
      for (int i = preferences.getInt('animals') + 1;
          i <= downloadList.length;
          i++) {
        temp.add(downloadList[i]);
      }
      getimageToSave(downloadList, preferencesKey);
    }
  }

  void download(String title, String downloadurl) async {
    var directory = await getApplicationDocumentsDirectory();
    Dio dio = Dio();
    try {
      await dio.download(downloadurl, "${directory.path}/$title",
          onReceiveProgress: (rec, total) {
        print("Rec: $rec, Total:$total");
        var percentage = rec / total * 100;
        if (percentage < 100) {
          _percentage = percentage / 100;
          setState(() {
            //just to save completion in percentage
            downloadMessage = 'Downloading... ${percentage.floor()} %';
          });
        } else {
          setState(() {
            downloadMessage = 'successfully downloaded';
          });
        }
      });
    } catch (e) {
//Catch your error here
    }
  }

  getStart() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var temp = preferences.getBool('start');
    if (temp != null) {
      setState(() {
        isStart = preferences.getBool('start');
        print(isStart);
      });
    }
  }

  initSizesOfDownloadLists(
    // int sizeOfAnimals,
    int sizeOfMusic,
    int sizeOfNature,
    int sizeOfSport,
    int sizeOfGames,
    int sizeOfAwareness,
    int sizeOfLove,
    int sizeOfCouples,
    int sizeOfGirls,
    int sizeOfDecoration,
    int sizeOfFamous,
    int sizeOfMovies,
    int sizeOfJops,
    int sizeOfOccasions,
    int sizeOfAncient,
    int sizeOfLastProduction,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // preferences.setInt('animals', sizeOfAnimals);
    preferences.setInt('music', sizeOfMusic);
    preferences.setInt('nature', sizeOfNature);
    preferences.setInt('sport', sizeOfSport);
    preferences.setInt('games', sizeOfGames);
    preferences.setInt('awareness', sizeOfAwareness);
    preferences.setInt('love', sizeOfLove);
    preferences.setInt('couples', sizeOfCouples);
    preferences.setInt('girls', sizeOfGirls);
    preferences.setInt('decoration', sizeOfDecoration);
    preferences.setInt('famous', sizeOfFamous);
    preferences.setInt('movies', sizeOfMovies);
    preferences.setInt('jops', sizeOfJops);
    preferences.setInt('occasions', sizeOfOccasions);
    preferences.setInt('ancient', sizeOfAncient);
    preferences.setInt('LastProduction', sizeOfLastProduction);
  }

  getImages(BuildContext context) async {
    // get directory of application  for save images
    var directory = await getApplicationDocumentsDirectory();

    // get links of API for check number of lists and download there if we need to download
    var animalsURL = "http://10.0.2.2:8080/idea/animals.php";
    var musicURL = "http://10.0.2.2:8080/idea/music.php";
    var natureURL = "http://10.0.2.2:8080/idea/nature.php";
    var sportURL = "http://10.0.2.2:8080/idea/sport.php";
    var gamesURL = "http://10.0.2.2:8080/idea/games.php";
    var awarenessURL = "http://10.0.2.2:8080/idea/awareness.php";
    var loveURL = "http://10.0.2.2:8080/idea/love.php";
    var couplesURL = "http://10.0.2.2:8080/idea/couples.php";
    var girlsURL = "http://10.0.2.2:8080/idea/girls.php";
    var decorationURL = "http://10.0.2.2:8080/idea/decoration.php";
    var famousURL = "http://10.0.2.2:8080/idea/famous.php";
    var jopsURL = "http://10.0.2.2:8080/idea/jops.php";
    var moviesURL = "http://10.0.2.2:8080/idea/movies.php";
    var occasionURL = "http://10.0.2.2:8080/idea/occasion.php";
    var ancientURL = "http://10.0.2.2:8080/idea/ancient.php";
    var lastProductionURL = "http://10.0.2.2:8080/idea/lastProduction.php";

    // connect to internet to get sizes without download yet
    var animalsResponse = await http.post(animalsURL);
    animals = jsonDecode(animalsResponse.body) as List;

    var musicResponse = await http.post(musicURL);
    music = jsonDecode(musicResponse.body) as List;

    var natureResponse = await http.post(natureURL);
    nature = jsonDecode(natureResponse.body) as List;

    var loveResponse = await http.post(loveURL);
    love = jsonDecode(loveResponse.body) as List;

    var gamesResponse = await http.post(gamesURL);
    games = jsonDecode(gamesResponse.body) as List;

    var girlsResponse = await http.post(girlsURL);
    girls = jsonDecode(girlsResponse.body) as List;

    var decorationResponse = await http.post(decorationURL);
    decoration = jsonDecode(decorationResponse.body) as List;

    var occasionResponse = await http.post(occasionURL);
    occasions = jsonDecode(occasionResponse.body) as List;

    var famousResponse = await http.post(famousURL);
    famous = jsonDecode(famousResponse.body) as List;

    var moviesResponse = await http.post(moviesURL);
    movies = jsonDecode(moviesResponse.body) as List;

    var sportResponse = await http.post(sportURL);
    sport = jsonDecode(sportResponse.body) as List;

    var lastProductionResponse = await http.post(lastProductionURL);
    lastProduction = jsonDecode(lastProductionResponse.body) as List;

    var jopsResponse = await http.post(jopsURL);
    jops = jsonDecode(jopsResponse.body) as List;

    var couplesResponse = await http.post(couplesURL);
    couples = jsonDecode(couplesResponse.body) as List;

    var awarenessResponse = await http.post(awarenessURL);
    awareness = jsonDecode(awarenessResponse.body) as List;

    var ancientResponse = await http.post(ancientURL);
    ancient = jsonDecode(ancientResponse.body) as List;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    //Size of all image and save it
    int numberOfAllImages = ancient.length +
        awareness.length +
        couples.length +
        jops.length +
        lastProduction.length +
        sport.length +
        movies.length +
        famous.length +
        occasions.length +
        decoration.length +
        games.length +
        girls.length +
        nature.length +
        love.length +
        music.length +
        animals.length;

    //number of images that i saved in locall
    if (preferences.getInt('awareness') == null) {
      await initSizesOfDownloadLists(
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
    int numberOfSavedImages = preferences.getInt('ancient') +
        // preferences.getInt('animals') +
        preferences.getInt('awareness') +
        preferences.getInt('couples') +
        preferences.getInt('jops') +
        // preferences.getInt('LastProduction') +
        preferences.getInt('sport') +
        preferences.getInt('movies') +
        preferences.getInt('famous') +
        preferences.getInt('occasions') +
        preferences.getInt('decoration') +
        preferences.getInt('games') +
        preferences.getInt('girls') +
        preferences.getInt('nature') +
        preferences.getInt('love') +
        preferences.getInt('music');

    if (numberOfAllImages != numberOfSavedImages) {
      showAlertDialog();
      initSizesOfDownloadLists(
        ancient.length,
        awareness.length,
        couples.length,
        jops.length,
        lastProduction.length,
        sport.length,
        movies.length,
        famous.length,
        occasions.length,
        decoration.length,
        games.length,
        girls.length,
        nature.length,
        love.length,
        music.length,
        // animals.length
      );
    }
  }

  showAlertDialog() {
    Widget okButton = FlatButton(
      child: Text("Download"),
      onPressed: () async {
        setState(() {
          _isDownloading = !_isDownloading;
        });
      },
    );

    Widget cancelButton = new FlatButton(
      child: Text(
        "Cancel",
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.black45,
      title: Text(
        " يوجد تصماميم جديدة ",
        style: TextStyle(color: Colors.redAccent, fontSize: 12),
        textAlign: TextAlign.center,
      ),
      content: Text(
        " هل تريد تحميل احدث التصاميم؟ ",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.center,
      ),
      actions: [okButton, cancelButton],
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  clearData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('images');
    preferences.remove('numbers');
    preferences.remove('kinds');
    preferences.remove('qualitys');
    preferences.remove('categorys');
  }

  @override
  void initState() {
    getStart();
    clearData();
    initFolders();
    getImages(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isStart
        ? Directionality(
            textDirection: TextDirection.rtl,
            child: _isDownloading
                ? downloadFace(
                    lastProduction,
                    animals,
                    music,
                    nature,
                    sport,
                    awareness,
                    love,
                    couples,
                    girls,
                    decoration,
                    games,
                    movies,
                    famous,
                    jops,
                    occasions,
                    ancient)
                : Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(60.0),
                      child: AppBar(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(15))),
                        title: Text(
                          "Idea",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        centerTitle: true,
                        actions: <Widget>[
                          IconButton(icon: Icon(Icons.search), onPressed: () {})
                        ],
                      ),
                    ),
                    drawer: MyDrawer(),
                    body: ListView(
                      children: <Widget>[
                        Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Carousel(
                              // overlayShadow: true,
                              // defaultImage: Colors.black,
                              // boxFit: BoxFit.contain,
                              // borderRadius: true,
                              // animationDuration: Duration(milliseconds: 3000),
                              // autoplayDuration: Duration(milliseconds: 6000),
                              // animationCurve: Curves.slowMiddle,
                              autoplay: true,
                              images: [
                                Image.asset(
                                  "images/1.jpg",
                                  fit: BoxFit.contain,
                                ),
                                Image.asset(
                                  "images/1.jpg",
                                  fit: BoxFit.contain,
                                ),
                                Image.asset(
                                  "images/1.jpg",
                                  fit: BoxFit.contain,
                                ),
                                Image.asset(
                                  "images/2.jpg",
                                  fit: BoxFit.contain,
                                ),
                                Image.asset(
                                  "images/3.jpg",
                                  fit: BoxFit.contain,
                                )
                              ],
                              dotSize: 7,
                              dotSpacing: 40,
                              dotIncreasedColor: Colors.blue,
                              indicatorBgPadding: 15,
                              dotBgColor: Colors.grey.withOpacity(0),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "الأقسام",
                            style: TextStyle(
                                fontSize: 30, color: Colors.redAccent),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            height: 200,
                            width: 200,
                            child: CategoriesHome()),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'أخر المنتجات',
                            style: TextStyle(
                                fontSize: 30, color: Colors.redAccent),
                          ),
                        ),
                        Container(
                          height: 400,
                          child: GridView(
                              padding: EdgeInsets.all(5),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              children: <Widget>[
                                buildCard('images/1.jpg', 'nature'),
                                buildCard('images/2.jpg', 'nature'),
                                buildCard('images/3.jpg', 'nature'),
                                buildCard('images/1.jpg', 'nature'),
                                buildCard('images/2.jpg', 'nature'),
                                buildCard('images/3.jpg', 'nature'),
                              ]),
                        ),
                      ],
                    )),
          )
        : Start_Screen();
  }

  InkWell buildCard(String image, String category) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Image.asset(
              image,
              fit: BoxFit.fill,
            )),
            Container(
                child: Text(
              category,
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
          ],
        ),
      ),
    );
  }
}
