import 'dart:convert';

import 'package:beplay/model/classes.dart';
import 'package:beplay/model/classes_parent.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:beplay/model/reviews/reviews_parent.dart';
import 'package:http/http.dart' as http;

class ClassRepository {
  var jsonResponse;
  String urlGetClass = "https://damp-basin-32676.herokuapp.com/api/kelas";
  String urlGetReviews = "https://damp-basin-32676.herokuapp.com/api/kelas/";

  Future<ClassesParent> getClasses() async {
    var client = http.Client();

    var jsonResponse;

    var response = await client.get(urlGetClass);
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      print("JSON RESPONSE : $jsonResponse");
      return ClassesParent.fromJsonMap(jsonResponse);
    } else {
      print('Request failed with status: ${response.reasonPhrase}.');
    }
  }

  Future<ReviewsParent> getReviews(int id) async {
    var client = http.Client();

    var jsonResponse;

    var response = await client.get('$urlGetReviews$id/review');
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      print("JSON RESPONSE : $jsonResponse");
      return ReviewsParent.fromJsonMap(jsonResponse);
    } else {
      print('Request failed with status: ${response.reasonPhrase}.');
    }
  }
}
