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
              onPressed: () {},
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
            ModalTile(title: 'About Us', onPressed: () {}),
            ModalDivider(),
            ModalTile(title: 'Contact', onPressed: () {}),
            ModalDivider(),
            ModalTile(title: 'Notification', onPressed: () {}),
            ModalDivider(),
            ModalTile(title: 'َSign Out', onPressed: () {}),
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
    return ListTile(
      onTap: onPressed,
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
