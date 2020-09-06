import 'package:beplay/model/dancemodel.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../const.dart';
import '../data_dummy.dart';
import 'detail_dance.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: null),
        actions: [
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onPressed: null)
        ],
        centerTitle: true,
        title: Txt(
          "September - 2020",
          style: TxtStyle()..textColor(Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Parent(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: NeverScrollableScrollPhysics(),
            children: agenda.map((item) {
              return CardAgenda(
                item: item,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CardAgenda extends StatefulWidget {
  const CardAgenda({Key key, @required this.item}) : super(key: key);

  final DanceModel item;
  @override
  _CardAgendaState createState() => _CardAgendaState();
}

class _CardAgendaState extends State<CardAgenda> {
  @override
  Widget build(BuildContext context) {
    var tap = false;
    return Parent(
        gesture: Gestures()
          ..isTap((isTapped) => setState(() {
                tap = isTapped;
              }))
          ..onTap(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailDance(danceModel: widget.item);
            }));
          }),
        style: ParentStyle()
          ..margin(top: 20)
          ..height(190)
          ..ripple(true, splashColor: bPrimaryLightColor)
          ..scale(tap ? 0.93 : 1)
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
                      "Private Class",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.videocam,
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
                    Row(
                      children: [
                        SvgPicture.asset(
                          "icons/clarity_date-solid.svg",
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.item.date + widget.item.time,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
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
                              SizedBox(height: 20),
                              Txt(
                                widget.item.skill,
                                style: TxtStyle()
                                  ..fontSize(14)
                                  ..textColor(Colors.grey),
                              )
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
