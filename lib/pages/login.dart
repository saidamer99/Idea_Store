import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                      "images/login/wallpaper.jpg",
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
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.grey.withOpacity(0.3),
                                          prefixIcon: Icon(
                                            Icons.account_circle,
                                            color: Colors.white70,
                                          ),
                                          hintText: "اسم المتسخدم",
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          filled: true)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.grey.withOpacity(0.3),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.white70,
                                          ),
                                          hintText: "كلمة المرور",
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          filled: true)),
                                ),
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
}
