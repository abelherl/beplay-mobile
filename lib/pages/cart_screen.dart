import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/const.dart';
import 'package:beplay/data_dummy.dart';
import 'package:beplay/pages/checkout_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Cart",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: danceData.map((item) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No. 000000001",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Parent(
                            gesture: Gestures()..onTap(() {}),
                            child: Icon(
                              Icons.delete,
                              color: bShadowColor,
                            ),
                          )
                        ],
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 13,
                          color: bLightTextColor,
                        ),
                      ),
                      Text(
                        "Rp. 200.000",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: bPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            Divider(
              color: bInactiveColor,
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Rp. 600.000",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: bPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Txt(
              'CHECK OUT',
              gesture: Gestures()
                ..onTap(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CheckoutScreen();
                  }));
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
          ],
        ),
      ),
    );
  }
}
