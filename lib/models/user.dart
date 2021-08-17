import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';

// var options = BaseOptions(
//   baseUrl: 'https://api.laroza.dev',
//   connectTimeout: 5000,
//   receiveTimeout: 3000,
// );
// Dio dio = Dio(options);

class UserController extends GetxController {
// var user = User(name: "Aachman").obs; // declare just like any other variable

//   void changeName() => user.value.email = "Garg";

  var user = User(email: "", password: "");
  void setEmail(email) {
    user.email = email;
    update();
  }

  void setPassword(password) {
    user.password = password;
    update();
  }
  // increment() => count++;
}

//TODO: why change notifier ?

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

    //TODO: what's this ? it can be removed (or changed with a proper result)
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
