import 'package:beplay/const.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bPrimaryColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  color: bPrimaryColor,
                  height: MediaQuery.of(context).size.height / 7,
                ),
                Transform.translate(
                  offset: Offset(125, 50),
                  child: Parent(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/aaa.jpeg'),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -170),
                  child: Txt(
                    'SMK CODING',
                    style: TxtStyle()
                      ..alignment.center()
                      ..textColor(Colors.black)
                      ..fontWeight(FontWeight.w600)
                      ..fontSize(25.0),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 220),
                  child: Parent(
                    style: ParentStyle()
                      ..height(MediaQuery.of(context).size.height)
                      ..margin(horizontal: 15)
                      ..elevation(0.0)
                      ..background.color(Colors.white),
                    child: Column(
                      children: [
                        SettingsItem(Icons.person, Colors.white, 'Account',
                            'Change your Account Detail'),
                        SettingsItem(Icons.translate, Colors.grey[400],
                            'Language', 'Change App Language'),
                        SettingsItem(Icons.settings, Colors.grey[400],
                            'Settings', 'Notifications Settings'),
                        SettingsItem(Icons.local_dining, Colors.grey[400],
                            'Privacy', 'Privacy and Policy'),
                        SettingsItem(Icons.format_quote, Colors.grey[400],
                            'FAQ', 'Frequently Asked Questions'),
                        SettingsItem(Icons.settings_power, Colors.grey[400],
                            'Log Out', 'Sign Out'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsItem extends StatefulWidget {
  SettingsItem(this.icon, this.iconBgColor, this.title, this.description);

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: settingsItemStyle(pressed)..elevation(0.0),
      gesture: Gestures()
        ..isTap((isTapped) => setState(() => pressed = isTapped)),
      child: Row(
        children: <Widget>[
          Parent(
            style: settingsItemIconStyle(Colors.white)..elevation(0.0),
            child: Icon(widget.icon, color: Colors.grey[400], size: 25),
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
    ..background.hex('#ffffff')
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
