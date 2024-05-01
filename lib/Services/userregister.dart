import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserRegister {
  Future<http.Response> userRegister(String username, String email,
      String password, String confirmPassword) async {
    var uri = Uri.parse("http://localhost:7000/user/createuser");

    Map<String, String> header = {"Content-type": "application/json"};

    Map data = {
      'username': '$username',
      'email': '$email',
      'password': '$password',
      'confirmPassword': '$confirmPassword'
    };

    var body = json.encode(data);

    var response = await http.post(uri, headers: header, body: body);

    print("${response.body}");

    return response;
  }
}
