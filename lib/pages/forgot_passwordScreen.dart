import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class forgot_PasswordScreen extends StatefulWidget {
  @override
  _forgot_PasswordScreen createState() => _forgot_PasswordScreen();
}

class _forgot_PasswordScreen extends State<forgot_PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(64.0)),
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            color: Colors.deepOrange,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Image.asset('images/logo2.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'Enter your username/Email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                elevation: 5.0,
                child: MaterialButton(
                  height: MediaQuery.of(context).size.height / 40,
                  minWidth: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
