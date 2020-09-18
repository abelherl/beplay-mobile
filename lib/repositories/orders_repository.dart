import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceRepository {
  static String urlGetOnGoingOrders =
      "https://damp-basin-32676.herokuapp.com/api/invoice/ongoing";
  static String urlGetHistoryOrders =
      "https://damp-basin-32676.herokuapp.com/api/invoice/history";

  getOrdersOnGoingData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    var jsonResponse;
    final response = await http.get(urlGetOnGoingOrders, headers: {
      'content-type': 'application/json',
      'authorization': 'Bearer $token'
    });
    jsonResponse = jsonDecode(response.body);
    if (response != null) {
      return jsonResponse;
    }
    return null;
  }

  getHistoryOrders() async {
    var jsonResponse;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    final response = await http.get(urlGetHistoryOrders, headers: {
      'content-type': 'application/json',
      'authorization': 'Bearer $token'
    });
    jsonResponse = jsonDecode(response.body);
    if (response != null) {
      return jsonResponse;
    }
    return null;
  }
}
