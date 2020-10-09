import 'package:app_idea/component/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  GlobalKey<FormState> mykey = new GlobalKey();
  bool issignin = true;
  signin(BuildContext buildContext) {
    var data = mykey.currentState;
    if (data.validate()) {
      Navigator.of(buildContext).pushNamed("go");
    } else {}
  }

  String validglobal(String val) {
    if (val.isEmpty) {
      return "لا يمكن أن يكون الحقل فارغ";
    }
  }

  savepref(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("User", name);
    preferences.getString("User");
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "images/login/wallpaper1.jpg",
                    ))),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Update Your Style ",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: mykey,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                add_form(
                                    "اسم المستخدم",
                                    Icon(
                                      Icons.account_circle,
                                      color: Colors.white70,
                                    ),
                                    username,
                                    false,
                                    validglobal),
                                SizedBox(
                                  height: 20,
                                ),
                                add_form(
                                    "كلمة المرور",
                                    Icon(
                                      Icons.lock,
                                      color: Colors.white70,
                                    ),
                                    password,
                                    true,
                                    validglobal),
                                SizedBox(
                                  height: 70,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: InkWell(
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.redAccent,
                                              blurRadius: 3,
                                              spreadRadius: 0.5)
                                        ],
                                        color: Colors.red[400].withOpacity(0.8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "SIGN IN ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      String name = username.text.toString();
                                      savepref(name);
                                      signin(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Container add_form(String hint, Icon icon, TextEditingController mycontroller,
      bool obsecure, myvalid) {
    return Container(
      child: TextFormField(
          validator: myvalid,
          style: TextStyle(color: Colors.white),
          obscureText: obsecure,
          controller: mycontroller,
          decoration: InputDecoration(
              hoverColor: Colors.white,
              fillColor: Colors.grey.withOpacity(0.3),
              prefixIcon: icon,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white70),
              filled: true)),
    );
  }
}
