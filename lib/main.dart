import 'package:beplay/const.dart';
import 'package:beplay/pages/classes.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:beplay/pages/login_screen.dart';
import 'package:beplay/pages/pageHomeScreen.dart';
import 'package:beplay/pages/signup_screen.dart';
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
      initialRoute: '/splash_screen',
      theme: ThemeData(
          primaryColor: bPrimaryColor,
          accentColor: bPrimaryLightColor,
          backgroundColor: Colors.white),
      routes: {
        '/': (context) => HomeScreen(),
        '/splash_screen': (context) => SplashScreen(),
        '/login_Screen': (context) => LoginScreen(),
        '/signup_Screen': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/page_HomeScreen': (context) => pageHome_Screen(),
        '/classes': (context) => Classes(),
      },
    );
  }
}
