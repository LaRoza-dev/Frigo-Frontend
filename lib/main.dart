import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fridge/screens/first_page.dart';
import 'package:fridge/screens/signin_page.dart';
import 'package:fridge/screens/signup_page.dart';
import 'package:fridge/screens/home_page.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/services/networking.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Future<String>? initialRoute() async {
    String? token;
    token = await kStorage.read(key: 'token');
    print({'token': token});
    return (token == null ? '/' : '/home');
  }

  runApp(Main(initialRoute: await initialRoute()));
}

class Main extends StatelessWidget {
  Main({this.initialRoute = '/'});
  final initialRoute;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => User(),
      child: MaterialApp(
        initialRoute: initialRoute,
        routes: {
          '/': (context) => FirstPage(),
          '/signin': (context) => SignInPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
