import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class createaccount {
  Future<http.Response> createAccount(
      String accountHolderName, String mobileNumber, String address) async {
    var uri = Uri.parse("http://localhost:9000/account/createaccount");

    Map<String, String> header = {"Content-type": "application/json"};

    Map data = {
      'accountHolderName': '$accountHolderName',
      'mobileNumber': '$mobileNumber',
      'address': '$address',
    };

    var body = json.encode(data);

    var response = await http.post(uri, headers: header, body: body);

    print("${response.body}");

    return response;
  }
}
