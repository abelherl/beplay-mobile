import 'package:beplay/const.dart';
import 'package:beplay/pages/login_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        styleTitle: TextStyle(color: Colors.black),
        pathImage: "icons/yoga1.png",
        widgetDescription: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Anywhere",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'ProximaNova'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Feel free you don't need to go to a gym\nor a zumba studio",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0x99999999),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
        backgroundColor: Color(0xffffffff),
      ),
    );
    slides.add(
      new Slide(
        styleTitle: TextStyle(color: Colors.black),
        pathImage: "icons/waiting1.png",
        widgetDescription: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Anytime",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "You can set your own schedule easily",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0x99999999),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
        backgroundColor: Color(0xffffffff),
      ),
    );
    slides.add(
      new Slide(
        styleTitle: TextStyle(color: Colors.black),
        pathImage: "icons/meditation1.png",
        widgetDescription: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Interactive",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "We have the best trainer and suitable\ncourse",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0x99999999),
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
        backgroundColor: Color(0xffffffff),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      nameSkipBtn: "Skip",
      widthDoneBtn: 130,
      widthSkipBtn: 130,
      renderDoneBtn: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Txt(
            'Get Started',
            style: TxtStyle()
              ..textColor(bPrimaryColor)
              ..bold(),
          ),
          Icon(Icons.chevron_right, color: bPrimaryColor)
        ],
      ),
      renderNextBtn: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Txt(
            'Next',
            style: TxtStyle()
              ..textColor(bPrimaryColor)
              ..bold(),
          ),
          Icon(Icons.chevron_right, color: bPrimaryColor)
        ],
      ),
      colorActiveDot: bPrimaryColor,
      colorDot: Color(0xc4c4c4c4),
      styleNameSkipBtn: TextStyle(color: Colors.black),
      styleNamePrevBtn: TextStyle(color: bPrimaryColor),
      styleNameDoneBtn: TextStyle(color: bPrimaryColor),
    );
  }
}
