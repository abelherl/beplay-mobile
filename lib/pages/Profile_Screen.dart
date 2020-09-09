import 'package:beplay/const.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bWhite,
      appBar: AppBar(
        backgroundColor: bPrimaryColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: bPrimaryColor,
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Transform.translate(
                    offset: Offset(125, 30),
                    child: Parent(
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/aaa.jpeg'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Txt(
                'SMK CODING',
                style: TxtStyle()
                  ..alignment.center()
                  ..textColor(Colors.black)
                  ..fontWeight(FontWeight.w600)
                  ..fontSize(25.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                color: bWhite,
                child: Column(
                  children: [
                    SettingsItem('icons/bi_person-fill.svg', Colors.white,
                        'Account', 'Change your Account Detail', '/account'),
                    SettingsItem(
                        'icons/ic_baseline-g-translate.svg',
                        Colors.grey[400],
                        'Language',
                        'Change App Language',
                        '/language'),
                    SettingsItem(
                        'icons/clarity_settings-solid.svg',
                        Colors.grey[400],
                        'Settings',
                        'Notifications Settings',
                        '/notification'),
                    SettingsItem(
                        'icons/dashicons_privacy.svg',
                        Colors.grey[400],
                        'Privacy',
                        'Privacy and Policy',
                        '/privacy'),
                    SettingsItem('icons/wpf_faq.svg', Colors.grey[400], 'FAQ',
                        'Frequently Asked Questions', '/faq'),
                    SettingsItem('icons/ion_log-out.svg', Colors.grey[400],
                        'Log Out', 'Sign Out', null),
                    Container(
                      height: 20.0,
                      color: bWhite,
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

class SettingsItem extends StatefulWidget {
  SettingsItem(
      this.icon, this.iconBgColor, this.title, this.description, this.tap);

  final String icon;
  final Color iconBgColor;
  final String title;
  final String description;
  final String tap;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: settingsItemStyle(pressed)
        ..elevation(0.0)
        ..background.color(bWhite),
      gesture: Gestures()
        ..isTap((isTapped) => setState(() => pressed = isTapped))
        ..onTap(() {
          Navigator.of(context).pushNamed(widget.tap);
        }),
      child: Row(
        children: <Widget>[
          Parent(
            style: settingsItemIconStyle(bWhite)..elevation(0.0),
            child: SvgPicture.asset(
              widget.icon,
              color: Colors.grey[400],
              height: 25,
              width: 25,
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Txt(widget.title, style: itemTitleTextStyle),
              Txt(widget.description, style: itemDescriptionTextStyle),
            ],
          )
        ],
      ),
    );
  }

  final settingsItemStyle = (pressed) => ParentStyle()
    ..elevation(pressed ? 0 : 50, color: Colors.grey)
    ..scale(pressed ? 0.95 : 1.0)
    ..alignmentContent.center()
    ..height(60)
    // ..margin(vertical: 10)
    // ..borderRadius(all: 15)
    ..background.color(bWhite)
    ..ripple(true)
    ..animate(150, Curves.easeOut);

  final settingsItemIconStyle = (Color color) => ParentStyle()
    ..background.color(color)
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TxtStyle itemTitleTextStyle = TxtStyle()
    ..bold()
    ..fontSize(16);

  final TxtStyle itemDescriptionTextStyle = TxtStyle()
    ..textColor(Colors.black26)
    ..bold()
    ..fontSize(12);
}
