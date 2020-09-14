import 'package:beplay/const.dart';
import 'package:beplay/pages/agenda_screen.dart';
import 'package:beplay/pages/orders_screen.dart';
import 'package:beplay/pages/page_home_screen.dart';
import 'package:beplay/pages/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _page = 0;
  Widget _showPage = PageHomeSceen();

  // ignore: missing_return
  Widget _choosePage(int page) {
    switch (page) {
      case 0:
        return PageHomeSceen();
      case 1:
        return OrdersScreen();
      case 2:
        return AgendaScreen();
      case 3:
        return ProfileScreen();
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
                activeIcon:
                    SvgPicture.asset("icons/ant-design_home-filled.svg"),
                title: Text(
                  'Home',
                  style: textStyle,
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("icons/clarity_list-line.svg"),
                activeIcon: SvgPicture.asset("icons/clarity_list-solid.svg"),
                title: Text(
                  'Orders',
                  style: textStyle,
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("icons/carbon_calendar.svg"),
                activeIcon:
                    SvgPicture.asset("icons/ant-design_calendar-filled.svg"),
                title: Text(
                  'Agenda',
                  style: textStyle,
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("icons/bi_person.svg"),
                activeIcon: SvgPicture.asset(
                  "icons/bi_person-fill.svg",
                  color: bPrimaryColor,
                ),
                title: Text(
                  'Profile',
                  style: textStyle,
                )),
          ],
          onTap: (int tapindex) {
            setState(() {
              _page = tapindex;
              _showPage = _choosePage(tapindex);
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
