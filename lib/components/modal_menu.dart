import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              onTap: () {},
              trailWidget: IconButton(
                icon: Icon(
                  FontAwesomeIcons.chevronDown,
                  color: kButtonColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            ModalDivider(),
            ModalTile(title: 'About Us', onTap: () {}),
            ModalDivider(),
            ModalTile(title: 'Contact', onTap: () {}),
            ModalDivider(),
            ModalTile(title: 'Notification', onTap: () {}),
            ModalDivider(),
            ModalTile(title: 'َSign Out', onTap: () {}),
          ],
        ),
      ),
    ),
  );
}

class ModalTile extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Widget? trailWidget;
  ModalTile({required this.title, required this.onTap, this.trailWidget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: kHeading3,
      ),
      trailing: trailWidget,
    );
  }
}

class ModalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 20,
      endIndent: 20,
    );
  }
}
