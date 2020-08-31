import 'package:beplay/model/reviews.dart';
import 'package:flutter/cupertino.dart';

class DanceModel {
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
  final Function onPressed;

  DanceModel(
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
}
