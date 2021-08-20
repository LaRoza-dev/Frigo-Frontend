import 'package:fridge/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var user = User(email: "", password: "");

  void setEmail(email) {
    user.email = email;
    update();
  }

  void setPassword(password) {
    user.password = password;
    print({user.email});
    update();
  }

  void setFullname(fullname) {
    user.fullname = fullname;
    update();
  }

  Future<bool> login() async {
    return await user.login(user.email, user.password);
  }

  Future<googleLoginStatus?> googleLogin() async {
    return await user.handleSignIn();
  }
}
