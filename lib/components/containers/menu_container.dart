import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:fridge/components/profile_modal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fridge/models/user.dart';

class MenuContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ModalTile(
              title: 'Profile',
              onPressed: () {
                profileModalMenu(context);
              }),
          ModalTile(title: 'Contact', onPressed: () {}),
          ModalTile(title: 'Notification', onPressed: () {}),
          ModalTile(
              title: 'َSign Out',
              onPressed: () {
                Get.find<User>().logout();
                Get.find<User>().handleSignOut();
                Get.offAllNamed('/');
              }),
        ],
      ),
    );
  }
}

class ModalTile extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Widget? trailWidget;
  ModalTile({required this.title, required this.onPressed, this.trailWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          title: Text(
            title,
            style: kHeading3,
          ),
          trailing: trailWidget,
        ),
        Divider(
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
