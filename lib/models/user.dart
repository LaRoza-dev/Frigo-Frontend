import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';

class User extends GetConnect {
  User({this.email, this.password});

  String? fullname = "";
  String? email = "";
  String? password = "";
  String? baseUrl = "https://api.laroza.dev";

  // void onInit() {
  //   httpClient.baseUrl = 'https://api.laroza.dev';
  // }

  Future<bool> login(email, password) async {
    var reqBody = {"email": email, "password": password};
    print({reqBody});
    var response = await post("/login", reqBody);
    print(response.body);

//TODO: need to get respongse code, not body.
    if (response.body == "Incorrect email or password") {
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

  Future<String?> signup() async {
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
