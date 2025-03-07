import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpRequest {
  static Future<dynamic> post(String url, String requestData) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    dynamic result;
    await http
        .post(Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'token': token,
            },
            body: requestData)
        .then((response) {
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      result = responseJson;
      if (response.statusCode >= 400) {
        throw Exception(result["message"]);
      }
      if (response.headers['token'] != null) {
        prefs.setString('token', response.headers['token']!);
      }
    });
    return result;
  }

  static Future<dynamic> get(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    dynamic result;
    await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': token,
      },
    ).then((response) {
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      result = responseJson;
      if (response.statusCode >= 400) {
        throw Exception(result["message"]);
      }
      if (response.headers['token'] != null) {
        prefs.setString('token', response.headers['token']!);
      }
    });
    return result;
  }
}

class TranscationHttpRequest {

  Future<dynamic> post(Object rawData) async {
     final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    dynamic result;
    await http
        .post(Uri.parse("http://192.168.0.8:8080/eth/getEthTrade"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: utf8.encode(jsonEncode(rawData)))
        .then((response) {
      result = response;
    });
    return result;

  }

}

class AddAccountHttpRequest {

  Future<dynamic> post(Object rawData) async {
     final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    dynamic result;
    await http
        .post(Uri.parse("http://192.168.0.8:8080/eth/addAccount"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            )
        .then((response) {
      // ignore: unused_local_variable
      var responseJson = json.decode(utf8.decode(response.bodyBytes));

      result = responseJson;
    });
    return result;

  }

}

class GetAccountBalanceHttpRequest {

  Future<dynamic> post(Object rawData) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    dynamic result;
    await http
        .post(Uri.parse("http://192.168.0.8:8080/eth/getAccountBalance"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: utf8.encode(jsonEncode(rawData)))
        .then((response) {
      // ignore: avoid_print
      print(jsonEncode(response.body));
      // ignore: unused_local_variable
      var responseJson = json.decode(utf8.decode(response.bodyBytes));

      result = responseJson;
    });
    return result;

  }

}

class HttpURL {
  // static const String host = "https://vaulted-epigram-349713.de.r.appspot.com";
  static const String host = "https://backend-111406.onrender.com/api";
  // static const String host = "https://backend-111406.herokuapp.com/api";
}
