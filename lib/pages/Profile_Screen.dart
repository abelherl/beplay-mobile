import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile_Screen extends StatefulWidget {
  @override
  _Profile_Screen createState() => _Profile_Screen();
}

class _Profile_Screen extends State<Profile_Screen> {
  List<String> Title = <String>[
    'Account',
    'Language',
    'Settings',
    'Privacy',
    'FAQ',
    'Logout'
  ];
  List<String> about = <String>[
    'Change Password About',
    'EN-US',
    'Interface',
    'Last seen,Public',
    'EN-US',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        leading: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(64.0)),
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            color: Colors.deepOrange,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.orangeAccent,
                height: MediaQuery.of(context).size.height / 6,
              ),
              Transform.translate(
                offset: Offset(125, 75),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/aaa.jpeg'),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -175),
                child: Center(
                  child: Text(
                    'Omaewa Mou',
                    style: TextStyle(
                        color: Color(0xff404080),
                        fontWeight: FontWeight.w600,
                        fontSize: 30.0),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 250),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Title.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.orange, width: 2.0))),
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    Title[index],
                                    style: TextStyle(
                                        color: Colors.deepPurple[500],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  about[index],
                                  style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 16.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
