import 'package:Frigo/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  User user = User();

  void setEmail(email) {
    user.email = email;
  }

  void setPassword(password) {
    user.password = password;
  }

  void setFullname(fullname) {
    user.fullname = fullname;
  }

  void setBirthday(birthdate) {
    user.birthdate = birthdate;
  }

  Future<bool> login() async {
    return await user.login(user.email, user.password);
  }

  Future<bool> signUp() async {
    return await user.signup(user.email, user.password, user.fullname);
  }

  Future<googleLoginStatus?> googleLogin() async {
    return await user.handleSignIn();
  }
}
