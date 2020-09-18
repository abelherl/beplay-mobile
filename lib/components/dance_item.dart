import 'package:beplay/model/classes.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:beplay/model/reviews.dart';
import 'package:beplay/pages/detail_dance.dart';
import 'package:flutter/material.dart';

class DanceItem extends StatelessWidget {
  final String title;
  final String description;
  final double rating;
  final String date;
  final String time;
  final String place;
  final String author;
  final String skill;
  final String images;
  final List<List<ReviewsDance>> reviewDances;
  final Classes onPressed;

  DanceItem(
      {@required this.rating,
      @required this.title,
      @required this.author,
      @required this.time,
      @required this.date,
      @required this.description,
      @required this.place,
      @required this.skill,
      @required this.images,
      @required this.reviewDances,
      @required this.onPressed});

  void selectedDance(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailDance(
                  danceModel: onPressed,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          selectedDance(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            border: Border.all(width: 1.0, color: Colors.orange),
          ),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: NetworkImage(images))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      date,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      time,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(place),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(author),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(skill),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
//                    child: RatingBar.readOnly(
//                      filledIcon: Icons.star,
//                      emptyIcon: Icons.star_border,
//                      filledColor: Colors.yellow,
//                      emptyColor: Colors.yellow,
//                      initialRating: rating,
//                      size: 14,
//                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
