import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/const.dart';
import 'package:beplay/data_const.dart';
import 'package:beplay/model/faq_model.dart';
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
      backgroundColor: bWhite,
      appBar: MainAppBar(title: 'FAQ'),
      body: SingleChildScrollView(
        child: Parent(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: NeverScrollableScrollPhysics(),
            children: faqIndonesian.map((item) {
              return ItemFAQ(
                item: item,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ItemFAQ extends StatelessWidget {
  const ItemFAQ({Key key, @required this.item}) : super(key: key);

  final FAQModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bWhite,
      child: Column(
        children: [
          Txt(
            item.question,
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
            item.answer,
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
