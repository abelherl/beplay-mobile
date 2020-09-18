import 'package:beplay/bloc/class/class_bloc.dart';
import 'package:beplay/const.dart';
import 'package:beplay/data_dummy.dart';
import 'package:beplay/model/classes2.dart';
import 'package:beplay/model/reviews.dart';
import 'package:beplay/model/reviews/data.dart';
import 'package:beplay/pages/checkout_screen.dart';
import 'package:beplay/pages/feedback_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'cart_screen.dart';
import 'package:bloc/bloc.dart';

class DetailDance extends StatefulWidget {
  DetailDance({Key key, @required this.danceModel}) : super(key: key);
  final Classes2 danceModel;

  @override
  _DetailDanceState createState() => _DetailDanceState(danceModel);
}

class _DetailDanceState extends State<DetailDance> {
  _DetailDanceState(this.danceModel);
  Classes2 danceModel;
  List<Data> danceReviews;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.bloc<ClassBloc>().add(GetReviews(id: danceModel.id));
  }

  String getType() {
    String type = 'Private Class';
    if (widget.danceModel.tipe == 1) {
      type = 'Studio Class';
    }
    if (widget.danceModel.tipe == 2) {
      type = 'Digital Class';
    }
    return type;
  }

  String getLevel() {
    String type = 'Advanced';
    if (widget.danceModel.tipe == 1) {
      type = 'Beginner';
    }
    if (widget.danceModel.tipe == 2) {
      type = 'Intermediate';
    }
    return type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<ClassBloc, ClassState> (
        listener: (context, state) {
          if (state is ReviewsSuccess) {
            setState(() => danceReviews = state.models);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Parent(
                style: ParentStyle()
                  ..height(MediaQuery.of(context).size.height / 3 * 2)
                  ..minHeight(230)
                  ..maxHeight(700),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      children: [
                        Image(
                          image: NetworkImage(danceModel.image),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: NetworkImage(
                              "https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2000723699664/Erna-Dance-Studio-Gedung-Ethnic-465a4671-b4ca-437f-99db-0ab9658bc9d0.jpeg"),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: NetworkImage(
                              "https://www.buffalo.edu/content/www/recreation/services/fitness/dance-studio-space-request/_jcr_content/par/image.img.447.auto.jpg/1522170576729.jpg"),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: NetworkImage(
                              "https://www.ci.campbell.ca.us/ImageRepository/Document?documentID=12880"),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: NetworkImage(
                              "https://thumbs.dreamstime.com/b/seven-ballerinas-ballet-bar-thr-rack-rehearsal-hall-theater-73416319.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height / 8,
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 5,
                        effect: WormEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          radius: 6,
                          spacing: 7,
                          dotColor: Colors.white,
                          activeDotColor: bPrimaryColor,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        child: Parent(
                          style: ParentStyle()
                            ..height(kToolbarHeight + 45)
                            ..width(MediaQuery.of(context).size.width)
                            ..linearGradient(
                                colors: [Colors.black54, Colors.transparent],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Parent(
                                  gesture: Gestures()
                                    ..onTap(() => Navigator.pop(context)),
                                  style: ParentStyle()..padding(left: 15),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0, -40, 0),
                child: Parent(
                  style: ParentStyle()
                    ..padding(horizontal: 20)
                    ..borderRadius(topRight: 40, topLeft: 40)
                    ..background.color(Colors.white),
                  child: Container(
                    transform: Matrix4.translationValues(0, -25, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Parent(
                          gesture: Gestures()..onTap(() {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                              return CheckoutScreen(item: widget.danceModel,);
                            }));
                          }),
                          style: ParentStyle()
                            ..alignment.centerRight()
                            ..margin(right: 20)
                            ..padding(vertical: 15, horizontal: 25)
                            ..elevation(5, opacity: .6)
                            ..background.color(bPrimaryColor)
                            ..borderRadius(all: 25),
                          child: Text(
                            'JOIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                danceModel.nama,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "25 Slots",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          getType(),
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "icons/entypo_price-tag.svg",
                              height: 23,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Rp. 200.000",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: bPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "icons/ant-design_fire-filled.svg",
                              height: 23,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Difficulty",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          getLevel(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "icons/clarity_date-solid.svg",
                              height: 23,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Schedule",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.danceModel.session[0].tanggal,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: bInactiveColor,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "icons/bi_person-fill.svg",
                              height: 23,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Trainer",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  'https://pickaface.net/gallery/avatar/unr_random_160817_0304_2mvqp69.png'),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  danceModel.trainer.nama,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: bPrimaryColor),
                                ),
                                Text(
                                  "Professional Zumba Trainer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: bInactiveColor,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "icons/ic_baseline-place.svg",
                              height: 23,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Place",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          danceModel.tempat,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: bInactiveColor,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "icons/ic_baseline-rate-review.svg",
                              height: 23,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Reviews",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return FeedbackScreen(danceModel: danceModel);
                              }
                            ));
                          },
                          child: Row(
                            children: [
                              Text(
                                "Give a feedback",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: bPrimaryColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: bPrimaryColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SmoothStarRating(
                              rating: 4.5,
                              isReadOnly: true,
                              color: bPrimaryColor,
                              borderColor: bPrimaryColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "4",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: bDarkTextColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " /5",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: bLightTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<ClassBloc, ClassState>(
                          builder: (context, state) {
                            if (state is ReviewsSuccess) {
                              return  ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: danceReviews.map((item) {
                                  return Parent(
                                    style: ParentStyle()..padding(top: 10, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundColor: bPrimaryColor,
                                            ),
                                            SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.customer.nama,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: bDarkTextColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  item.created_at,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        SmoothStarRating(
                                          rating: item.rating.toDouble(),
                                          isReadOnly: true,
                                          color: bPrimaryColor,
                                          borderColor: bPrimaryColor,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          item.text,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              );
                            }
                            else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
