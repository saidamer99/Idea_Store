import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void dispose() {
    // TODO: implement dispose
    Navigator.pop(context);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/about.jpg"), fit: BoxFit.fill)),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 10),
                        child: Text(
                          "اهلا بكم في عالم Idea..",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "نقدم لكم تجربة مميزة و فريدة من نوعها محاولين بذلك تحقيق متطلبات الجميع من عائلة Idea بما يناسب شخصية كل فرد .. ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "التطبيق مقدم من شركة Idea التي تحتوي على خبراء في مجال التصميم والمختصين في عملية انتقاء أروع التصاميم التي ستجدوها لدى التصفح في التطبيق. ",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "قمنا بتوفير الية سهلة للمستخدم حيث أن التطبيق يعمل بطريقتين في حال عدم الاتصال بالانترنت وعند الاتصال بالانترنت  وذلك للحصول على اخر التصاميم الموجودة لدينا لنضمن بذلك أن يبقى المستخدم مواكبا لكل جديد.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "كما نوفر للمستخدم ميزة الطلب الخاص حيث يستطيع التواصل مع الشركة عن طريق الوسائل المذكورة بالأسفل واعلامهم برغبته ويمكنه أيضا إرفاق صورة للتصميم الذي يريد من الشركة تحضيره له..",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "نتمنى لكم الاستمتاع بهذه التجربة ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                    // boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 0.4)]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              ),
                              onPressed: () {}),
                          flex: 1,
                        ),
                        Expanded(
                          child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.redAccent,
                                size: 25,
                              ),
                              onPressed: () {}),
                          flex: 1,
                        ),
                        Expanded(
                          child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.phoneAlt,
                                color: Colors.green,
                                size: 25,
                              ),
                              onPressed: () {}),
                          flex: 1,
                        ),
                        Expanded(
                          child: IconButton(
                              icon: Icon(
                                Icons.email,
                                color: Colors.redAccent,
                                size: 30,
                              ),
                              onPressed: () {}),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
