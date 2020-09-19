import 'dart:convert';

import 'package:beplay/model/classes.dart';
import 'package:beplay/model/classes_parent.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:beplay/model/invoice/data.dart';
import 'package:beplay/model/reviews/reviews_parent.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ClassRepository {
  var jsonResponse;
  String urlGetClass = "https://damp-basin-32676.herokuapp.com/api/kelas";
  String urlGetReviews = "https://damp-basin-32676.herokuapp.com/api/kelas/";
  String urlPostInvoice = "https://damp-basin-32676.herokuapp.com/api/invoice";

  var _headers = {'content-type': 'application/json'};
  String _token;

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

  postInvoice(DataInvoice model) async {
    final response =
    await http.post(urlPostInvoice, headers: _headers, body: jsonEncode(model));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  setAccessToken(String token) async {
    _token = token;

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (await pref.setString("token", token)) {
        return true;
      }
    } catch (e) {}

    return null;
  }

  setNameTemporary(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('name', name);
  }
}
