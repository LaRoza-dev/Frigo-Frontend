import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum googleLoginStatus { loggedIn, signedUp, error, cancelled }

class User extends GetConnect {
  User({this.email, this.password, this.fullname});

  String? fullname = "";
  String? email = "";
  String? password = "";
  String? baseUrl = "https://api.laroza.dev";

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<googleLoginStatus> handleSignIn() async {
    try {
      GoogleSignInAccount? res = await _googleSignIn.signIn();

      if (res == null) {
        return googleLoginStatus.cancelled;
      }

      var data = {"email": res.email, "displayName": res.displayName};
      var response = await post('/google/', data);

      if (response.statusCode == 404) {
        return googleLoginStatus.error;
      } else if (response.body["access_token"] != null) {
        String? value = response.body["access_token"].toString();

        String key = 'token';
        await kStorage.write(key, value);

        String? testRes = kStorage.read<String?>(key);
        print({testRes});
        return googleLoginStatus.loggedIn;
      } else {
        return googleLoginStatus.signedUp;
      }
    } catch (error) {
      return googleLoginStatus.error;
    }
  }

  // void onInit() {
  //   httpClient.baseUrl = 'https://api.laroza.dev';
  // }

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

  Future<String?> signup(email, password, fullName) async {
    var reqBody = {"fullname": fullname, "email": email, "password": password};
    var response = await post('/register', reqBody);

    Map<dynamic, dynamic> decodedRes = response.body;

    final String? value = decodedRes["access_token"];
    final String key = 'token';

    await kStorage.write(key, value);

    //TODO: it can be removed (or changed with a proper result)
    final String? testRes = kStorage.read<String?>(key);

    return (testRes);
  }

  Future<void> logout() async {
    kStorage.remove("token");
    print('logged out');
  }

  Future<String?> getToken() async {
    return kStorage.read("token");
  }
}
