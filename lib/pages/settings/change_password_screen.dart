import 'package:beplay/components/main_app_bar.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController txtCurrentPassword = TextEditingController();
  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  final FocusNode txtNewPasswordNode = FocusNode();
  final FocusNode txtConfirmPasswordNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Change Password'),
      body: Parent(
        style: ParentStyle()..padding(horizontal: 20.0),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Txt('Password',
                style: TxtStyle()
                  ..padding(left: 15, right: 25)
                  ..margin(bottom: 30, top: 50)
                  ..textColor(bBlack)
                  ..bold()
                  ..fontSize(23)
                  ..alignmentContent.centerLeft()),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: txtCurrentPassword,
              validator: (text) {
                if (text.isEmpty) {
                  return 'Please enter a Password';
                }
                if (text.length < 6) {
                  return 'Please enter a Password more 6 characters';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'CURRENT PASSWORD',
                contentPadding: const EdgeInsets.all(10.0),
              ),
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(txtNewPasswordNode);
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: txtNewPassword,
              focusNode: txtNewPasswordNode,
              validator: (text) {
                if (text.isEmpty) {
                  return 'Please enter a Password';
                }
                if (text.length < 6) {
                  return 'Please enter a Password more 6 characters';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'NEW PASSWORD',
                contentPadding: const EdgeInsets.all(10.0),
              ),
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(txtConfirmPasswordNode);
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: txtConfirmPassword,
              focusNode: txtConfirmPasswordNode,
              validator: (text) {
                if (text.isEmpty) {
                  return 'Please enter a Password';
                }
                if (text.length < 6) {
                  return 'Please enter a Password more 6 characters';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'CONFIRM PASSWORD',
                contentPadding: const EdgeInsets.all(10.0),
              ),
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
        )),
      ),
    );
  }
}
