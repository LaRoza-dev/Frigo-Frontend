import 'dart:ui';
import 'package:Frigo/controllers/user_controller.dart';
import 'package:Frigo/models/user.dart';
import 'package:flutter/material.dart';
import 'package:Frigo/components/textFields.dart';
import 'package:Frigo/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Future<dynamic> profileModalMenu(BuildContext context) async {
  // double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  User user = await Get.find<User>().getMe();

  DateTime now = DateTime.now();
  DateTime selectedDate = DateTime(
      int.parse(user.birthdate?.split('/')[0] ?? now.year.toString()),
      int.parse(user.birthdate?.split('/')[1] ?? now.month.toString()),
      int.parse(user.birthdate?.split('/')[2] ?? now.day.toString()));

  print(selectedDate);
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          'Profile',
                          style: kHeading2.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: height * 0.065,
                    backgroundColor: Colors.white,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Upload Image',
                      style: kText1.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormField(
                        text: 'Name',
                        textFieldHint: user.fullname ?? 'Enter your name',
                      ),
                      FormField(
                        text: 'Email',
                        textFieldHint: user.email ?? 'Enter your Email address',
                      ),
                      FormField(
                        readOnly: true,
                        text: 'Date',
                        textFieldHint:
                            user.birthdate ?? 'Tap to choose the date',
                        onPressed: () async {
                          print('Clicked!');
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime.now()
                                  .subtract(Duration(days: 365 * 150)),
                              lastDate: DateTime.now());
                        },
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: kText1,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    GenderButton(
                                      color: kBackgroundColor,
                                      icon: FontAwesomeIcons.male,
                                    ),
                                    GenderButton(
                                      color: kFieldTextColor,
                                      icon: FontAwesomeIcons.female,
                                    ),
                                  ],
                                )),
                            SizedBox(height: 20),
                          ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Center(
                                child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class GenderButton extends StatelessWidget {
  const GenderButton({required this.color, required this.icon});
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: FaIcon(
              icon,
              color: kTileColor,
            ),
          ),
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField(
      {required this.text,
      this.textFieldHint = 'data',
      this.onPressed,
      this.readOnly = false});
  final String text;
  final String textFieldHint;
  final VoidCallback? onPressed;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          text,
          style: kText1,
        ),
        InsertTextFlied(
          readOnly: this.readOnly,
          text: textFieldHint,
          width: 20,
          onPressed: onPressed,
        )
      ]),
    );
  }
}
