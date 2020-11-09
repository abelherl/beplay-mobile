import 'dart:convert';

import 'package:beplay/model/classes.dart';
import 'package:beplay/model/classes2.dart';
import 'package:beplay/model/classes_parent.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:beplay/model/invoic/invoice_parent.dart';
import 'package:beplay/model/reviews/data.dart';
// import 'package:beplay/model/invoice/data.dart';
import 'package:beplay/model/reviews/reviews_parent.dart';
import 'package:beplay/pages/page_home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ClassRepository {
  var jsonResponse;
  String urlGetClass = "https://damp-basin-32676.herokuapp.com/api/kelas";
  String urlGetReviews = "https://damp-basin-32676.herokuapp.com/api/kelas/";
  String urlPostInvoice = "https://damp-basin-32676.herokuapp.com/api/invoice";
  String urlImageClass="http://damp-basin-32676.herokuapp.com/images/kelas/";


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

  Future postReviews(int id,Data reviewsParent)async{
    var client =http.Client();

    SharedPreferences pref = await SharedPreferences.getInstance();
    _token = pref.getString("token");

    var jsonResponse;
    final response= await client.post(urlGetReviews+'$id/review',headers: {
      'content-type': 'application/json',
      'authorization': 'Bearer $_token'
    },body: jsonEncode(reviewsParent));
    print(response.hashCode);
    print(response.toString());
    if(response.statusCode==200){
      setAccessToken(_token);
      jsonResponse=jsonDecode(response.body);

    }
  }
  Future postDataInvoice(Data_Invoice models)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    final response=await http.post(urlPostInvoice,headers: {
      'content-type': 'application/json',
      'authorization': 'Bearer $token',

    },body: jsonEncode(Data_Invoice(classModelId: models.classModelId,nominal: models.nominal,)));
    if(response.statusCode==200){
      setAccessToken(token);
      jsonDecode(response.body);
    }

  }
  Future<ReviewsParent> getReviews(int id) async {
    var client = http.Client();
    SharedPreferences pref = await SharedPreferences.getInstance();
    _token = pref.getString("token");

    var jsonResponse;

    var response = await client.get(urlGetReviews+'$id/review',headers: {
    'content-type': 'application/json',
    'authorization': 'Bearer $_token'
    },);
    print(response.statusCode);
    print(response.body);
    print(response.headers);
    if (response.statusCode == 200) {
      final prefix = 'ï»¿';
      var body = response.body;
      if (body.startsWith(prefix)) {
        body = body.substring(prefix.length);
      }
      jsonResponse = jsonDecode(body);
      print("JSON RESPONSE : $jsonResponse");

      return ReviewsParent.fromJsonMap(jsonResponse);
    } else {
      print('Request failed with status: ${response.reasonPhrase}.');
    }
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
