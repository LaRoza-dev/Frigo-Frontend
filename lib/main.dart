import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fridge/screens/first_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}
