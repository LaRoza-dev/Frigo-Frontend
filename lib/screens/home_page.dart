import 'package:flutter/material.dart';
import 'package:fridge/models/user.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final UserController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: TextButton(
        child: Text('LOG OUT'),
        onPressed: () {
          controller.user.value.logout();
          Get.toNamed('/');
        },
      )),
    );
  }
}
