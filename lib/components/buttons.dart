import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {required this.onTap,
      required this.buttonTitle,
      this.color: kButtonColor,
      this.fontColor: Colors.white});

  final VoidCallback onTap;
  final String buttonTitle;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white)),
        child: Center(
          child: SizedBox.expand(
            child: TextButton(
              onPressed: onTap,
              child: Text(buttonTitle),
              style: TextButton.styleFrom(
                primary: fontColor,
                textStyle: kText1,
              ),
            ),
          ),
        ),
        margin: EdgeInsets.all(7.0),
        padding: EdgeInsets.all(2.0),
        width: 265,
        height: 45,
      ),
    );
  }
}
