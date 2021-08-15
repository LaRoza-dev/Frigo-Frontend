import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:fridge/constants.dart';

var dio = Dio();
var options = BaseOptions(
  baseUrl: 'https://api.laroza.dev',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
// const String baseUrl = 'https://api.laroza.dev';

class User extends ChangeNotifier {
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

  Future<String?> login() async {
    var reqBody = {"email": email, "password": password};

    var response = await dio.post('/login', data: reqBody);

    Map<String, dynamic> decodedRes = json.decode(response.data.toString());

    final String? value = decodedRes["access_token"];
    final String key = 'token';
    await kStorage.write(key: key, value: value);

    final String? testRes = await kStorage.read(key: key);

    return (testRes);
  }

  Future<void> logout() async {
    await kStorage.delete(key: "token");
    print('logged out');
  }

  Future<String?> getToken() async {
    String? token = await kStorage.read(key: "token");
    token = token;
    return token;
  }
}
