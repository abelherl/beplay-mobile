import 'package:beplay/bloc/account/account_bloc.dart';
import 'package:beplay/components/main_app_bar.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  _loading() {
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

  _showAlertDialog(String msg) {
    Navigator.pop(context);
    Alert(
      context: context,
      type: AlertType.error,
      title: msg,
      buttons: [
        DialogButton(
          color: Colors.white,
          child: Text(
            "Close",
            style: TextStyle(color: bLightTextColor),
          ),
          onPressed: () => Navigator.pop(context),
          width: 100,
        ),
      ],
    ).show();
  }

  _showAlertDialogSuccess(String msg) {
    Navigator.pop(context);
    Alert(
      context: context,
      type: AlertType.success,
      title: msg,
      buttons: [
        DialogButton(
          color: Colors.white,
          child: Text(
            "Close",
            style: TextStyle(color: bLightTextColor),
          ),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, '/home', (route) => false),
          width: 100,
        ),
      ],
    ).show();
  }

  _updateUserPassword() {
    Map<String, dynamic> data = {
      'current_password': txtCurrentPassword.text,
      'password': txtNewPassword.text,
      'password_confirmation': txtConfirmPassword.text
    };
    context.bloc<AccountBloc>().add(UpdateUserPassword(data: data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(title: 'Change Password'),
        body: BlocListener<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is AccountWaiting) {
              _loading();
            }
            if (state is AccountSuccess) {
              _showAlertDialogSuccess("Change Password Success");
            }
            if (state is AccountFailed) {
              _showAlertDialog("Update Data Failed");
            }
          },
          child: Parent(
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
                    if (text.length < 8) {
                      return 'Please enter a Password more 8 characters';
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
                    if (text.length < 8) {
                      return 'Please enter a Password more 8 characters';
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
                    gesture: Gestures()
                      ..onTap(() {
                        _updateUserPassword();
                      }),
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
        ));
  }
}
