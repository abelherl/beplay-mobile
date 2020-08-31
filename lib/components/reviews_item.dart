import 'package:flutter/material.dart';

class ReviewsItem extends StatelessWidget {
  final String images;
  final String nameReview;
  final double rating;
  final String descriptions;

  ReviewsItem(
      {@required this.images,
      @required this.rating,
      @required this.descriptions,
      @required this.nameReview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.orange),
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 4.5,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(images)),
                    borderRadius: BorderRadius.all(Radius.circular(64))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      nameReview,
                      textWidthBasis: TextWidthBasis.parent,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: FittedBox(
                            child: Text(
                          descriptions,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textWidthBasis: TextWidthBasis.parent,
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ))),
                  ),
                  Row(
                    children: [
//                      RatingBar.readOnly(
//                        filledIcon: Icons.star,
//                        emptyIcon: Icons.star_border,
//                        emptyColor: Colors.yellow,
//                        filledColor: Colors.yellow,
//                        initialRating: rating,
//                        size: 12,
//                      ),
                      Text(
                        '( $rating )',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
