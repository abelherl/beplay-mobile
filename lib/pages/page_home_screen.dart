import 'package:beplay/components/banner_class.dart';
import 'package:beplay/components/home_icons_class.dart';
import 'package:beplay/const.dart';
import 'package:beplay/model/home_icons.dart';

import 'package:division/division.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<String> images = [
  'images/photo-1549576490-b0b4831ef60a.png',
  'images/photo-1524594152303-9fd13543fe6e.png'
];
final List<String> title = [''];

class PageHomeSceen extends StatefulWidget {
  @override
  _PageHomeSceen createState() => _PageHomeSceen();
}

class _PageHomeSceen extends State<PageHomeSceen> {
  PageController pageController = PageController();
  bool pressed = false;
  FirebaseAuth _auth=FirebaseAuth.instance;
  String _name = 'user';


  var row1 = [
    HomeIcons(title: "Dance", icon: "icons/mdi_human-female-dance.svg", category: 1),
    HomeIcons(title: "Yoga", icon: "icons/mdi_yoga.svg", category: 2),
    HomeIcons(title: "Outdoors", icon: "icons/si-glyph_tent-camp.svg", category: 3),
    HomeIcons(title: "Cardio", icon: "icons/medical-icon_i-cardiology.svg", category: 4),
  ];

  var row2 = [
    HomeIcons(title: "Strength", icon: "icons/map_gym.svg", category: 5),
    HomeIcons(title: "Boxing", icon: "icons/emojione-monotone_boxing-glove.svg", category: 6),
    HomeIcons(title: "Meditation", icon: "icons/mdi_meditation.svg", category: 7),
    HomeIcons(title: "Others", icon: "icons/ant-design_plus-outlined.svg", category: 8),
  ];

   _getDataName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _name = pref.getString("name");
    });
  }

  @override
  void initState() {
    super.initState();

    _getDataName();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Hi, $_name!",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: bPrimaryColor,
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
                      fillColor: Colors.white),
                ),
              ),
            ),
            Parent(
              style: ParentStyle()
                ..width(size.width)
                ..height(size.height / 3.5)
                ..minHeight(200),
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, position) {
                  return BannerClass(
                    position: position,
                    route: null,
                    image: null,
                  );
                },
                controller: pageController,
                itemCount: 3,
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
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
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "See all",
                              style: TextStyle(
                                  color: bPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.chevron_right, color: bPrimaryColor)
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Text(
                "Classes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row1
                    .map((item) {
                      return HomeIconsClass(item: item, size: size, category: item.category,);
                    })
                    .toList()
                    .cast<Widget>(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row2
                    .map((item) {
                      return HomeIconsClass(item: item, size: size, category: item.category,);
                    })
                    .toList()
                    .cast<Widget>(),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
