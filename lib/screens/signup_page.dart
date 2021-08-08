import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: FaIcon(FontAwesomeIcons.chevronLeft)),
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: kHeading1,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(
                  'asset/images/SignUpPageImage.svg',
                  alignment: Alignment.center,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
