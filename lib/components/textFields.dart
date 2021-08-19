import 'package:flutter/material.dart';
import 'package:fridge/constants.dart';

class InsertTextFlied extends StatelessWidget {
  const InsertTextFlied(
      {required this.width,
      required this.text,
      this.textAction: TextInputAction.next,
      this.onPressed,
      this.onChanged,
      this.validator,
      this.controller,
      this.onSaved,
      this.obscureText = false});

  final double width;
  final String text;
  final textAction;
  final VoidCallback? onPressed;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * 0.9,
        //height: 40,
        child: TextFormField(
          obscureText: obscureText,
          onSaved: onSaved,
          controller: controller,
          validator: validator,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: textAction,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10.0),
            hintText: text,
            hintStyle: kFormField,
            isCollapsed: true,
            errorStyle: TextStyle(fontSize: 10, color: kPrimaryColor),
          ),
          onTap: onPressed,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
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
