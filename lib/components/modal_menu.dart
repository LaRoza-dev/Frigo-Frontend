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
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Home',
                      style: kHeading3,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: FaIcon(FontAwesomeIcons.sortDown),
                  )
                ],
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'About Us',
                  style: kHeading3,
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Contact',
                  style: kHeading3,
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Notification',
                  style: kHeading3,
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign Out',
                  style: kHeading3,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
