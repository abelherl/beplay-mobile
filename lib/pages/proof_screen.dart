import 'package:beplay/components/class_class.dart';
import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/const.dart';
import 'package:beplay/data_dummy.dart';
import 'package:beplay/pages/payment_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProofScreen extends StatefulWidget {
  @override
  _ProofScreenState createState() => _ProofScreenState();
}

class _ProofScreenState extends State<ProofScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(title: 'Waiting for payment',),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25,),
                Text(
                  "Payment Deadline",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "5 September 2020 @ 10:00",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 25,),
//                ClassClass(item: danceData[1]),
                SizedBox(height: 25,),
              ],
            ),
            Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Bank BCA: 9000 5000 9000\nPT. Wellness",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: bLightTextColor,
              ),
            ),
            SizedBox(height: 25,),
            Text(
              "Payment Proof",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 15,),
            Parent(
              style: ParentStyle()
                ..width(MediaQuery.of(context).size.width)
                ..height(MediaQuery.of(context).size.width)
                ..alignmentContent.center()
                ..maxHeight(300)
                ..borderRadius(all: 20)
                ..ripple(true)
                ..background.color(bBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('icons/dashicons_upload.svg', height: 35, color: bDarkTextColor.withAlpha(188)),
                  SizedBox(width: 5,),
                  Text(
                    "UPLOAD",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: bDarkTextColor.withAlpha(188),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Txt(
              'SUBMIT',
              gesture: Gestures()
                ..onTap(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaymentScreen(success: true,);
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
