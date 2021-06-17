// ignore: must_be_immutable
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    this.hintText = 'Your Hint',
    this.icon,
    this.borderRadius = 5.0,
    this.isIcon = false,
    this.isPassword = true,
    this.textFieldWidth,
    this.controller,
    this.iconVisible,
  });
  bool? isPassword = false;
  bool? isIcon = true;
  Widget? icon = IconButton(icon: Icon(Icons.visibility_off), onPressed: () {});
  double? borderRadius = 5.0;
  String? hintText;
  double? textFieldWidth = 300;
  TextEditingController? controller = TextEditingController();
  VoidCallback? iconVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: textFieldWidth == null
          ? MediaQuery.of(context).size.width
          : textFieldWidth,
      child: TextField(
          controller: controller,
          obscureText: isPassword!,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: hintText,
            suffixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          )),
    );
  }
}
