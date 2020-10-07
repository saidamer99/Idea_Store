import 'package:flutter/material.dart';

class CategoriesHome extends StatefulWidget {
  @override
  _CategoriesHomeState createState() => _CategoriesHomeState();
}

class _CategoriesHomeState extends State<CategoriesHome> {
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        buildInkWellHomeCategories("images/cat/Music.png", "Music", openMusic),
        buildInkWellHomeCategories(
            "images/cat/animal.jpg", "Animals", openAnimal),
        buildInkWellHomeCategories(
            "images/cat/nature.jpg", "Nature", openNature),
        buildInkWellHomeCategories(
            "images/cat/sport.jpg", "Sports", openSports),
        buildInkWellHomeCategories(
            "images/cat/personaldevelopment.jpg", "Awareness", openAwareness),
        buildInkWellHomeCategories("images/cat/love.jpg", "Love", openLove),
        buildInkWellHomeCategories(
            "images/cat/couple.jpg", "Couples", openCouples),
        buildInkWellHomeCategories("images/cat/girls.jpg", "Girls", openGirls),
        buildInkWellHomeCategories(
            "images/cat/decoration.png", "Decoration", openDecorations),
        buildInkWellHomeCategories(
            "images/cat/gamer.jpg", "Gaming", openGaming),
        buildInkWellHomeCategories(
            "images//cat//famous.jpg", "Famous", openFamous),
        buildInkWellHomeCategories(
            "images/cat/movies.jpg", "Movies", openMovies),
        buildInkWellHomeCategories("images/cat/jobs.jpg", "Jobs", openJobs),
        buildInkWellHomeCategories(
            "images/cat/party.jpg", "Occasions", openOccasions),
        buildInkWellHomeCategories(
            "images/cat/ancient.jpg", "Ancient", openAncient),
      ],
    );
  }

  InkWell buildInkWellHomeCategories(String image, String name, openCategory) {
    return InkWell(
      onTap: () {
        openCategory(context);
      },
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
                          color: Colors.black, blurRadius: 4, spreadRadius: 0.4)
                    ],
                    borderRadius: BorderRadius.circular(30),
                    image: new DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(image)))),
            new Text(
              name,
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}
