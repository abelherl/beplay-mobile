import 'package:beplay/const.dart';
import 'package:beplay/pages/verification_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isHidden = true;
  TextEditingController _txtFirstName = TextEditingController();
  TextEditingController _txtLastName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtConfirmPassword = TextEditingController();
  final FocusNode _txtLastNameNode = FocusNode();
  final FocusNode _txtEmailNode = FocusNode();
  final FocusNode _txtPasswordNode = FocusNode();
  final FocusNode _txtConfirmNode = FocusNode();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        child: SingleChildScrollView(
          // primary: true,
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: Text(
                  "Let's get started\nCreate an account",
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headline.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 8.5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: _buildInput(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildInput() {
    return Form(
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
                      labelText: "FIRST NAME", prefixText: "\t"),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_txtLastNameNode);
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
                  decoration:
                      InputDecoration(labelText: "LAST NAME", prefixText: "\t"),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_txtEmailNode);
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
            decoration: InputDecoration(labelText: "EMAIL", prefixText: "\t"),
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_txtPasswordNode);
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            validator: (text) {
              if (text.isEmpty) {
                return 'Please enter a Password';
              }
              if (text.length < 6) {
                return 'Please enter a Password more 6 characters';
              }
              return null;
            },
            controller: _txtPassword,
            focusNode: _txtPasswordNode,
            decoration: InputDecoration(
              labelText: "PASSWORD",
              contentPadding: const EdgeInsets.all(10.0),
              suffixIcon: IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
            ),
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(_txtConfirmNode);
            },
            obscureText: _isHidden,
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            validator: (text) {
              if (text.isEmpty) {
                return 'Please enter a Password';
              }
              if (text.length < 6) {
                return 'Please enter a Password more 6 characters';
              }
              return null;
            },
            focusNode: _txtConfirmNode,
            controller: _txtConfirmPassword,
            decoration: InputDecoration(
              labelText: "CONFIRM PASSWORD",
              contentPadding: const EdgeInsets.all(10.0),
              suffixIcon: IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
            ),
            obscureText: _isHidden,
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
              "SIGN UP",
              gesture: Gestures()
                ..onTap(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerificationScreen()));
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
    );
  }
}
