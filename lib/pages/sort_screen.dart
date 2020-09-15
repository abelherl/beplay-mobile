import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beplay/const.dart';

class SortScreen extends StatefulWidget {
  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  bool _dateAscending = false;
  bool _popularityAscending = false;
  bool _priceAscending = false;
  var _sortThis = '';

  void _onChanged(String type) {
    setState(() {
      _sortThis = type;
    });
  }

  void _onTap(String type) {
    if (type == _sortThis) {
      if (type == 'date') {
        setState(() => _dateAscending = !_dateAscending);
      }
      if (type == 'popularity') {
        setState(() => _popularityAscending = !_popularityAscending);
      }
      if (type == 'price') {
        setState(() => _priceAscending = !_priceAscending);
      }
    }
  }

  Color _isSortThis(String type, bool asc) {
    Color color = bInactiveColor;
    if (type == _sortThis) {
      if (type == 'date') {
        if (_dateAscending == asc) {
          color = bPrimaryColor;
        }
      }
      if (type == 'popularity') {
        if (_popularityAscending == asc) {
          color = bPrimaryColor;
        }
      }
      if (type == 'price') {
        if (_priceAscending == asc) {
          color = bPrimaryColor;
        }
      }
    }
    return color;
  }

  bool _isActive(String type) {
    bool active = false;
    if (type == _sortThis) {
      active = true;
    }
    return active;
  }

  final _list = ["Ascending", "Descending"];

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
            ..onTap(() { Navigator.pop(context); }),
          child: Icon(Icons.clear),
        ),
        actions: [
          Parent(
            gesture: Gestures()
              ..onTap(() {
                Navigator.pop(context);
              }),
            style: ParentStyle()
              ..padding(all: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: bPrimaryColor,
                  ),
                ),
                Switch(
                  value: _isActive('date'),
                  onChanged: (newValue) => _onChanged('date'),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  "Ascending",
                  gesture: Gestures()
                    ..onTap(() => _onTap('date')),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(_isSortThis('date', true))
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                Txt(
                  "Descending",
                  gesture: Gestures()
                    ..onTap(() => _onTap('date')),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(_isSortThis('date', false))
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                SizedBox(height: 25),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popularity",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: bPrimaryColor,
                  ),
                ),
                Switch(
                  value: _isActive('popularity'),
                  onChanged: (newValue) => _onChanged('popularity'),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  "Ascending",
                  gesture: Gestures()
                    ..onTap(() => _onTap('popularity')),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(_isSortThis('popularity', true))
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                Txt(
                  "Descending",
                  gesture: Gestures()
                    ..onTap(() => _onTap('popularity')),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(_isSortThis('popularity', false))
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                SizedBox(height: 25),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: bPrimaryColor,
                  ),
                ),
                Switch(
                  value: _isActive('price'),
                  onChanged: (newValue) => _onChanged('price'),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  "Ascending",
                  gesture: Gestures()
                    ..onTap(() => _onTap('price')),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(_isSortThis('price', true))
                    ..borderRadius(all: width)
                    ..textAlign.center()
                    ..bold()
                    ..ripple(true),
                ),
                Txt(
                  "Descending",
                  gesture: Gestures()
                    ..onTap(() => _onTap('price')),
                  style: TxtStyle()
                    ..width(width)
                    ..padding(all: 15)
                    ..textColor(Colors.white)
                    ..background.color(_isSortThis('price', false))
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
