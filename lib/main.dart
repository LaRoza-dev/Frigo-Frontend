import 'package:flutter/material.dart';
import 'package:Frigo/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:Frigo/screens/first_page.dart';
import 'package:Frigo/screens/signin_page.dart';
import 'package:Frigo/screens/signup_page.dart';
import 'package:Frigo/screens/home_page.dart';
import 'package:get_storage/get_storage.dart';
import 'models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  Get.lazyPut<User>(() => User());
  await GetStorage.init();
  final box = GetStorage();
  runApp(Main(await isTokenValid(box)));
}

class Main extends StatelessWidget {
  Main(this.isTokenValid);
  final isTokenValid;
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    print({"token": box.read("token")});
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: TextTheme(
                // bodyText2: TextStyle(fontSize: 45.sp),
              )),
          initialRoute: isTokenValid ? '/home' : '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => FirstPage(),
            ),
            GetPage(name: '/signin', page: () => SignInPage()),
            GetPage(name: '/signup', page: () => SignUpPage()),
            GetPage(
                name: '/home', page: () => HomePage(), binding: HomeBindings()),
          ]),
    );
  }
}

// check if token expired or not
Future<bool>? isTokenValid(box) async {
  if (box.hasData('token')) {
    var response = await http.get(
        Uri.parse(
          'https://api.laroza.dev/ping',
        ),
        headers: {'Authorization': 'Bearer ' + box.read('token')});
    if (response.statusCode == 200)
      return true;
    else
      return false;
  } else
    return false;
}
