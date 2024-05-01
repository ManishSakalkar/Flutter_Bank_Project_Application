import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Login {
  Future<http.Response> login(String username, String password) async {
    var uri = Uri.parse("http://localhost:4000/loginservice/login");

    Map<String, String> header = {"Content-type": "application/json"};

    Map data = {
      'username': '$username',
      'password': '$password',
    };

    var body = json.encode(data);

    var response = await http.post(uri, headers: header, body: body);

    print("${response.body}");

    return response;
  }
}
