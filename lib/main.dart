import 'package:beplay/const.dart';
import 'package:beplay/pages/classes.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:beplay/pages/login_screen.dart';
import 'package:beplay/pages/pageHomeScreen.dart';
import 'package:beplay/pages/settings/account_screen.dart';
import 'package:beplay/pages/settings/change_password_screen.dart';
import 'package:beplay/pages/settings/faq_screen.dart';
import 'package:beplay/pages/settings/language_screen.dart';
import 'package:beplay/pages/settings/notification_screen.dart';
import 'package:beplay/pages/settings/privacy_screen.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: bPrimaryColor,
          accentColor: bPrimaryLightColor,
          backgroundColor: Colors.white),
      routes: {
        '/': (context) => HomeScreen(),
        '/splash_screen': (context) => SplashScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/signup_Screen': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/page_HomeScreen': (context) => pageHome_Screen(),
        '/classes': (context) => Classes(),

        //Settings Page
        '/account': (context) => AccountSettingScreen(),
        '/change_password': (context) => ChangePasswordScreen(),
        '/language': (context) => ChangeLanguageScreen(),
        '/notification': (context) => NotificationSettingScreen(),
        '/privacy': (context) => PrivacyScreen(),
        '/faq': (context) => FAQScreen(),
      },
    );
  }
}
