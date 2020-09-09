import 'package:beplay/components/main_app_bar.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bBackgroundColor,
      appBar: MainAppBar(title: 'Privacy'),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 30, right: 15, bottom: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Txt(
                'Privacy Policy',
                style: TxtStyle()
                  ..background.color(bBackgroundColor)
                  ..fontSize(20)
                  ..textColor(bDarkTextColor)
                  ..fontSize(20.0)
                  ..bold(),
              ),
              Txt(
                privacyText,
                style: TxtStyle()
                  ..padding(top: 20)
                  ..background.color(bBackgroundColor)
                  ..fontSize(14)
                  ..textColor(bLightTextColor)
                  ..fontSize(15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
