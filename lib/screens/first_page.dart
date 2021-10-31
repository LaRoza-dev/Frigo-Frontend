import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:Frigo/components/buttons.dart';
import 'package:Frigo/constants.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.white,
                    child: Image.asset(
                      'asset/images/FirstPageImage.png',
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(alignment: Alignment.center, children: [
                    Container(
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [kPrimaryColor,kPrimaryColor2],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
                    ),
                    Positioned(
                      top: height * 0.07,
                      child: Column(
                        children: [
                          MainButton(
                            onPressed: () {
                              Get.toNamed('/signin');
                            },
                            buttonTitle: 'Login',
                            fontColor: kTextColor2,
                          ),
                          MainButton(
                            onPressed: () {
                              Get.toNamed('/signup');
                            },
                            buttonTitle: 'Sign up',
                            color: Colors.white,
                            fontColor: kTextColor1,
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
            Positioned(
              top: height * 0.05,
              left: width * 0.07,
              right: width * 0.1,
              child: Container(
                child: AutoSizeText('All foods that you can easily cook in a single app.',maxLines: 3,
                    style: kHeading1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
