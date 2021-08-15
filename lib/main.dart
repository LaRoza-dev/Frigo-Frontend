import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fridge/screens/first_page.dart';
import 'package:fridge/screens/signin_page.dart';
import 'package:fridge/screens/signup_page.dart';
import 'package:fridge/screens/home_page.dart';
import 'package:fridge/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  runApp(ProviderScope(child: Main(/*initialRoute: await initialRoute()*/)));
}

final initialRouteProvider = FutureProvider<String>((ref) async {
  String? token;
  token = await kStorage.read(key: 'token');

  return (token == null ? '/' : '/home');
});

class Main extends ConsumerWidget {
  // Main({this.initialRoute = '/'});
  // final initialRoute;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final initialRoute = watch(initialRouteProvider);

    initialRoute.when(
      data: (data) {
        return MaterialApp(
          initialRoute: data,
          routes: {
            '/': (context) => FirstPage(),
            '/signin': (context) => SignInPage(),
            '/signup': (context) => SignUpPage(),
            '/home': (context) => HomePage(),
          },
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (e, st) => Text('Error: $e'),
    );
    return MaterialApp(
      home: Text('hey'),
    );
  }
}
