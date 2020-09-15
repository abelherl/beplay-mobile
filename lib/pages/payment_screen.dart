import 'package:beplay/const.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key key, @required this.success}) : super(key: key);
  final success;

  @override
  _PaymentScreenState createState() => _PaymentScreenState(success);
}

class _PaymentScreenState extends State<PaymentScreen> {
  _PaymentScreenState(this.success);
  bool success;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Parent(
            style: ParentStyle()
              ..width(MediaQuery.of(context).size.width),
            gesture: Gestures()
              ..onTap(() => setState(() => success = !success)),
            child: SvgPicture.asset(success ? "icons/Group 87.svg" : "icons/Group 88.svg"),
          ),
          SizedBox(height: 25,),
          Text(
            success ? "Successful" : "Failed",
            style: TextStyle(
              fontSize: 25,
              color: bDarkTextColor,
              fontWeight: FontWeight.w800,
            ),
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
        ],
      ),
      bottomSheet: Txt(
        'BACK TO HOME SCREEN',
        gesture: Gestures()
          ..onTap(() {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (Route<dynamic> route) => false);}),
        style: TxtStyle()
          ..height(60)
          ..width(MediaQuery.of(context).size.width)
          ..background.color(bPrimaryColor)
          ..alignmentContent.center()
          ..textColor(Colors.white)
          ..bold()
          ..padding(all: 20)
          ..margin(all: 20)
          ..borderRadius(all: 100),
      ),
    );
  }
}
