import 'dart:convert';

import 'package:beplay/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInWithGoogleFailure implements Exception {}

class UserRepository {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  static String urlLogin =
      "https://damp-basin-32676.herokuapp.com/api/auth/login";
  static String urlSignUp =
      "https://damp-basin-32676.herokuapp.com/api/auth/register";
  static String urlLogOut =
      "https://damp-basin-32676.herokuapp.com/api/auth/logout";
  static String urlUpdateUser =
      "https://damp-basin-32676.herokuapp.com/api/auth";
  static String urlUpdatePassword =
      "https://damp-basin-32676.herokuapp.com/api/auth/password";

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
      setNameTemporary(decodeData['data']['user']['username']);
      return jsonDecode(response.body);
    }
    return null;
  }

   register(UserRegister model) async {
    final response =
        await http.post(urlSignUp, headers: _headers, body: jsonEncode(model));
    var decodeData = jsonDecode(response.body);
    String token = decodeData["data"]["token"];
    if (response.statusCode == 200) {
      setAccessToken(token);
      setNameTemporary(decodeData['data']['user']['username']);
      return jsonDecode(response.body);
    }
    return null;
  }

   logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _token = pref.getString("token");

    final response = await http.post(urlLogOut, headers: {
      'content-type': 'application/json',
      'authorization': 'Bearer $_token'
    });

    var decodeResponse = jsonDecode(response.body);
    if (decodeResponse['success'] == true) {
      removeAccessToken();
    }
    return jsonDecode(response.body);
  }

  Future<void> logoutGoogle()async{
    try{Future.wait([googleSignIn.signOut()]);}
    on Exception catch(e){
      print(e.hashCode);

    }
  }
  Future<void> loginGoogle()async{
    try {
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
    } on Exception {
      throw LogInWithGoogleFailure();
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

   updateUserData(Map<String, dynamic> data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _token = pref.getString("token");
    var encodeData = jsonEncode(data);
    final response = await http.put(urlUpdateUser,
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $_token'
        },
        body: encodeData);
    var decodeResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setNameTemporary(data["nama"]);
      return decodeResponse;
    }
    return null;
  }

   updateUserPassword(Map<String, dynamic> data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _token = pref.getString("token");
    var encodeData = jsonEncode(data);
    final response = await http.put(urlUpdatePassword,
        headers: {
          'content-type': 'application/json',
          'authorization': 'Bearer $_token'
        },
        body: encodeData);
    var decodeResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decodeResponse;
    }
    return null;
  }

}



