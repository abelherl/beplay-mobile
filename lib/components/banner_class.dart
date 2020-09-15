import 'package:beplay/const.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerClass extends StatefulWidget {
  const BannerClass(
      {Key key,
      @required this.position,
      @required this.image,
      @required this.route})
      : super(key: key);

  final position;
  final image;
  final route;

  @override
  _BannerClassState createState() => _BannerClassState();
}

class _BannerClassState extends State<BannerClass> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()
        ..isTap((isTapped) => setState(() => pressed = isTapped)),
      style: ParentStyle()
        ..margin(horizontal: 20, top: 20)
        ..background.color(bPrimaryColor)
        ..ripple(true, splashColor: bPrimaryColor)
//      ..elevation(pressed ? 0 : 15, opacity: 0.8)
        ..scale(pressed ? 0.93 : 1)
        ..animate(400, Curves.easeOutQuart)
        ..background.image(
            url:
                "https://images.pexels.com/photos/163403/box-sport-men-training-163403.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover)
        ..borderRadius(all: 20),
      child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            "Page ${widget.position + 1}",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )),
    );
  }
}
