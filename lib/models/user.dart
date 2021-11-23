import 'dart:convert';
import 'dart:io' show Platform;
import 'package:get/get_connect/connect.dart';
import 'package:Frigo/constants.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

enum googleLoginStatus { loggedIn, error, cancelled }

bool isIos = Platform.isIOS;

class User extends GetConnect {
  User(
      {this.email,
      this.password,
      this.fullname,
      this.fridge,
      this.gender,
      this.birthdate});

  String? id = "";
  String? fullname = "";
  String? email = "";
  String? password = "";
  List? fridge = [];
  String? baseUrl = "https://api.laroza.dev";
  String? birthdate;
  String? gender;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    email = json['email'];
    fridge = json['fridge'];
  }

  @override
  String toString() => "User:,$id, $fullname, $email ,$birthdate ,$gender";

  GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId: !kIsWeb && isIos
          ? "${dotenv.env['IOS_CLIENT_ID']}"
          : "${dotenv.env['CLIENT_ID']}");

  Future<googleLoginStatus?> handleSignIn() async {
    try {
      print(Platform.operatingSystem);
      GoogleSignInAccount? res = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleKey = await res?.authentication;
      String? token = googleKey?.idToken.toString();
      var response = await post('/google/', jsonEncode(token));
      print(response.body);

      if (response.body["access_token"] != null) {
        String? value = response.body["access_token"].toString();
        String key = 'token';
        await kStorage.write(key, value);

        return googleLoginStatus.loggedIn;
      } else {
        return googleLoginStatus.error;
      }
    } catch (err) {
      print(err);
      return googleLoginStatus.error;
    }
  }

  Future<GoogleSignInAccount?> handleSignOut() async {
    kStorage.remove("token");
    print('logged out');
    return _googleSignIn.disconnect();
  }

  Future<bool> login(email, password) async {
    var reqBody = {"email": email, "password": password};
    var response = await post("/login", reqBody);

    if (response.statusCode == 200) {
      Map<dynamic, dynamic> decodedRes = response.body;
      final String? value = decodedRes["access_token"];
      final String key = 'token';
      await kStorage.write(key, value);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signup(email, password, fullName) async {
    var reqBody = {"fullname": fullname, "email": email, "password": password};
    var response = await post('/register', reqBody);
    if (response.body["message"] == "User added successfully.") {
      return true;
    } else {
      return false;
    }
  }

  Future<User> getMe({tokenStr}) async {
    String token = await getToken() ?? tokenStr ?? '';
    var response =
        await get("/users/me", headers: {'Authorization': 'Bearer ' + token});

    var res = response.body["data"][0];

    User user = User.fromJson(res);

    return user;
  }

  Future<void> logout() async {
    kStorage.remove("token");
    print('logged out');
  }

  Future<String?> getToken() async {
    return kStorage.read("token");
  }
}
