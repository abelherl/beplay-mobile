import 'package:beplay/pages/forgot_passwordScreen.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:beplay/pages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  child: Image.asset('images/logo2.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    validator: (value) =>
                    value.isEmpty ? 'Email cant be Empty' : null,
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    validator: (value) =>
                    value.isEmpty ? 'Password cant be Empty' : null,
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password.',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return forgot_PasswordScreen();
                              }));
                        });
                      },
                      child: Center(
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      'or Sign in with',
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
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 32,
                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Material(
//                    color: Colors.white,
//                    borderRadius: BorderRadius.all(
//                      Radius.circular(16.0),
//                    ),
//                    elevation: 5.0,
//                    child: MaterialButton(
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => Register()));
//                      },
//                      height: MediaQuery.of(context).size.height / 40,
//                      minWidth: MediaQuery.of(context).size.width / 2,
//                      child: Center(
//                        child: Text(
//                          'Register',
//                          style: TextStyle(
//                              fontFamily: 'Montserrat',
//                              fontWeight: FontWeight.w600,
//                              color: Colors.black,
//                              fontSize: 16),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      height: MediaQuery.of(context).size.height / 40,
                      minWidth: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                        });
                      },
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
