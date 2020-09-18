import 'dart:async';
import 'package:beplay/const.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:beplay/pages/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _loadAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      if (token != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => IntroScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo1.png",
              width: 200,
              height: 200,
            ),
            CircularProgressIndicator(
              backgroundColor: bPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
