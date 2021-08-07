import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {required this.onTap,
      required this.buttonTitle,
      this.color: kButtonColor,
      this.fontColor: Colors.white});

  final Function onTap;
  final String buttonTitle;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white)),
        child: Center(
          child: Text(
            buttonTitle,
            style: kText1(color: fontColor),
            textAlign: TextAlign.center,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        width: width * 0.7,
        height: height * 0.07,
      ),
    );
  }
}
