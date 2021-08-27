import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/constants.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {required this.onPressed,
      required this.buttonTitle,
      this.color: kButtonColor,
      this.fontColor: Colors.white});

  final VoidCallback onPressed;
  final String buttonTitle;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                offset: Offset(3, 6),
              ),
            ],
            color: color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white)),
        child: Center(
          child: SizedBox.expand(
            child: TextButton(
              onPressed: onPressed,
              child: Text(buttonTitle),
              style: TextButton.styleFrom(
                primary: fontColor,
                textStyle: kText1,
              ),
            ),
          ),
        ),
        margin: EdgeInsets.all(7.0),
        padding: EdgeInsets.all(1.0),
        width: 265,
        height: 45,
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton(
      {required this.text,
      required this.onPressed,
      this.backgroundColor = Colors.white,
      this.textColor = kTileColor});
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                offset: Offset(3, 6),
              )
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                SizedBox(width: 12),
                Text(text,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  CircleIconButton({this.onColor:Colors.red,this.color:Colors.white,required this.icon,required this.onPressed,this.size:25});
  final Color onColor;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  final int size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: FaIcon(
        icon,
        size: 25,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        primary: color, // <-- Button color
        onPrimary: onColor, // <-- Splash color
      ),
    );
  }
}