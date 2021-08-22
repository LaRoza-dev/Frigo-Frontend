import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum googleLoginStatus { loggedIn, error, cancelled }

class User extends GetConnect {
  User({this.email, this.password, this.fullname});

  String? fullname = "";
  String? email = "";
  String? password = "";
  String? baseUrl = "https://api.laroza.dev";

  GoogleSignIn _googleSignIn =
      GoogleSignIn(clientId: "${dotenv.env['CLIENT_ID']}");

  Future<googleLoginStatus?> handleSignIn() async {
    try {
      GoogleSignInAccount? res = await _googleSignIn.signIn();
      print("ok");
      GoogleSignInAuthentication? googleKey = await res?.authentication;
      String? token = googleKey?.idToken.toString();
      var response = await post('/google/', jsonEncode(token));

      if (response.body["access_token"] != null) {
        String? value = response.body["access_token"].toString();
        String key = 'token';
        await kStorage.write(key, value);

        String? testRes = kStorage.read<String?>(key);
        print(testRes);
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

//TODO: need to get respongse code, not body.
    if (response.body["code"] == 404) {
      return false;
    } else {
      Map<dynamic, dynamic> decodedRes = response.body;

      final String? value = decodedRes["access_token"];
      final String key = 'token';
      await kStorage.write(key, value);

      final String? testRes = kStorage.read<String?>(key);
      print(testRes);
      return true;
    }
  }

  Future<bool> signup(email, password, fullName) async {
    var reqBody = {"fullname": fullname, "email": email, "password": password};
    var response = await post('/register', reqBody);
    if (response.body["message"] == "User added successfully.") {
      // print(response.bodyString);
      return true;
    }
    // Map<dynamic, dynamic> decodedRes = response.body["data"][0];

    // final String? value = decodedRes["access_token"];
    // final String key = 'token';

    // await kStorage.write(key, value);

    // //TODO: it can be removed (or changed with a proper result)
    // final String? testRes = kStorage.read<String?>(key);

    // print(testRes);
    else {
      return false;
    }
  }

  Future<void> logout() async {
    kStorage.remove("token");
    print('logged out');
  }

  Future<String?> getToken() async {
    return kStorage.read("token");
  }
}
