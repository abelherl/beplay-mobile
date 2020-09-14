import 'package:beplay/components/main_app_bar.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../const.dart';

class AccountSettingScreen extends StatefulWidget {
  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  TextEditingController _txtFirstName = TextEditingController();
  TextEditingController _txtLastName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  final FocusNode _txtLastNameNode = FocusNode();
  final FocusNode _txtEmailNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bBackgroundColor,
      appBar: MainAppBar(title: 'Account'),
      body: Container(
        child: SingleChildScrollView(
          // primary: true,
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Txt('Profile',
                  style: TxtStyle()
                    ..padding(left: 20, right: 25)
                    ..textColor(bBlack)
                    ..bold()
                    ..fontSize(23)),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "cannot be empty";
                                }

                                RegExp exp = RegExp(r"^[a-zA-Z0-9_\-@]+$");
                                if (!exp.hasMatch(text)) {
                                  return "some characters are not accepted";
                                }

                                return null;
                              },
                              controller: _txtFirstName,
                              decoration: InputDecoration(
                                  labelText: "First Name", prefixText: "\t"),
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(_txtLastNameNode);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "cannot be empty";
                                }

                                RegExp exp = RegExp(r"^[a-zA-Z0-9_\-@]+$");
                                if (!exp.hasMatch(text)) {
                                  return "some characters are not accepted";
                                }

                                return null;
                              },
                              controller: _txtLastName,
                              focusNode: _txtLastNameNode,
                              decoration: InputDecoration(
                                  labelText: "Last Name", prefixText: "\t"),
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(_txtEmailNode);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text.isEmpty) {
                            return "cannot be empty";
                          }

                          RegExp exp = RegExp(r"^[a-zA-Z0-9_\-@]+$");
                          if (!exp.hasMatch(text)) {
                            return "some characters are not accepted";
                          }

                          return null;
                        },
                        controller: _txtEmail,
                        focusNode: _txtEmailNode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email", prefixText: "\t"),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        height: 48.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: bPrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Txt(
                          "UPDATE",
                          gesture: Gestures()..onTap(() {}),
                          style: TxtStyle()
                            ..textColor(Colors.white)
                            ..fontSize(16.0)
                            ..alignmentContent.center()
                            ..background.color(bPrimaryColor)
                            ..width(MediaQuery.of(context).size.width)
                            ..padding(vertical: 15)
                            ..height(56)
                            ..borderRadius(all: 16)
                            ..ripple(true, splashColor: bPrimaryLightColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Txt(
                'Password',
                style: TxtStyle()
                  ..padding(left: 20, top: 30)
                  ..textColor(bBlack)
                  ..fontSize(23)
                  ..bold(),
              ),
              Parent(
                style: ParentStyle()..padding(left: 20, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'icons/fa_regular_edit.svg',
                      color: bPrimaryColor,
                    ),
                    Txt("Change Password",
                        gesture: Gestures()
                          ..onTap(() => setState(() => Navigator.of(context)
                              .pushNamed('/change_password'))),
                        style: TxtStyle()
                          ..padding(left: 5.0)
                          ..textColor(bPrimaryColor)
                          ..background.color(bBackgroundColor)
                          ..textAlign.center()
                          ..bold()
                          ..fontSize(16.0)
                          ..ripple(true, splashColor: bInactiveColor)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
