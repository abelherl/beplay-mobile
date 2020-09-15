import 'package:beplay/const.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:beplay/pages/orders_history_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../data_dummy.dart';
import 'detail_dance.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bPrimaryColor,
        automaticallyImplyLeading: false,
        title: Txt(
          "Your Orders",
          style: TxtStyle()
            ..fontSize(20)
            ..fontWeight(FontWeight.bold)
            ..fontFamily('Montserrat')
            ..textColor(Colors.white)
            ..padding(left: 10),
        ),
        actions: [
          Parent(
              gesture: Gestures()
                ..isTap((isTapped) => setState(() {
                      tap = isTapped;
                    }))
                ..onTap(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrdersHistoryScreen()));
                }),
              style: ParentStyle()
                ..padding(right: 15)
                ..ripple(true)
                ..animate(150, Curves.easeOut)
                ..borderRadius(all: 32)
                ..alignment.center(),
              child: SvgPicture.asset(
                'icons/ic_baseline-history.svg',
                color: Colors.white,
                height: 32,
                width: 32,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Parent(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: NeverScrollableScrollPhysics(),
            children: orders.map((item) {
              return CardOrders(
                item: item,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CardOrders extends StatefulWidget {
  const CardOrders({Key key, @required this.item}) : super(key: key);

  final DanceModel item;
  @override
  _CardOrdersState createState() => _CardOrdersState();
}

class _CardOrdersState extends State<CardOrders> {
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
                          widget.item.date + " " + widget.item.time,
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
                              Txt(
                                'On Process',
                                style: TxtStyle()
                                  ..fontWeight(FontWeight.bold)
                                  ..fontSize(14)
                                  ..textColor(bPrimaryColor),
                              ),
                              SizedBox(height: 5),
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
