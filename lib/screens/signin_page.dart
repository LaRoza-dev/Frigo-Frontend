import 'package:flutter/material.dart';
import 'package:Frigo/constants.dart';
import 'package:Frigo/components/buttons.dart';
import 'package:Frigo/components/textFields.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Frigo/models/user.dart';
import 'package:get/get.dart';
import 'package:Frigo/controllers/user_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:Frigo/controllers/form_controller.dart';

class SignInPage extends StatelessWidget {
  final UserController usercontroller = Get.put(UserController());
  final FormController formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<User>(() => User());
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          reverse: true,
          child: Container(
            height:MediaQuery.of(context).size.height*0.9,
            width:MediaQuery.of(context).size.width,
            child: Form(
              key: formController.loginFormKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {
                                Get.offAllNamed('/');
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        child: Image.asset(
                          'asset/images/SignInPageImage.png',
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GetBuilder<UserController>(builder: (_) {
                          return InsertTextFlied(
                            width: width,
                            text: 'Username (Email)',
                            validator: formController.emailValidator,
                            controller: formController.emailController,
                            onSaved: (value) {
                              formController.email = value;
                              _.setEmail(value);
                            },
                          );
                        }),
                        GetBuilder<UserController>(builder: (_) {
                          return InsertTextFlied(
                            width: width,
                            text: 'Password',
                            textAction: TextInputAction.done,
                            validator:
                                formController.signupPasswordrequiredValidator,
                            controller: formController.passwordController,
                            onSaved: (value) {
                              formController.password = value;
                              _.setPassword(value);
                            },
                            obscureText: true,
                          );
                        }),
                      ],
                    ),
                    Column(
                      children: [
                        GetBuilder<UserController>(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: MainButton(
                              onPressed: () async {
                                if (formController.checkLogin()) {
                                  bool res = await _.login();
                                  if (res) {
                                    Get.toNamed('/home');
                                  } else {
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: "Permission Denied",
                                      desc:
                                          "Username or Password is incorrect.",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Ok",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          width: 120,
                                        )
                                      ],
                                    ).show();
                                  }
                                }
                              },
                              buttonTitle: 'Sign in',
                              fontColor: kTextColor2,
                            ),
                          );
                        }),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
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
                        ),
                        GetBuilder<UserController>(builder: (_) {
                          return GoogleButton(
                              text: 'Sign in with Google',
                              onPressed: () async {
                                googleLoginStatus? res = await _.googleLogin();
                                print({"res": res});
                                if (res == googleLoginStatus.error) {
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "Permission Denied",
                                    desc: "Username or Password is incorrect.",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                } else if (res == googleLoginStatus.loggedIn) {
                                  Get.toNamed('/home');
                                } else {
                                  return Future.value();
                                }
                              });
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
