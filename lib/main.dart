import 'package:beplay/const.dart';
import 'package:beplay/pages/classes.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:beplay/pages/image_slider.dart';
import 'package:beplay/pages/login.dart';
import 'package:beplay/pages/pageHomeScreen.dart';
import 'package:beplay/pages/register.dart';
import 'package:beplay/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'pages/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Be Play",
      initialRoute: '/home',
      theme: ThemeData(
        primaryColor: bPrimaryColor,
        accentColor: bPrimaryLightColor,
        backgroundColor: Colors.white
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/login_Screen': (context) => Login(),
        '/register_Screen': (context) => Register(),
        '/home': (context) => HomeScreen(),
        '/page_HomeScreen': (context) => pageHome_Screen(),
        '/classes': (context) => Classes()
      },
    );
  }
}
