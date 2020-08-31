import 'package:beplay/const.dart';
import 'package:beplay/pages/Profile_Screen.dart';
import 'package:beplay/pages/pageHomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _page = 0;
  Widget _showPage = pageHome_Screen();

  Widget _ChoosePage(int page) {
    switch (page) {
      case 0:
        return pageHome_Screen();
      case 1:
        return pageHome_Screen();
      case 2:
        return pageHome_Screen();
      case 3:
        return Profile_Screen();
    }
  }

  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          key: globalKey,
          elevation: 15,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset("icons/ant-design_home-outlined.svg"),
                activeIcon: SvgPicture.asset("icons/ant-design_home-filled.svg"),
                title: Text('Home',
                  style: textStyle,
                )
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("icons/clarity_list-line.svg"),
                activeIcon: SvgPicture.asset("icons/clarity_list-solid.svg"),
                title: Text('Orders',
                  style: textStyle,
                )
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("icons/carbon_calendar.svg"),
                activeIcon: SvgPicture.asset("icons/ant-design_calendar-filled.svg"),
                title: Text('Agenda',
                  style: textStyle,
                )
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("icons/bi_person.svg"),
                activeIcon: SvgPicture.asset("icons/bi_person-fill.svg", color: bPrimaryColor,),
                title: Text('Profile',
                  style: textStyle,
                )
            ),
          ],
          onTap: (int tapindex) {
            setState(() {
              _page = tapindex;
              _showPage = _ChoosePage(tapindex);
            });
          },
          currentIndex: _page,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black26,
        ),
        body: Container(child: _showPage));
  }
}
