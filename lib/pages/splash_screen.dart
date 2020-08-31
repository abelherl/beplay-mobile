import 'package:animated_splash/animated_splash.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:beplay/pages/pageHomeScreen.dart';
import 'package:flutter/material.dart';

import 'image_slider.dart';

class SplashScreen extends StatefulWidget {
  static String loadingScreen = '/loading_Screen';

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> screen = {
    1: HomeScreen(),
//    2: no_Connection_Screen()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: AnimatedSplash(
            imagePath: 'images/logo2.png',
            home: SplashScreen(),
            duration: 1500,
            type: AnimatedSplashType.BackgroundProcess,
            customFunction: duringSplash,
            outputAndHome: screen,
          ),
        ),
      ),
    );
  }
}
