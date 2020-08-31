import 'package:beplay/const.dart';
import 'package:beplay/data_dummy.dart';
import 'package:beplay/pages/detail_dance.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
    const MainAppBar({
        Key key,
        @required this.title,
        this.filterIconEnabled = false,
        this.cartIconEnabled = false
    }) : super(key: key);

    final title;
    final filterIconEnabled;
    final cartIconEnabled;

    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: Text(title, style: TextStyle(color: Colors.white),),
            backgroundColor: bPrimaryColor,
            centerTitle: false,
            elevation: 0,
            leading: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios, color: Colors.white,)
            ),
            actions: [
                Parent(
                    gesture: Gestures()
                        ..onTap(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return DetailDance(danceModel: danceData[1]);
                            }));
                        }),
                    style: ParentStyle()..padding(all: 15),
                    child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                        size: filterIconEnabled ? 25 : 0,
                    ),
                ),
                Parent(
                    gesture: Gestures()
                        ..onTap(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailDance(danceModel: danceData[1]);
                            }));
                        }),
                    style: ParentStyle()..padding(right: 15),
                    child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: filterIconEnabled ? 25 : 0,
                    ),
                ),
            ],
        );
    }

    @override
    Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
