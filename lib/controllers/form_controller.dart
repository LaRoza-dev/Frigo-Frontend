import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passwordController,
      passowrdRepeatController;
  String? email;
  String? password;
  String? passwordRepeat;

  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');

  final signupPasswordrequiredValidator =
      RequiredValidator(errorText: 'Password is required');

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'^(?=.*[0-9])(?=.*[a-zA-Z])(?=\S+$).+$',
        errorText: 'Passwords must have at least one letter and one number')
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter a valid email address')
  ]);

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passowrdRepeatController = TextEditingController();
  }


  bool checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    } else {
      loginFormKey.currentState!.save();
      return true;
    }
  }
}
