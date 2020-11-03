import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:share_extend/share_extend.dart';
import 'package:image_picker/image_picker.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  TextEditingController mcontroller = new TextEditingController();
  TextEditingController icontroller = new TextEditingController();
  @override
  void dispose() {
    Navigator.pop(context);

    super.dispose();
  }

  String validglobal(String val) {
    if (val.isEmpty) {
      return "لا يمكن أن يكون الحقل فارغ";
    }
  }

  var _image;
  Future getimage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Order Details"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/about.jpg",
                  ),
                  fit: BoxFit.fill)),
          child: ListView(
            children: <Widget>[
              Text(
                "إرفاق صورة",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _image == null
                      ? InkWell(
                          onTap: () {
                            getimage();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            height: 300,
                            color: Colors.blue[300].withOpacity(0.8),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.add_photo_alternate,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  Text(
                                      "يمكنك اضافة صورة ويمكنك أيضا الاكتفاء بالشرح عن فكرتك في الوصف ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            getimage();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(_image),
                                    fit: BoxFit.contain)),
                          ),
                        )),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Text(
                "اشرح فكرتك",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: TextFormField(
                        controller: icontroller,
                        autovalidate: true,
                        validator: validglobal,
                        cursorColor: Colors.white,
                        maxLines: 4,
                        maxLength: 600,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.yellow),
                            hintText: "أدخل فكرة التصميم الذي تريده....",
                            labelStyle: TextStyle(color: Colors.blue),
                            hoverColor: Colors.white,
                            fillColor: Colors.blue[300].withOpacity(0.7),
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                            filled: true)),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "ادخل نوع الموبايل ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: TextFormField(
                        controller: mcontroller,
                        autovalidate: true,
                        validator: validglobal,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.yellow),
                            hintText: "ادخل نوع الموبايل....",
                            hoverColor: Colors.white,
                            fillColor: Colors.blue[300].withOpacity(0.7),
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                            filled: true)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.green),
                      child: Center(
                        child: Text(
                          "إرسال الطلب",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (mcontroller.text == "" || icontroller.text == "") {
                        if (icontroller.text == "" && mcontroller.text != "") {
                          Fluttertoast.showToast(
                              msg: "الرجاء ادخال فكرتك",
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              toastLength: Toast.LENGTH_SHORT);
                        } else if (mcontroller.text == "" &&
                            icontroller.text != "") {
                          Fluttertoast.showToast(
                              msg: "الرجاء ادخال نوع الموبايل",
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              toastLength: Toast.LENGTH_SHORT);
                        } else {
                          Fluttertoast.showToast(
                              msg: "الرجاء ادخال تفاصيل الطلب",
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              toastLength: Toast.LENGTH_SHORT);
                        }
                      } else {
                        if (_image != null) {
                          share(context);
                        } else {
                          sharetext(context);
                        }
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void share(BuildContext buildContext) async {
    ShareExtend.share(_image.path, "file",
        extraText: "الفكرة: " +
            icontroller.text +
            "\n نوع الموبايل : " +
            mcontroller.text);
  }

  void sharetext(BuildContext) async {
    Share.share(
      "الفكرة : ${icontroller.text} \n نوع الموبايل : ${mcontroller.text}",
    );
  }
}
