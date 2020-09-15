import 'dart:convert';

import 'package:beplay/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  // Dio dio = new Dio();
  // Response response;
  String urlLogin = "https://damp-basin-32676.herokuapp.com/api/auth/login";
  String urlSignUp = "https://damp-basin-32676.herokuapp.com/api/auth/login";

  // ignore: missing_return
  Future<UserLogin> login(UserLogin model) async {
    // FormData data = FormData.fromMap({
    //   'email': model.email,
    //   'password': model.password,
    // });
    // response = await dio.post(urlLogin, data: data);
    // UserModel models = UserModel.fromJson(response.data);
    var jsonResponse;
    var response = await http.post(urlLogin, body: model.toJson());
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return jsonResponse;
  }

  Future<UserModel> signUp(UserModel model) async {
    // FormData data = FormData.fromMap({
    //   'nama': model.nama,
    //   'email': model.email,
    //   'password': model.password,
    //   'password_confirmation': model.passwordConfirmation,
    // });
    // response = await dio.post(urlSignUp, data: data);
    // UserModel models = UserModel.fromJson(response.data);
    var client = http.Client();

    var jsonResponse;

    var response = await client.post(urlSignUp, body: model.toJson());
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return jsonResponse;
  }
}
