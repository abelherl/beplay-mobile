import 'package:beplay/bloc/register/register_bloc.dart';
import 'package:beplay/const.dart';
import 'package:beplay/model/user_model.dart';
import 'package:beplay/pages/home_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

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
  RegisterBloc _bloc;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    _bloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Scaffold(
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

              // RegExp exp = RegExp(r"^[a-zA-Z0-9_\-@]+$");
              // if (!exp.hasMatch(text)) {
              //   return "some characters are not accepted";
              // }

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
                return 'Please enter a Confirm Password';
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
          BlocConsumer<RegisterBloc, RegisterState>(builder: (context, state) {
            if (state is RegisterWaiting) {
              return _loading();
            }
            if (state is RegisterSuccess) {
              return _autoLogin();
            }
            if (state is RegisterFailed) {
              showToast("GAGAL",
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              return Column(
                children: [
                  _buildButton(),
                ],
              );
            }
            return _buildButton();
          }, listener: (context, state) {
            if (state is RegisterFailed) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            }
          }),
        ],
      ),
    );
  }

  _buildButton() {
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
        "SIGN UP",
        gesture: Gestures()
          ..onTap(() {
            _formKey.currentState.validate();
            _formKey.currentState.save();
            UserModel models = UserModel(
                nama: _txtFirstName.text + _txtLastName.text,
                email: _txtEmail.text,
                password: _txtPassword.text,
                passwordConfirmation: _txtConfirmPassword.text);
            if (models != null) {
              _bloc.add(Register(model: models));
            }
            print(models.toJson());
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
    );
  }

  _loading() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  _autoLogin() async {
    var client = http.Client();
    try {
      // var uriResponse = await client.post(
      //     'https://damp-basin-32676.herokuapp.com/api/auth/login',
      //     body: {'email': _txtEmail.text, 'password': _txtPassword.text});
      // if (uriResponse.body != null) {
      //   Navigator.pushReplacementNamed(context, '/home');
      // }
      // print(uriResponse.statusCode);
      Navigator.pushReplacementNamed(context, '/home');
      _txtFirstName.dispose();
      _txtLastName.dispose();
      _txtEmail.dispose();
      _txtPassword.dispose();
    } finally {
      client.close();
    }
  }
}
