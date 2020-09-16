import 'dart:convert';

import 'package:beplay/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static String urlLogin =
      "https://damp-basin-32676.herokuapp.com/api/auth/login";
  static String urlSignUp =
      "https://damp-basin-32676.herokuapp.com/api/auth/register";

  var _headers = {'content-type': 'application/json'};
  // ignore: unused_field
  String _token;

  login(UserLogin model) async {
    final response =
        await http.post(urlLogin, headers: _headers, body: jsonEncode(model));
    print(response.statusCode);
    var decodeData = jsonDecode(response.body);
    String token = decodeData["data"]["token"];
    if (response.statusCode == 200) {
      setAccessToken(token);
      return jsonDecode(response.body);
    }
    return null;
  }

  register(UserRegister model) async {
    final response =
        await http.post(urlSignUp, headers: _headers, body: jsonEncode(model));
    print(response.statusCode);
    var decodeData = jsonDecode(response.body);
    String token = decodeData["data"]["token"];
    if (response.statusCode == 200) {
      setAccessToken(token);
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

  checkAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("token")) {
      _token = pref.getString("token");
      return true;
    }

    return null;
  }

  removeAccessToken() async {
    _token = null;
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.containsKey("token")) {
        await pref.remove("token");
        return true;
      }
    } catch (e) {}

    return null;
  }
}
