import 'package:beplay/pages/pin_verificationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static String registerScreen = "/register_Screen";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Image.asset('images/logo2.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 64,
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Masukkan Username',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          hintText: 'Masukkan Email',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepOrange, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                      decoration: InputDecoration(
                          hintText: 'Masukkan no Hp',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepOrange, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: TextFormField(
                      onChanged: (value) {},
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      onChanged: (value) {},
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password kembali',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      'or Sign in up',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          onPressed: null,
                          child: Image.asset(
                            'images/fb_icon_325x325.png',
                            cacheWidth: 30,
                            cacheHeight: 30,
                          ),
                        ),
                        FlatButton(
                            onPressed: null,
                            child: Image.asset(
                              'images/67060-play-photos-search-google-account-png-file-hd.png',
                              cacheWidth: 30,
                              cacheHeight: 30,
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PinCodeVerificationScreen(phoneNumber)));
                      },
                      height: MediaQuery.of(context).size.height / 40,
                      minWidth: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
