import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fridge/components/buttons.dart';
import 'package:fridge/constants.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset(
                  'asset/images/FirstPageImage.svg',
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Expanded(
                flex: 1,
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    decoration: BoxDecoration(color: kPrimaryColor),
                  ),
                  Positioned(
                    top: height * 0.07,
                    child: Column(
                      children: [
                        MainButton(
                          onTap: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                          buttonTitle: 'Login',
                          fontColor: kTextColor2,
                        ),
                        MainButton(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
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
            top: height * 0.075,
            left: width * 0.1,
            right: width * 0.1,
            child: Container(
              child: Text('All foods that you can easily cook in a single app.',
                  style: kHeading1),
            ),
          ),
        ],
      ),
    );
  }
}
