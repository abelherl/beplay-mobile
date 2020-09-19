import 'package:beplay/bloc/login/login_bloc.dart';
import 'package:beplay/model/user_model.dart';
import 'package:beplay/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:beplay/const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'forgot_screen.dart';
import 'signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  UserRepository _repo = new UserRepository();

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bWhite,
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginWaiting) {
              _loading();
            }
            if (state is LoginSuccess) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            }
            if (state is LoginFailed) {
              Navigator.pop(context);
              _showAlertDialog(state.message);
            }
          },
          child: Center(
            child: Container(
              color: bWhite,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Parent(
                      style: ParentStyle()
                        ..width(200)
                        ..height(200)
                        ..background.color(bWhite),
                      child: Image.asset('images/logo1.png'),
                    ),
                    Parent(
                      style: ParentStyle()..margin(all: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Txt(
                              "Login",
                              style: TxtStyle()
                                ..fontSize(25)
                                ..textColor(Colors.blueGrey.shade700)
                                ..fontWeight(FontWeight.w700),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: txtEmail,
                              validator: (emailInput) {
                                if (emailInput.isEmpty) {
                                  return 'Please enter an email';
                                }
                                return null;
                              },
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(txtPasswordNode);
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'EMAIL',
                                contentPadding: const EdgeInsets.all(10.0),
                                prefixIcon: Icon(
                                  Icons.alternate_email,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            TextFormField(
                              controller: txtPassword,
                              focusNode: txtPasswordNode,
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
                                labelText: 'PASSWORD',
                                contentPadding: const EdgeInsets.all(10.0),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.orange,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: toggleVisibility,
                                  icon: isHidden
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                ),
                              ),
                              obscureText: isHidden,
                            ),
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
                            _loginButton(),
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
                                            onPressed: () {
                                              signInWithGoogle().then((result) {
                                                if (result != null) {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, '/home');
                                                }
                                              });
                                            },
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _loginButton() {
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
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              _loginRequest();
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
    );
  }

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

  _showAlertDialog(String message) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "User not found !",
      desc: "Do you want to create an account?",
      buttons: [
        DialogButton(
          color: Colors.white,
          child: Text(
            "No, thanks",
            style: TextStyle(color: bLightTextColor),
          ),
          onPressed: () => Navigator.pop(context),
          width: 100,
        ),
        DialogButton(
          color: Colors.white,
          child: Text(
            "Yes",
            style: TextStyle(color: bPrimaryColor),
          ),
          onPressed: () => Navigator.of(context).popAndPushNamed('/signup'),
          width: 100,
        ),
      ],
    ).show();
  }

  _loginRequest() async {
    context.bloc<LoginBloc>().add(Login(
        model: UserLogin(email: txtEmail.text, password: txtPassword.text)));
  }

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      _repo.setAccessToken(user.uid);
      _repo.setNameTemporary(user.displayName);

      return '$user';
    }

    return null;
  }
}
