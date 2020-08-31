import 'package:flutter/cupertino.dart';

class ReviewsDance {
  final String name;
  final String description;
  final double rating;
  final String imageProfile;

  ReviewsDance(
      {@required this.rating,
      @required this.description,
      @required this.name,
      @required this.imageProfile});
}
