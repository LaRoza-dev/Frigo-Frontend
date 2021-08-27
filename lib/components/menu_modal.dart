import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fridge/models/user.dart';

Future<dynamic> modalMenu(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ModalTile(
              title: 'Home',
              onPressed: () {},
              trailWidget: IconButton(
                icon: Icon(
                  FontAwesomeIcons.chevronDown,
                  color: kButtonColor,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            ModalTile(title: 'About Us', onPressed: () {}),
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
      ),
    ),
  );
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
