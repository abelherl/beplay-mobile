import 'package:beplay/const.dart';
import 'package:beplay/pages/forgot_screen.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:beplay/pages/signup_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final FocusNode txtPasswordNode = FocusNode();

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Image.asset(
                      'images/logo1.png',
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 50.0,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Login",
                              // ignore: deprecated_member_use
                              style: Theme.of(context).textTheme.headline.copyWith(
                                    color: Colors.blueGrey.shade700,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            buildTextFieldUsername("Email"),
                            SizedBox(
                              height: 8.0,
                            ),
                            buildTextFieldPassword("Password"),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  InkWell(
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordScreen()),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            buildButtonContainer(),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  "Or Sign up With",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Center(
                                child: Container(
                                  child: ButtonBar(
                                    alignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        shape: CircleBorder(),
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                child: Image.asset(
                                                    'icons/icon_google.png'))),
                                      ),
                                      Card(
                                        shape: CircleBorder(),
                                        child: FlatButton(
                                            onPressed: null,
                                            child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                child: Image.asset(
                                                    'icons/icon_facebook.png'))),
                                      ),
                                      Card(
                                        shape: CircleBorder(),
                                        child: FlatButton(
                                            shape: CircleBorder(),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignupScreen()));
                                            },
                                            child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                child: Image.asset(
                                                    'icons/icon_mail.png'))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldUsername(String hintText) {
    return TextFormField(
      controller: txtEmail,
      validator: (emailInput) {
        if (emailInput.isEmpty) {
          return 'Please enter an email';
        }
        return null;
      },
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(txtPasswordNode);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: hintText,
        contentPadding: const EdgeInsets.all(10.0),
        prefixIcon: Icon(
          Icons.alternate_email,
          color: Colors.orange,
        ),
      ),
    );
  }

  Widget buildTextFieldPassword(String hintText) {
    return TextFormField(
      controller: txtPassword,
      focusNode: txtPasswordNode,
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
        labelText: hintText,
        contentPadding: const EdgeInsets.all(10.0),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.orange,
        ),
        suffixIcon: IconButton(
          onPressed: toggleVisibility,
          icon: isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
      ),
      obscureText: isHidden,
    );
  }

  Widget buildButtonContainer() {
    return Container(
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
        "LOGIN",
        gesture: Gestures()
          ..onTap(() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }),
        style: TxtStyle()
          ..textColor(Colors.white)
          ..fontSize(16.0)
          ..alignmentContent.center()
          ..background.color(bPrimaryColor)
          ..width(MediaQuery.of(context).size.width)
          ..padding(vertical: 15)
          ..height(56)
          ..borderRadius(all: 36)
          ..ripple(true, splashColor: bPrimaryLightColor),
      ),
      //   ),
      //     ),
      //   )
      //   ),
    );
  }
}
