import 'package:flutter/material.dart';
import 'package:fridge/main.dart';
import 'package:fridge/models/user.dart';
import 'package:fridge/screens/first_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: TextButton(
        child: Text('LOG OUT'),
        onPressed: () {
          Get.find<User>().logout();
          Get.toNamed('/');
        },
      )),
    );
  }
}
