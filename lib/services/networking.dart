import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String baseUrl = 'https://api.laroza.dev';
final _storage = FlutterSecureStorage();

class Request {
  static Future<String> test() async {
    return "Hola";
  }

  static Future<String?> sendRequest(
      String endpoint, String method, String body) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(method, Uri.parse(baseUrl + endpoint));

    request.body = body;
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return Future.error(response.reasonPhrase.toString());
    }
  }
}

class User extends ChangeNotifier {
  // User({this.email = '', this.password = ''});

  String? email = "";
  void setEmail(newEmail) {
    email = newEmail;
    notifyListeners();
  }

  String? password = "";
  void setPassword(newPassword) {
    password = newPassword;
    notifyListeners();
  }

  String? token = "";
  void setToken(newToken) {
    token = newToken;
    notifyListeners();
  }

  Future<String?> login() async {
    var reqBody = {"email": email, "password": password};
    String str = json.encode(reqBody);
    // try {

    var result = await Request.sendRequest('/login', 'POST', str);

    Map<String, dynamic> decodedRes = json.decode(result!);

    final String? value = decodedRes["access_token"];
    final String key = 'token';
    await _storage.write(key: key, value: value);

    final String? testRes = await _storage.read(key: key);

    return (testRes);
  }

  Future<void> logout() async {
    await _storage.delete(key: "token");
    setToken("");
    print('logged out');
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: "token");
    token = token;
    return token;
  }
}

class Recipe {}
