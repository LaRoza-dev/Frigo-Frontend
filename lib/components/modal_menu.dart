import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ModalMenu extends StatefulWidget {
  const ModalMenu({Key? key}) : super(key: key);

  @override
  _ModalMenuState createState() => _ModalMenuState();
}

class _ModalMenuState extends State<ModalMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Modal Bottom Sheet',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MODAL MENU EXAMPLE'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
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
              },
              child: Text('Click Me'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
