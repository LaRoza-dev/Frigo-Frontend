import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';

class InsertTextFlied extends StatelessWidget {
  const InsertTextFlied({required this.width,required this.text}); 

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * 0.9,
        height: 40,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10.0),
              hintText: text,
              hintStyle: kFormField,
              isCollapsed: true),
        ),
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 15,
              offset: const Offset(0, 15),
            ),
          ],
        ),
      ),
    );
  }
}