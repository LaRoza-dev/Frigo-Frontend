import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fridge/components/textFields.dart';

Future<dynamic> fridgeModal(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: double.infinity,
        height: height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fridge',
                      style: kHeading2,
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.chevronDown,
                        color: kButtonColor,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ]),
            ),
            InsertTextFlied(
              width: width,
              text: 'Search',
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ModalTile(
                    title: 'Fridge item 1',
                    onPressed: () {},
                  ),ModalTile(
                    title: 'Fridge item 2',
                    onPressed: () {},
                  )
                ],
              ),
            )
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
            trailing: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.heart,
                      color: kButtonColor,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.times,
                      color: kButtonColor,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )),
        Divider(
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}


