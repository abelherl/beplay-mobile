import 'package:beplay/components/banner_class.dart';
import 'package:beplay/components/home_icons_class.dart';
import 'package:beplay/const.dart';
import 'package:beplay/model/home_icons.dart';
import 'package:beplay/pages/cart_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<String> images = [
  'images/photo-1549576490-b0b4831ef60a.png',
  'images/photo-1524594152303-9fd13543fe6e.png'
];
final List<String> title = [''];

class pageHome_Screen extends StatefulWidget {
  @override
  _Page_Home createState() => _Page_Home();
}

class _Page_Home extends State<pageHome_Screen> {
  PageController pageController = PageController();
  bool pressed = false;

  var row1 = [
    HomeIcons(title: "Dance", icon: "icons/mdi_human-female-dance.svg"),
    HomeIcons(title: "Yoga", icon: "icons/mdi_yoga.svg"),
    HomeIcons(title: "Outdoors", icon: "icons/si-glyph_tent-camp.svg"),
    HomeIcons(title: "Cardio", icon: "icons/medical-icon_i-cardiology.svg"),
  ];

  var row2 = [
    HomeIcons(title: "Strength", icon: "icons/map_gym.svg"),
    HomeIcons(title: "Boxing", icon: "icons/emojione-monotone_boxing-glove.svg"),
    HomeIcons(title: "Meditation", icon: "icons/mdi_meditation.svg"),
    HomeIcons(title: "Others", icon: "icons/ant-design_plus-outlined.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Hi, smkcoding!",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: bPrimaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Parent(
              gesture: Gestures()
                ..onTap(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CartScreen();
                  }));
                }),
              style: ParentStyle()
                ..ripple(true, splashColor: bPrimaryLightColor)
                ..height(60)
                ..width(60)
                ..borderRadius(all: 30),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          )
        ],
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Parent(
              style: ParentStyle()
                ..padding(horizontal: 20, top: 5, bottom: 20)
                ..borderRadius(bottomRight: 20, bottomLeft: 20)
                ..background.color(bPrimaryColor),
              child: Container(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search, color: bLightTextColor),
                    filled: true,
                    hintText: "Search",
                    fillColor: Colors.white
                  ),
                ),
              ),
            ),
            Parent(
              style: ParentStyle()
                ..width(size.width)
                ..height(size.height/3.5)
                ..minHeight(200),
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, position) {
                  return BannerClass(position: position,);
                },
                controller: pageController,
                itemCount: 3,
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 20, ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: WormEffect(
                        dotWidth: 11,
                        dotHeight: 11,
                        radius: 6,
                        spacing: 12,
                        dotColor: bInactiveColor,
                        activeDotColor: bPrimaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -20,
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("See all", style: TextStyle(color: bPrimaryColor, fontWeight: FontWeight.bold),),
                          Icon(Icons.chevron_right, color: bPrimaryColor)
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Text(
                "Classes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row1.map((item) {
                  return HomeIconsClass(item: item, size: size);
                }).toList().cast<Widget>(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row2.map((item) {
                  return HomeIconsClass(item: item, size: size);
                }).toList().cast<Widget>(),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
