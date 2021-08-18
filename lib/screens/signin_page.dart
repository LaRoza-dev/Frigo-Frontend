import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/components/buttons.dart';
import 'package:fridge/components/textFields.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/models/user.dart';
import 'package:fridge/screens/home_page.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:fridge/controllers/user_controller.dart';

class SignInPage extends StatelessWidget {
  final UserController controller = Get.put(UserController());

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            'Sign In',
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
                      'asset/images/SignInPageImage.svg',
                      alignment: Alignment.center,
                    ),
                  ),
                  GetBuilder<UserController>(builder: (_) {
                    return InsertTextFlied(
                      width: width,
                      text: 'mehdi@laroza.dev',
                      onChanged: (username) {
                        _.setEmail(username);
                      },
                    );
                  }),
                  GetBuilder<UserController>(builder: (_) {
                    return InsertTextFlied(
                      width: width,
                      text: 'Password',
                      textAction: TextInputAction.done,
                      // onChanged: user.state.setPassword,
                      onChanged: (password) {
                        _.setPassword(password);
                        // Get.find<UserController>().setPassword(password);
                      },
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainButton(
                      onTap: () async {
                        await Get.find<User>().login();
                        Get.toNamed('/home');
                      },
                      buttonTitle: 'Sign in',
                      fontColor: kTextColor2,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot your password?',
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
                        SizedBox(
                          height: height * 0.02,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
