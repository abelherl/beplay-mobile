import 'package:beplay/bloc/class/class_bloc.dart';
import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/const.dart';
import 'package:beplay/data_dummy.dart';
import 'package:beplay/model/classes2.dart';
import 'package:beplay/model/quick_feedback_item.dart';
import 'package:beplay/model/reviews/data.dart';
import 'package:beplay/model/reviews/reviews_parent.dart';
import 'package:beplay/pages/payment_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({Key key, @required this.danceModel}) : super(key: key);
  final Classes2 danceModel;

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState(danceModel);
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  _FeedbackScreenState(this.danceModel);
  Classes2 danceModel;
  Data reviewsParent;
  double ratingGives=0;


  final _feedback = TextEditingController();
  List<String> selected = [];

  String fullFeedback() {
    var fullFeedback = _feedback.text;

    if (fullFeedback != '' && selected.length > 0) {
      fullFeedback = fullFeedback + "\n\n";
    }

    if (selected.length > 0) {
      fullFeedback = fullFeedback + "This course is: ";

      selected.forEach((feedback) {
        fullFeedback = fullFeedback + feedback + ", ";
      });

      fullFeedback = fullFeedback.substring(0, fullFeedback.length - 2);
    }

    return fullFeedback;
  }

  @override
  void initState() {
    super.initState();
    selected = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: danceModel.nama,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            SmoothStarRating(
              rating: ratingGives,
              isReadOnly: false,
              color: bPrimaryColor,
              borderColor: bPrimaryColor,
              size: 50,
              spacing: 15,
            ),
            SizedBox(height: 15,),
            Theme(
              data: ThemeData(
                accentColor: bPrimaryColor,
              ),
              child: Column(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Checkbox(
                        value: quickFeedback[0].status,
                        onChanged: (newValue) => setState(() {
                          quickFeedback[0].status = newValue;
                          if (newValue) {
                            selected.add(quickFeedback[0].title);
                            print(selected);
                          }
                          else {
                            selected.remove(quickFeedback[0].title);
                          }
                        }),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(quickFeedback[0].title),
                      ),
                      Checkbox(
                        value: quickFeedback[1].status,
                        onChanged: (newValue) => setState(() {
                          quickFeedback[1].status = newValue;
                          if (newValue) {
                            selected.add(quickFeedback[1].title);
                          }
                          else {
                            selected.remove(quickFeedback[1].title);
                          }
                        }),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(quickFeedback[1].title),
                      ),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Checkbox(
                        value: quickFeedback[2].status,
                        onChanged: (newValue) => setState(() {
                          quickFeedback[2].status = newValue;
                          if (newValue) {
                            selected.add(quickFeedback[2].title);
                          }
                          else {
                            selected.remove(quickFeedback[2].title);
                          }
                        }),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(quickFeedback[2].title),
                      ),
                      Checkbox(
                        value: quickFeedback[3].status,
                        onChanged: (newValue) => setState(() {
                          quickFeedback[3].status = newValue;
                          if (newValue) {
                            selected.add(quickFeedback[3].title);
                          }
                          else {
                            selected.remove(quickFeedback[3].title);
                          }
                        }),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(quickFeedback[3].title),
                      ),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Checkbox(
                        value: quickFeedback[4].status,
                        onChanged: (newValue) => setState(() {
                          quickFeedback[4].status = newValue;
                          if (newValue) {
                            selected.add(quickFeedback[4].title);
                          }
                          else {
                            selected.remove(quickFeedback[4].title);
                          }
                        }),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(quickFeedback[4].title),
                      ),
                      Checkbox(
                        value: quickFeedback[5].status,
                        onChanged: (newValue) => setState(() {
                          quickFeedback[5].status = newValue;
                          if (newValue) {
                            selected.add(quickFeedback[5].title);
                          }
                          else {
                            selected.remove(quickFeedback[5].title);
                          }
                        }),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(quickFeedback[5].title),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Parent(
              style: ParentStyle()
                ..height(175)
                ..padding(all: 15, top: 5)
                ..borderRadius(all: 20)
                ..alignmentContent.topRight()
                ..border(all: 2, color: bInactiveColor),
              child: TextField(
                controller: _feedback,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Enter your feedback",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            Txt(
              'SUBMIT',
              gesture: Gestures()
                ..onTap(() {
                  print(fullFeedback());
                  reviewsParent= Data(kelas_id: danceModel.id,rating: ratingGives.toInt(),text: fullFeedback());
                  context.bloc<ClassBloc>().add(PostReviews(model: reviewsParent,id: danceModel.id));
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaymentScreen(success: true,);
                  }));
                }),
              style: TxtStyle()
                ..width(double.infinity)
                ..background.color(bPrimaryColor)
                ..alignmentContent.center()
                ..textColor(Colors.white)
                ..bold()
                ..fontSize(16)
                ..padding(all: 20)
                ..borderRadius(all: 100),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

//class QuickFeedbackCheckbox extends StatefulWidget {
//  QuickFeedbackCheckbox(this.feedback);
//  final QuickFeedbackItem feedback;
//
//  @override
//  _QuickFeedbackCheckboxState createState() => _QuickFeedbackCheckboxState(feedback);
//}
//
//class _QuickFeedbackCheckboxState extends State<QuickFeedbackCheckbox> {
//  _QuickFeedbackCheckboxState(this.feedback);
//  final QuickFeedbackItem feedback;
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: [
//        Checkbox(
//          value: feedback.status,
//          onChanged: (newValue) => setState(() {
//            feedback.status = newValue;
//            if (newValue) {
//              selected.add(quickFeedback[0].title);
//            }
//            else {
//              selected.remove(quickFeedback[0].title);
//            }
//          }),
//        ),
//        Expanded(
//          flex: 1,
//          child: Text(quickFeedback[0].title),
//        ),
//      ],
//    );
//  }
//}
