
import 'package:beplay/const.dart';
import 'package:beplay/model/home_icons.dart';
import 'package:beplay/pages/classes.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeIconsClass extends StatefulWidget {
  const HomeIconsClass({
    Key key,
    @required this.size,
    @required this.item,
  }) : super(key: key);

  final Size size;
  final HomeIcons item;

  @override
  _HomeIconsClassState createState() => _HomeIconsClassState();
}

class _HomeIconsClassState extends State<HomeIconsClass> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Parent(
          gesture: Gestures()
            ..onTap(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                            return Classes();
                        }
                    )
                );
            })
            ..isTap((isTapped) => setState(() => pressed = isTapped)),
          style: ParentStyle()
            ..ripple(true, splashColor: bPrimaryLightColor)
            ..background.color(bPrimaryColor)
            ..borderRadius(all: widget.size.width)
            ..padding(all: 15)
            ..animate(400, Curves.easeOutQuart)
            ..scale(pressed ? 0.93 : 1),
          child: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(widget.item.icon)
          ),
        ),
        SizedBox(height: 10,),
        Text(
          "${widget.item.title}",
          style: TextStyle(
              fontSize: 14
          ),
        ),
      ],
    );
  }
}
