import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:beplay/const.dart';

class SortScreen extends StatefulWidget {
  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  bool _dateAscending = false;
  bool _popularityAscending = false;
  bool _priceAscending = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2 - 30;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Parent(
          gesture: Gestures()
            ..onTap(() {
              Navigator.pop(context);
            }),
          child: Icon(Icons.clear),
        ),
        actions: [
          Parent(
            gesture: Gestures()
              ..onTap(() {
                Navigator.pop(context);
              }),
            style: ParentStyle()..padding(all: 20),
            child: Text(
              "DONE",
              style: TextStyle(
                color: bPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Center(
              child: Text(
                "Sorting",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: 35),
            Text(
              "Date",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: bPrimaryColor,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  "Ascending",
                  gesture: Gestures()
                    ..onTap(
                        () => setState(() => _dateAscending = !_dateAscending)),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background
                        .color(_dateAscending ? bPrimaryColor : bInactiveColor)
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                Txt(
                  "Descending",
                  gesture: Gestures()
                    ..onTap(
                        () => setState(() => _dateAscending = !_dateAscending)),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background
                        .color(!_dateAscending ? bPrimaryColor : bInactiveColor)
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                SizedBox(height: 25),
              ],
            ),
            SizedBox(height: 25),
            Text(
              "Popularity",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: bPrimaryColor,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  "Ascending",
                  gesture: Gestures()
                    ..onTap(() => setState(
                        () => _popularityAscending = !_popularityAscending)),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(
                        _popularityAscending ? bPrimaryColor : bInactiveColor)
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                Txt(
                  "Descending",
                  gesture: Gestures()
                    ..onTap(() => setState(
                        () => _popularityAscending = !_popularityAscending)),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(
                        !_popularityAscending ? bPrimaryColor : bInactiveColor)
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                SizedBox(height: 25),
              ],
            ),
            SizedBox(height: 25),
            Text(
              "Price",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: bPrimaryColor,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  "Ascending",
                  gesture: Gestures()
                    ..onTap(() =>
                        setState(() => _priceAscending = !_priceAscending)),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background
                        .color(_priceAscending ? bPrimaryColor : bInactiveColor)
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                Txt(
                  "Descending",
                  gesture: Gestures()
                    ..onTap(() =>
                        setState(() => _priceAscending = !_priceAscending)),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(
                        !_priceAscending ? bPrimaryColor : bInactiveColor)
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
