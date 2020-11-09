import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AgendaRepository {
  static String urlGetAgenda =
      "https://damp-basin-32676.herokuapp.com/api/agenda";
  getAgendaData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    final response = await http.get(urlGetAgenda, headers: {
      'content-type': 'application/json',
      'authorization': 'Bearer $token'
    });
    var jsonResponse = jsonDecode(response.body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
    return null;
  }
}
