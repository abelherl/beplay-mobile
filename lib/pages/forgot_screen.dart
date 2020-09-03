import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import 'verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _txtEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: MediaQuery.of(context).size.width / 7,
                ),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "Insert your email to receive\nnew verification code",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 5,
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            validator: (text) {
                              if (text.isEmpty) {
                                return "cannot be empty";
                              }
                              return null;
                            },
                            controller: _txtEmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              contentPadding: const EdgeInsets.all(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
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
                            "SEND",
                            gesture: Gestures()
                              ..onTap(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationScreen()));
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
