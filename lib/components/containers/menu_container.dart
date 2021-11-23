import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:Frigo/constants.dart';
import 'package:Frigo/components/profile_modal.dart';
import 'package:get/get.dart';
import 'package:Frigo/models/user.dart';

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
          ModalTile(title: 'Contact us', onPressed: () {}),
          ModalTile(title: 'Donate', onPressed: () {}),
          ModalTile(
              title: 'َSign Out',
              onPressed: () {
                Get.find<User>().logout();
                Get.find<User>().handleSignOut();
                Get.offAllNamed('/signin');
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
