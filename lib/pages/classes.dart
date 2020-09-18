import 'package:beplay/bloc/class/class_bloc.dart';
import 'package:beplay/components/class_class.dart';
import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/model/classes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beplay/const.dart';
import 'package:beplay/data_dummy.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:beplay/pages/detail_dance.dart';
import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ClassesScreen extends StatefulWidget {
  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
//  Map data = {};
  List<Classes> classes = [];
  PageController pageController = PageController(viewportFraction: 0.8);

  void init() async {
    context.bloc<ClassBloc>().add(GetClass());
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
//    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: MainAppBar(
        title: 'Dance',
        filterIconEnabled: true,
        cartIconEnabled: true,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<ClassBloc, ClassState> (
        builder: (context, state) {
          if (state is ClassSuccess) {
            classes = state.models;
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Popular Classes",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Parent(
                      style: ParentStyle()
                        ..width(size.width)
                        ..height(size.height / 3.5)
                        ..minHeight(210),
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        controller: pageController,
                        children: classes
                            .map((item) => PopularClass(
                          item: item,
                        ))
                            .toList(),
                      )),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    physics: NeverScrollableScrollPhysics(),
                    children: classes.map((item) {
                      return ClassClass(
                        item: item,
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class PopularClass extends StatefulWidget {
  const PopularClass({Key key, @required this.item}) : super(key: key);

  final Classes item;

  @override
  _PopularClassState createState() => _PopularClassState();
}

class _PopularClassState extends State<PopularClass> {
  var pressed = false;
  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()
        ..isTap((isTapped) => setState(() => pressed = isTapped))
        ..onTap(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailDance(danceModel: widget.item);
          }));
        }),
      style: ParentStyle()
        ..width(300)
        ..margin(right: 20, top: 20)
        ..background.color(bBackgroundColor)
        ..ripple(true, splashColor: bPrimaryColor)
//      ..elevation(pressed ? 0 : 15, opacity: 0.8)
        ..scale(pressed ? 0.93 : 1)
        ..animate(400, Curves.easeOutQuart)
        ..background.image(url: widget.item.images, fit: BoxFit.cover)
        ..borderRadius(all: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black38),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.nama,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                Text(
                  "25 Slots",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
              "Digital Class",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.item.tempat,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.item.trainer.nama,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 2,
                ),
                SvgPicture.asset(
                  "icons/clarity_date-solid.svg",
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '28 January 2021',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            Expanded(
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmoothStarRating(
                          rating: 4.5,
                          isReadOnly: true,
                          color: Colors.white,
                          borderColor: Colors.white,
                          size: 17,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${widget.item.level}',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          "Rp. 200.000",
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
