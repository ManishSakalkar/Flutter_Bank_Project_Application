import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class cashwithdraw {
  Future<http.Response> cashWithdraw(
      int accountId, double transactionAmount) async {
    var uri = Uri.parse("http://localhost:6000/transaction/debit");

    Map<String, String> header = {"Content-type": "application/json"};

    Map data = {
      'accountId': '$accountId',
      'transactionAmount': '$transactionAmount',
    };

    var body = json.encode(data);

    var response = await http.post(uri, headers: header, body: body);

    print("${response.body}");

    return response;
  }
}
