import 'package:beplay/const.dart';
import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var selectedClassType = 'Digital';
  var selectedDate = DateTime.now();
  var selectedLocation = 'Malang';
  var selectedLevel = 'Beginner';

  var isClassDigital = true;

  bool isLocationSelected(String location) {
    if (location == selectedLocation) {
      return true;
    }
    return false;
  }

  bool isLevelSelected(String level) {
    if (level == selectedLevel) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 3 - 25;

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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Filter",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: 35),
            Text(
              "Class Type",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: bPrimaryColor,
              ),
            ),
            SizedBox(height: 15),
            Parent(
              style: ParentStyle()
                ..width(double.infinity)
                ..padding(left: 20, right: 5)
                ..borderRadius(all: 25)
                ..elevation(3, opacity: 0.5)
                ..background.color(Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedClassType, style: TextStyle(fontSize: 16),),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return classTypes.map((item) {
                        return PopupMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList();
                    },
                    onSelected: (selected) => onSelectedDropdown(selected),
                    icon: Icon(Icons.keyboard_arrow_down, color: bDarkTextColor,),
                  ),
                ],
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
            Parent(
              style: ParentStyle()
                ..padding(all: 15, bottom: 0)
                ..background.color(bBackgroundColor)
                ..borderRadius(all: 15),
              child: Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: bPrimaryColor,
                  accentColor: bPrimaryColor,
                  colorScheme: ColorScheme.light(primary: bPrimaryColor),
                  buttonTheme: ButtonThemeData(
                      textTheme: ButtonTextTheme.primary
                  ),
                ),
                child: CalendarDatePicker(
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2035, 1),
                  initialDate: selectedDate,
                  onDateChanged: (date) {
                    setState(() => selectedDate = date);
                  },
                ),
              ),
            ),
            SizedBox(height: !isClassDigital ? 35 : 0),
            Text(
              "Location",
              style: TextStyle(
                fontSize: !isClassDigital ? 20 : 0,
                fontWeight: FontWeight.w800,
                color: bPrimaryColor,
              ),
            ),
            SizedBox(height: !isClassDigital ? 25 : 0),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: locations.map((location) {
                return Txt(
                  location,
                  gesture: Gestures()
                    ..onTap(() => onSelectedLocation(location)),
                  style: TxtStyle()
                    ..width(width)
                    ..height(!isClassDigital ? 40 : 0)
                    ..textColor(Colors.white)
                    ..background.color(isLocationSelected(location) ? bPrimaryColor : bInactiveColor)
                    ..borderRadius(all: width)
                    ..alignmentContent.center()
                    ..bold()
                    ..ripple(true, splashColor: bPrimaryLightColor),
                );
              }).toList(),
            ),
            SizedBox(height: !isClassDigital ? 35 : 25),
            Text(
              "Levels",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: bPrimaryColor,
              ),
            ),
            SizedBox(height: 25),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: levels.map((level) {
                return Txt(
                  level,
                  gesture: Gestures()
                    ..onTap(() => onSelectedLevel(level)),
                  style: TxtStyle()
                    ..width(width)
                    ..height(40)
                    ..textColor(Colors.white)
                    ..background.color(isLevelSelected(level) ? bPrimaryColor : bInactiveColor)
                    ..borderRadius(all: width)
                    ..alignmentContent.center()
                    ..bold()
                    ..ripple(true, splashColor: bPrimaryLightColor),
                );
              }).toList(),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  void onSelectedDropdown(String selected) {
    setState(() => selectedClassType = selected);
    var newBool = false;
    if (selectedClassType == 'Digital') {
      newBool = true;
    }
    setState(() => isClassDigital = newBool);
  }

  void onSelectedLocation(String location) {
    setState(() => selectedLocation = location);
  }

  void onSelectedLevel(String level) {
    setState(() => selectedLevel = level);
  }
}
