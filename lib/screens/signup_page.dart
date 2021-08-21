import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/components/buttons.dart';
import 'package:fridge/components/textFields.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/controllers/form_controller.dart';
import 'package:get/get.dart';
import 'package:fridge/controllers/user_controller.dart';
import 'package:fridge/models/user.dart';

class SignUpPage extends GetView {
  // const SignUpPage({Key? key}) : super(key: key);
  final FormController formController = Get.put(FormController());
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<User>(() => User());
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
              child: Form(
                //autovalidateMode: AutovalidateMode.always,
                key: formController.loginFormKey,
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
                                  Get.back();
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
                    GetBuilder<UserController>(builder: (_) {
                      return InsertTextFlied(
                          width: width,
                          text: 'User name',
                          validator: formController.emailValidator,
                          controller: formController.emailController,
                          onSaved: (value) {
                            formController.email = value;
                          },
                          onChanged: (username) {
                            _.setEmail(username);
                          });
                    }),
                    GetBuilder<UserController>(builder: (_) {
                      return InsertTextFlied(
                        width: width,
                        text: 'Full name',
                        validator: formController.requiredValidator,
                        onChanged: (fullName) {
                          _.setFullname(fullName);
                        },
                      );
                    }),
                    GetBuilder<UserController>(builder: (_) {
                      return InsertTextFlied(
                        width: width,
                        text: 'Password',
                        validator: formController.passwordValidator,
                        controller: formController.passwordController,
                        onSaved: (value) {
                          formController.password = value;
                        },
                        obscureText: true,
                        onChanged: (password) {
                          formController.password = password;
                          _.setPassword(password);
                        },
                      );
                    }),
                    InsertTextFlied(
                      width: width,
                      text: 'Repeat Password',
                      textAction: TextInputAction.done,
                      controller: formController.passowrdRepeatController,
                      onSaved: (value) {
                        formController.passwordRepeat = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        if (value != formController.password) {
                          return 'Confimation password does not match the entered password';
                        }
                      },
                      obscureText: true,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 20),
                        child: GetBuilder<UserController>(
                          builder: (_) {
                            return MainButton(
                              onPressed: () async {
                                if (formController.checkLogin()) {
                                  String? result = await _.signUp();
                                }
                              },
                              buttonTitle: 'Sign up',
                              fontColor: kTextColor2,
                            );
                          },
                        )),
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
                    GoogleButton(
                        text: 'Sign Up with Google',
                        backgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {}),
                    SizedBox(height: height * 0.07),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
