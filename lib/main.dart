import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fridge/screens/first_page.dart';
import 'package:fridge/screens/signin_page.dart';
import 'package:fridge/screens/signup_page.dart';
import 'package:fridge/services/networking.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  User user = User(email: "mehdi@laroza.dev", password: "password123");
  user.login();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}
