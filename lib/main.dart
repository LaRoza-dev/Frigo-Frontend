import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: new Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                    child: new Text(
                      'All foods that you can easily in a single app.',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff0D1863),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: new Container(
                  decoration:
                      new BoxDecoration(color: Color.fromRGBO(160, 77, 255, 1)),
                ),
              ),
            ],
          ),
          Positioned(
            top: height*0.25,
            left: width*0.1,
            right: width*0.1,
            child: SvgPicture.asset(
              'asset/images/test.svg',height: height*0.55,width: width*0.5,
            ),
          ),
        ],
      ),
    );
  }
}
