import 'dart:convert';

import 'package:beplay/model/classes.dart';
import 'package:beplay/model/dancemodel.dart';
import 'package:http/http.dart' as http;

class ClassRepository {
  var jsonResponse;
  String urlGetClass = "https://damp-basin-32676.herokuapp.com/api/kelas";

  Future<Map> getClasses() async {
    var client = http.Client();

    var jsonResponse;

    var response = await client.get(urlGetClass);
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      print("JSON RESPONSE : $jsonResponse");
    } else {
      print('Request failed with status: ${response.reasonPhrase}.');
    }
    return jsonResponse;
  }
}
