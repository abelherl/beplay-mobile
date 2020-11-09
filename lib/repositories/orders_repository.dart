import 'dart:convert';

import 'package:beplay/model/invoic/invoice_parent.dart';
import 'package:beplay/model/orders_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceRepository {
  static String urlGetOnGoingOrders = "https://damp-basin-32676.herokuapp.com/api/invoice/ongoing";
  static String urlGetHistoryOrders = "https://damp-basin-32676.herokuapp.com/api/invoice/history";
  static String urlGetInvoice="https://damp-basin-32676.herokuapp.com/api/invoice";
  static String urlPostInvoice= "https://damp-basin-32676.herokuapp.com/api/invoice";
  String _token;

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
  Future getDataInvoice()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    final response=await http.get(urlGetInvoice,headers: {
      'content-type': 'application/json',
      'authorization': 'Bearer $token'
    });

  }

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

}
