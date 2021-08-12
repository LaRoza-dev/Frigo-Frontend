import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/components/buttons.dart';
import 'package:fridge/components/textFields.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                          flex: 8,
                          child: Text(
                            'Sign Up',
                            style: kHeading1,
                            textAlign: TextAlign.center,
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
                    child: SvgPicture.asset(
                      'asset/images/SignUpPageImage.svg',
                      alignment: Alignment.center,
                    ),
                  ),
                  InsertTextFlied(
                    width: width,
                    text: 'User name',
                  ),
                  InsertTextFlied(
                    width: width,
                    text: 'Full name',
                  ),
                  InsertTextFlied(
                    width: width,
                    text: 'Password',
                  ),
                  InsertTextFlied(
                    width: width,
                    text: 'Repeat Password',
                    textAction: TextInputAction.done,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainButton(
                      onTap: () {},
                      buttonTitle: 'Sign up',
                      fontColor: kTextColor2,
                    ),
                  ),
                  Text(
                    'OR',
                    style: ktext2.copyWith(
                      shadows: [
                        Shadow(
                          offset: Offset(3.0, 6.0),
                          blurRadius: 6.0,
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.facebook),
                          iconSize: 45,
                          color: Color.fromRGBO(13, 24, 100, 0.9),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.googlePlus),
                          iconSize: 45,
                          color: Color.fromRGBO(13, 24, 100, 0.9),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.07),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
