// ignore: must_be_immutable
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    this.icon = Icons.visibility_off,
    this.hintText = 'Your Hint',
    this.borderRadius = 5.0,
    this.isIcon = false,
    this.isPassword = true,
    this.textFieldWidth,
  });
  bool? isPassword = false;
  bool? isIcon = true;
  IconData? icon = Icons.visibility_off;
  double? borderRadius = 5.0;
  String? hintText;
  double? textFieldWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: textFieldWidth == null
          ? MediaQuery.of(context).size.width
          : textFieldWidth,
      child: TextField(
          obscureText: isPassword!,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: hintText,
            suffixIcon: isIcon! ? Icon(icon) : SizedBox(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          )),
    );
  }
}
