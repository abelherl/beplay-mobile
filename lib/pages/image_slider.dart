import 'package:beplay/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final pages = [
    PageViewModel(
      pageColor: Colors.white,
      body: Text('you can sport activity as you wish anywhere'),
      title: Text('AnyWhere'),
      titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 30.0,
          color: Colors.black),
      bodyTextStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
      bubbleBackgroundColor: Colors.orange,
      mainImage: null,
    ),
    PageViewModel(
        pageColor: Colors.white,
        body: Text('you can sport activity as you wish on time'),
        title: Text('AnyTime'),
        titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 30.0,
            color: Colors.black),
        bodyTextStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
        mainImage: Image.asset(
          'images/Image4.png',
          width: 360,
          height: 270,
        ),
        bubbleBackgroundColor: Colors.orange),
    PageViewModel(
        pageColor: Colors.white,
        body: Text('you can sport activity as you wish for refference'),
        title: Text('Interactive'),
        titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 30.0,
            color: Colors.black),
        bodyTextStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
        mainImage: Image.asset(
          'images/Image5.png',
          width: 360,
          height: 270,
        ),
        bubbleBackgroundColor: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Builder(
          builder: (context) => IntroViewsFlutter(
            pages,
            showNextButton: true,
            showBackButton: false,
            onTapDoneButton: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login()));
              });
            },
            pageButtonTextStyles:
            TextStyle(color: Colors.deepOrange, fontSize: 16.0),
            pageButtonsColor: Colors.deepOrange,
          )),
    );
  }
}
