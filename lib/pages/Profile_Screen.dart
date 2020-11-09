import 'package:beplay/bloc/logout/logout_bloc.dart';
import 'package:beplay/const.dart';
import 'package:beplay/repositories/user_repository.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name;

  _getDataName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _name = pref.getString("name");
    });
  }

  _loading() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: SpinKitDualRing(
              color: bPrimaryColor,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getDataName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bWhite,
        body: BlocListener<LogOutBloc, LogOutState>(
            listener: (context, state) {
              if (state is LogOutWaiting) {
                _loading();
              }
              if (state is LogOutSuccess) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);

              }
              if (state is LogOutFailed) {
                print("LogOut Failed");
              }
            },
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            color: bPrimaryColor,
                            height: MediaQuery.of(context).size.height / 4,
                          ),
                          Transform.translate(
                              offset: Offset(125, 125),
                              child: Parent(
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: AssetImage('icons/man.png'),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      Txt(
                        (_name != null) ? _name : '-',
                        // 'Faisal Armas',
                        style: TxtStyle()
                          ..maxLines(1)
                          ..alignment.center()
                          ..textColor(Colors.black)
                          ..fontWeight(FontWeight.w600)
                          ..fontSize(25.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        color: bWhite,
                        child: Column(
                          children: [
                            SettingsItem(
                                'icons/bi_person-fill.svg',
                                Colors.white,
                                'Account',
                                'Change your Account Detail',
                                1),
                            SettingsItem(
                                'icons/ic_baseline-g-translate.svg',
                                Colors.grey[400],
                                'Language',
                                'Change App Language',
                                2),
                            SettingsItem(
                                'icons/clarity_settings-solid.svg',
                                Colors.grey[400],
                                'Settings',
                                'Notifications Settings',
                                3),
                            SettingsItem(
                                'icons/dashicons_privacy.svg',
                                Colors.grey[400],
                                'Privacy',
                                'Privacy and Policy',
                                4),
                            SettingsItem('icons/wpf_faq.svg', Colors.grey[400],
                                'FAQ', 'Frequently Asked Questions', 5),
                            SettingsItem('icons/ion_log-out.svg',
                                Colors.grey[400], 'Log Out', 'Sign Out', 6),
                            Container(
                              height: 10.0,
                              color: bWhite,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

class SettingsItem extends StatefulWidget {
  SettingsItem(
      this.icon, this.iconBgColor, this.title, this.description, this.tap);

  final String icon;
  final Color iconBgColor;
  final String title;
  final String description;
  final int tap;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;
  UserRepository user = new UserRepository();

  @override
  Widget build(BuildContext context) {
    int tappedCase = widget.tap;
    return Parent(
      style: settingsItemStyle(pressed)
        ..elevation(0.0)
        ..background.color(bWhite),
      gesture: Gestures()
        ..isTap((isTapped) => setState(() => pressed = isTapped))
        ..onTap(() {
          switch (tappedCase) {
            case 1:
              Navigator.of(context).pushNamed('/account');
              break;
            case 2:
              Navigator.of(context).pushNamed('/language');
              break;
            case 3:
              Navigator.of(context).pushNamed('/notification');
              break;
            case 4:
              Navigator.of(context).pushNamed('/privacy');
              break;
            case 5:
              Navigator.of(context).pushNamed('/faq');
              break;
            case 6:
              _showAlertConfirmation();
              break;
            default:
          }
        }),
      child: Row(
        children: <Widget>[
          Parent(
            style: settingsItemIconStyle(bWhite)..elevation(0.0),
            child: SvgPicture.asset(
              widget.icon,
              color: Colors.grey[400],
              height: 25,
              width: 25,
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Txt(widget.title, style: itemTitleTextStyle),
              Txt(widget.description, style: itemDescriptionTextStyle),
            ],
          )
        ],
      ),
    );
  }

  final settingsItemStyle = (pressed) => ParentStyle()
    ..elevation(pressed ? 0 : 50, color: Colors.grey)
    ..scale(pressed ? 0.95 : 1.0)
    ..alignmentContent.center()
    ..height(60)
    // ..margin(vertical: 10)
    // ..borderRadius(all: 15)
    ..background.color(bWhite)
    ..ripple(true)
    ..animate(150, Curves.easeOut);

  final settingsItemIconStyle = (Color color) => ParentStyle()
    ..background.color(color)
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TxtStyle itemTitleTextStyle = TxtStyle()
    ..bold()
    ..fontSize(16);

  final TxtStyle itemDescriptionTextStyle = TxtStyle()
    ..textColor(Colors.black26)
    ..bold()
    ..fontSize(12);

  _showAlertConfirmation() {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Are You sure\nwant to logout?",
      buttons: [
        DialogButton(
          color: Colors.white,
          child: Text(
            "No!",
            style: TextStyle(color: bPrimaryColor),
          ),
          onPressed: () => Navigator.pop(context),
          width: 100,
        ),
        DialogButton(
          color: Colors.white,
          child: Text(
            "Yes",
            style: TextStyle(color: bLightTextColor),
          ),
          onPressed: () => {context.bloc<LogOutBloc>().add(LogOut())},
          width: 100,
        )
      ],
    ).show();
  }
}
