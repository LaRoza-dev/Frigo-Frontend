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
    update();
  }

  void setFullname(fullname) {
    user.fullname = fullname;
    update();
  }
}
