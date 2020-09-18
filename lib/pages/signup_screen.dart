import 'package:beplay/bloc/register/register_bloc.dart';
import 'package:beplay/const.dart';
import 'package:beplay/model/user_model.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  final _formKey = GlobalKey<FormState>();
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
      body: SafeArea(
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterWaiting) {
              _loading();
            }
            if (state is RegisterSuccess) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            }
            if (state is RegisterFailed) {
              Navigator.pop(context);
              _showAlertDialog(state.message);
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              // primary: true,
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 7),
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
        ),
      ),
    );
  }

  _buildInput() {
    return Form(
      key: _formKey,
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
              if (text.length < 8) {
                return 'Please enter a Password more 8 characters';
              }
              if (text != _txtConfirmPassword.text) {
                return 'password is not the same as confirm password';
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
                return 'Please enter a Confirm Password';
              }
              if (text.length < 8) {
                return 'Please enter a Password more 8 characters';
              }
              if (text != _txtPassword.text) {
                return 'password is not the same as confirm password';
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
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _requestRegister();
                  }
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
          )
        ],
      ),
    );
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

  _showAlertDialog(String message) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Register Failed",
      desc: message,
      buttons: [
        DialogButton(
          color: Colors.white,
          child: Text(
            "CLOSE",
            style: TextStyle(color: bPrimaryColor),
          ),
          onPressed: () => Navigator.pop(context),
          width: 100,
        )
      ],
    ).show();
  }

  _requestRegister() {
    UserRegister models = UserRegister(
        nama: _txtFirstName.text + _txtLastName.text,
        email: _txtEmail.text,
        password: _txtPassword.text,
        passwordConfirmation: _txtConfirmPassword.text);
    if (models != null) {
      context.bloc<RegisterBloc>().add(Register(model: models));
    }
  }
}
