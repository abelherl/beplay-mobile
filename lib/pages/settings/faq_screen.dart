import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/const.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'FAQ'),
      body: SingleChildScrollView(
        child: Parent(
          style: ParentStyle()
            ..background.color(bBackgroundColor)
            ..padding(all: 15.0),
          child: Column(
            children: [
              ItemFAQ(),
              ItemFAQ(),
              ItemFAQ(),
              ItemFAQ(),
              ItemFAQ(),
              ItemFAQ(),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemFAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bBackgroundColor,
      child: Column(
        children: [
          Txt(
            "What is Be - Play ? ",
            style: TxtStyle()
              ..padding(top: 10.0)
              ..alignment.centerLeft()
              ..fontSize(20.0)
              ..textColor(bDarkTextColor)
              ..fontWeight(FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Txt(
            "Lorem Ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porta nunc eu velit posuere.",
            style: TxtStyle()
              ..fontSize(14.0)
              ..textColor(bLightTextColor)
              ..fontWeight(FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
