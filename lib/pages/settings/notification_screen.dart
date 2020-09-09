import 'package:beplay/components/main_app_bar.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class NotificationSettingScreen extends StatefulWidget {
  @override
  _NotificationSettingScreenState createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool isSwitched = false;
  bool isSwitched2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Settings'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Parent(
                style: ParentStyle()..margin(top: 50, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: bLightTextColor,
                    ),
                    Txt(
                      'Notifications',
                      style: TxtStyle()
                        ..padding(left: 10)
                        ..alignmentContent.center()
                        ..alignment.center()
                        ..textColor(bBlack)
                        ..bold()
                        ..fontSize(23),
                    ),
                  ],
                ),
              ),
              Parent(
                style: ParentStyle(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txt(
                      'Push App Notifications',
                      style: TxtStyle()
                        ..fontSize(16)
                        ..textColor(bBlack),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeColor: bPrimaryColor,
                      activeTrackColor: bPrimaryLightColor,
                    )
                  ],
                ),
              ),
              Parent(
                style: ParentStyle(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Txt(
                      'Push Email Notifications',
                      style: TxtStyle()
                        ..fontSize(16)
                        ..textColor(bBlack),
                    ),
                    Switch(
                      value: isSwitched2,
                      onChanged: (value) {
                        setState(() {
                          isSwitched2 = value;
                        });
                      },
                      activeColor: bPrimaryColor,
                      activeTrackColor: bPrimaryLightColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
