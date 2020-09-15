import 'dart:convert';

import 'package:beplay/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  var jsonResponse;
  String urlLogin = "https://damp-basin-32676.herokuapp.com/api/auth/login";
  String urlSignUp = "https://damp-basin-32676.herokuapp.com/api/auth/login";

  Future<UserLogin> login(UserLogin model) async {
    var response = await http.post(urlLogin, body: model.toJson());
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      print("json Response : $jsonResponse");
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return jsonResponse;
  }

  Future<UserModel> signUp(UserModel model) async {
    var client = http.Client();

    var jsonResponse;

    var response = await client.post(urlSignUp, body: model.toJson());
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      print("JSON RESPONSE : $jsonResponse");
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return jsonResponse;
  }
}
