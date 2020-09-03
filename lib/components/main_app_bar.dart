import 'package:beplay/const.dart';
import 'package:beplay/data_dummy.dart';
import 'package:beplay/pages/cart_screen.dart';
import 'package:beplay/pages/detail_dance.dart';
import 'package:beplay/pages/filter_screen.dart';
import 'package:beplay/pages/sort_screen.dart';
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

    static const choices = [
        "Filter",
        "Sort"
    ];

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
                PopupMenuButton(
                    enabled: filterIconEnabled,
                    icon: Icon(
                        Icons.filter_list,
                        color: filterIconEnabled ? Colors.white : Colors.transparent,
                        size: filterIconEnabled ? 25 : 0,
                    ),
                    onSelected: (selected) => onSelected(context, selected),
                    itemBuilder: (context) {
                        return choices.map((item) {
                            return PopupMenuItem(
                                value: item,
                                child: Text(item),
                            );
                        }).toList();
                    },
                ),
                Parent(
                    gesture: Gestures()
                        ..onTap(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return CartScreen();
                            }));
                        }),
                    style: ParentStyle()..padding(left: 8, right: 15),
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

    void onSelected(BuildContext context, String selected) {
        StatefulWidget nextPage = FilterScreen();

        if (selected == "Sort") {
            nextPage = SortScreen();
        }

        Navigator.push(context, MaterialPageRoute(builder: (context) {
            return nextPage;
        }));
    }
}
