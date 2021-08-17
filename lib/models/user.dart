import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var user = User(email: "", password: "");
  void setEmail(email) {
    user.email = email;
    update();
  }

  void setPassword(password) {
    user.password = password;
    update();
  }
}

class User extends GetConnect {
  User({this.email, this.password});

  String? email = "";
  String? password = "";
  String? token = "";

  void onInit() {
    httpClient.baseUrl = 'https://api.laroza.dev';
  }

  Future<String?> login() async {
    var reqBody = {"email": email, "password": password};
    var response = await post('/login', reqBody);

    // Map<dynamic, dynamic> decodedRes = json.decode(response.data.toString());
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
    String? token = kStorage.read("token");
    token = token;
    return token;
  }
}
