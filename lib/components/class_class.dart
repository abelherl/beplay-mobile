import 'package:beplay/const.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:beplay/pages/detail_dance.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ClassClass extends StatefulWidget {
  const ClassClass({Key key, @required this.item}) : super(key: key);

  final DanceModel item;

  @override
  _ClassClassState createState() => _ClassClassState();
}

class _ClassClassState extends State<ClassClass> {
  var pressed = false;
  @override
  Widget build(BuildContext context) {
    return Parent(
        gesture: Gestures()
          ..isTap((isTapped) => setState(() {
            pressed = isTapped;
          }))
          ..onTap(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailDance(danceModel: widget.item);
            }));
          }),
        style: ParentStyle()
          ..margin(top: 20)
          ..height(185)
          ..ripple(true, splashColor: bPrimaryLightColor)
          ..scale(pressed ? 0.93 : 1)
//          ..elevation(pressed ? 0 : 50)
          ..borderRadius(all: 20)
          ..animate(400, Curves.easeOutQuart)
          ..background.color(bBackgroundColor),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: Parent(
                style: ParentStyle()
                  ..height(double.infinity)
                  ..borderRadius(bottomLeft: 20, topLeft: 20)
                  ..background.image(
                    url: widget.item.images,
                    fit: BoxFit.cover,
                  ),
                child: Parent(
                  style: ParentStyle()
                    ..padding(all: 10)
                    ..borderRadius(bottomLeft: 20, topLeft: 20)
                    ..linearGradient(
                      colors: [Colors.black38, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        "icons/clarity_date-solid.svg",
                        color: Colors.white,
                      ),
//                                        SizedBox(
//                                            width: 5,
//                                        ),
//                                        AutoSizeText(
//                                            widget.item.date,
//                                            minFontSize: 10,
//                                            style: TextStyle(
//                                                color: Colors.white, fontWeight: FontWeight.bold),
//                                        ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Parent(
                gesture: Gestures()
                  ..onTap(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DetailDance(danceModel: widget.item);
                        }));
                  }),
                style: ParentStyle()
                  ..background.color(bBackgroundColor)
                  ..borderRadius(bottomRight: 20, topRight: 20)
                  ..ripple(true)
                  ..padding(all: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "Digital Class",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.item.place,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.item.author,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rp. 200.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              SmoothStarRating(
                                rating: widget.item.rating,
                                isReadOnly: true,
                                color: bPrimaryColor,
                                borderColor: bPrimaryColor,
                                size: 17,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.item.skill,
                                style:
                                TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "25 Slots",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}