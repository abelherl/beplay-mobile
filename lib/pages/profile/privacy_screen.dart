import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/data_const.dart';
import 'package:beplay/model/privacy_model.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bWhite,
      appBar: MainAppBar(title: 'Privacy'),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Txt(
                privacyTitleIndonesian,
                style: TxtStyle()
                  ..background.color(bWhite)
                  ..fontSize(20)
                  ..textColor(bDarkTextColor)
                  ..fontSize(20.0)
                  ..bold()
                  ..alignment.center()
                  ..padding(top: 10),
              ),
              Parent(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  physics: NeverScrollableScrollPhysics(),
                  children: privacyModel.map((item) {
                    return ItemPrivacy(
                      item: item,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemPrivacy extends StatelessWidget {
  const ItemPrivacy({Key key, @required this.item}) : super(key: key);

  final PrivacyModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bWhite,
      child: Column(
        children: [
          Txt(
            item.title,
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
            item.description,
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
