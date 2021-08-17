import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fridge/screens/first_page.dart';
import 'package:fridge/screens/signin_page.dart';
import 'package:fridge/screens/signup_page.dart';
import 'package:fridge/screens/home_page.dart';
import 'package:get_storage/get_storage.dart';
import 'models/user.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<User>(() => User());

  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();

    return GetMaterialApp(getPages: [
      GetPage(
          name: '/',
          page: () {
            return box.hasData('token') ? HomePage() : FirstPage();
          }),
      GetPage(name: '/signin', page: () => SignInPage()),
      GetPage(name: '/signup', page: () => SignUpPage()),
    ]);
  }
}
