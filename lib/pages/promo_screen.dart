import 'package:beplay/components/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:beplay/const.dart';
import 'package:flutter/services.dart';

class PromoScreen extends StatefulWidget {
  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(title: 'Promo Code',),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'PROMO CODE',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(height: 20),
            Txt(
              'REDEEM',
              gesture: Gestures()
                ..onTap(() {
                  Navigator.pop(context);
                }),
              style: TxtStyle()
                ..width(double.infinity)
                ..background.color(bPrimaryColor)
                ..alignmentContent.center()
                ..textColor(Colors.white)
                ..bold()
                ..fontSize(16)
                ..padding(all: 20)
                ..borderRadius(all: 100),
            ),
            SizedBox(height: 25,),
            Text(
              "Available Codes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 15,),
            Parent(
              child: Text(
                "NEWUSER131",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: ParentStyle()
                ..height(150)
                ..width(double.infinity)
                ..padding(all: 20)
                ..borderRadius(all: 20)
                ..ripple(true, splashColor: bPrimaryLightColor)
                ..linearGradient(colors: [bPrimaryColor, bPrimaryLightColor]),
            ),
            SizedBox(height: 15,),
            Parent(
              child: Text(
                "SEPTEMBERPROMO",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: ParentStyle()
                ..height(150)
                ..width(double.infinity)
                ..padding(all: 20)
                ..borderRadius(all: 20)
                ..ripple(true, splashColor: bPrimaryLightColor)
                ..linearGradient(colors: [bPrimaryColor, bPrimaryLightColor]),
            ),
          ],
        ),
      ),
    );
  }
}
