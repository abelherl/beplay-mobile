import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/const.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  bool _language = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 1.1;
    return Scaffold(
      appBar: MainAppBar(title: 'Language'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Parent(
              gesture: Gestures()
                ..onTap(() => setState(() => _language = !_language)),
              style: ParentStyle()
                ..width(width)
                ..background.color(_language ? bPrimaryColor : bInactiveColor)
                ..ripple(true)
                ..borderRadius(all: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('icons/flag_england.svg'),
                  Txt("ENGLISH",
                      gesture: Gestures()
                        ..onTap(() => setState(() => _language = !_language)),
                      style: TxtStyle()
                        ..padding(all: 15)
                        ..textColor(Colors.white)
                        ..background
                            .color(_language ? bPrimaryColor : bInactiveColor)
                        ..borderRadius(all: 20)
                        ..textAlign.center()
                        ..bold()
                        ..fontSize(18.0)
                        ..ripple(true)),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Parent(
              gesture: Gestures()
                ..onTap(() => setState(() => _language = !_language)),
              style: ParentStyle()
                ..width(width)
                ..background.color(!_language ? bPrimaryColor : bInactiveColor)
                ..ripple(true)
                ..borderRadius(all: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('icons/flag_indonesia.svg'),
                  Txt("BAHASA INDONESIA",
                      gesture: Gestures()
                        ..onTap(() => setState(() => _language = !_language)),
                      style: TxtStyle()
                        ..padding(all: 15)
                        ..textColor(Colors.white)
                        ..background
                            .color(!_language ? bPrimaryColor : bInactiveColor)
                        ..borderRadius(all: 20)
                        ..textAlign.center()
                        ..bold()
                        ..fontSize(18.0)
                        ..ripple(true)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
