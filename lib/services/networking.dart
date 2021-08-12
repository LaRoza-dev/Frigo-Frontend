import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'https://api.laroza.dev';

class Request {
  static void sendRequest(String endpoint, String method, String body) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(method, Uri.parse(baseUrl + endpoint));

    request.body = body;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

class User {
  User({required this.email, required this.password});

  final String email;
  final String password;

  void login() async {
    var reqBody = {};
    reqBody["email"] = email;
    reqBody["password"] = password;
    String str = json.encode(reqBody);
    Request.sendRequest('/login', 'POST', str);

    // var headers = {'Content-Type': 'application/json'};
    // var request = http.Request('POST', Uri.parse(baseUrl + '/login'));

    // request.body = json.encode({"email": email, "password": password});
    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }
  }
}
